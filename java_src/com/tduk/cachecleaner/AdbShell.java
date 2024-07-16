package com.tduk.cachecleaner;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.TextView;
import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.console.CommandHistory;
import com.tduk.cachecleaner.console.ConsoleBuffer;
import com.tduk.cachecleaner.devconn.DeviceConnection;
import com.tduk.cachecleaner.devconn.DeviceConnectionListener;
import com.tduk.cachecleaner.p004ui.Dialog;
import com.tduk.cachecleaner.p004ui.SpinnerDialog;
import com.tduk.cachecleaner.service.ShellService;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class AdbShell extends Activity implements DeviceConnectionListener, View.OnKeyListener, TextView.OnEditorActionListener {
    private static final int MAX_COMMAND_HISTORY = 15;
    private static final int MENU_ID_AUTOSCROLL = 2;
    private static final int MENU_ID_CTRL_C = 1;
    private static final int MENU_ID_EXIT = 3;
    private static final String PREFS_FILE = "AdbCmdHistoryPrefs";
    private ShellService.ShellServiceBinder binder;
    private EditText commandBox;
    private CommandHistory commandHistory;
    private SpinnerDialog connectWaiting;
    private DeviceConnection connection;
    private String hostName;
    private ConsoleBuffer lastConsoleBuffer;
    private int port;
    private Intent service;
    private ScrollView shellScroller;
    private TextView shellView;
    private boolean updateGui;
    private AtomicBoolean updateQueued = new AtomicBoolean();
    private AtomicBoolean updateRequired = new AtomicBoolean();
    private boolean autoScrollEnabled = true;
    private boolean userScrolling = false;
    private boolean scrollViewAtBottom = true;
    private StringBuilder commandBuffer = new StringBuilder();
    private ServiceConnection serviceConn = new ServiceConnection() { // from class: com.tduk.cachecleaner.AdbShell.1
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            AdbShell.this.binder = (ShellService.ShellServiceBinder) iBinder;
            if (AdbShell.this.connection != null) {
                AdbShell.this.binder.removeListener(AdbShell.this.connection, AdbShell.this);
            }
            AdbShell adbShell = AdbShell.this;
            adbShell.connection = adbShell.connectOrLookupConnection(adbShell.hostName, AdbShell.this.port);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            AdbShell.this.binder = null;
        }
    };

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean canReceiveData() {
        return false;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean isConsole() {
        return true;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void receivedData(DeviceConnection deviceConnection, byte[] bArr, int i, int i2) {
    }

    @Override // android.app.Activity
    public void onNewIntent(Intent intent) {
        this.hostName = intent.getStringExtra("IP");
        int intExtra = intent.getIntExtra("Port", -1);
        this.port = intExtra;
        if (this.hostName == null || intExtra == -1) {
            finish();
            return;
        }
        setTitle("TDUK APP Cache Cleaner");
        ShellService.ShellServiceBinder shellServiceBinder = this.binder;
        if (shellServiceBinder == null) {
            getApplicationContext().bindService(this.service, this.serviceConn, 1);
            return;
        }
        DeviceConnection deviceConnection = this.connection;
        if (deviceConnection != null) {
            shellServiceBinder.removeListener(deviceConnection, this);
        }
        this.connection = connectOrLookupConnection(this.hostName, this.port);
    }

    private DeviceConnection startConnection(String str, int i) {
        this.connectWaiting = SpinnerDialog.displayDialog(this, "Connecting to " + this.hostName + ":" + i, "Please make sure the target device has network ADB enabled.\n\nYou may need to accept a prompt on the target device if you are connecting to it for the first time from this device.\n\nIf you see this message for more than 5 seconds, press back on the remote and then click on Connect", true);
        DeviceConnection createConnection = this.binder.createConnection(str, i);
        this.binder.addListener(createConnection, this);
        createConnection.startConnect();
        return createConnection;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public DeviceConnection connectOrLookupConnection(String str, int i) {
        DeviceConnection findConnection = this.binder.findConnection(str, i);
        if (findConnection == null) {
            return startConnection(str, i);
        }
        this.binder.addListener(findConnection, this);
        return findConnection;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(com.tduk.appklr.R.layout.activity_adb_shell);
        this.shellView = (TextView) findViewById(com.tduk.appklr.R.id.shellView);
        this.commandBox = (EditText) findViewById(com.tduk.appklr.R.id.command);
        this.shellScroller = (ScrollView) findViewById(com.tduk.appklr.R.id.shellScroller);
        this.commandBox.setText("pm clear org.xbmc.kodi");
        View.OnLongClickListener onLongClickListener = new View.OnLongClickListener() { // from class: com.tduk.cachecleaner.AdbShell.2
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View view) {
                AdbShell adbShell = AdbShell.this;
                adbShell.openContextMenu(adbShell.commandBox);
                return true;
            }
        };
        final ViewTreeObserver.OnScrollChangedListener onScrollChangedListener = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.tduk.cachecleaner.AdbShell.3
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                if (AdbShell.this.shellScroller.getChildAt(0).getBottom() - (AdbShell.this.shellScroller.getHeight() + AdbShell.this.shellScroller.getScrollY()) <= 0) {
                    AdbShell.this.doAsyncGuiUpdate();
                    AdbShell.this.scrollViewAtBottom = true;
                    return;
                }
                AdbShell.this.scrollViewAtBottom = false;
            }
        };
        this.shellScroller.setOnTouchListener(new View.OnTouchListener() { // from class: com.tduk.cachecleaner.AdbShell.4
            /* JADX WARN: Code restructure failed: missing block: B:8:0x0018, code lost:
                if (r5 != 3) goto L8;
             */
            @Override // android.view.View.OnTouchListener
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public boolean onTouch(android.view.View r4, android.view.MotionEvent r5) {
                /*
                    r3 = this;
                    com.tduk.cachecleaner.AdbShell r4 = com.tduk.cachecleaner.AdbShell.this
                    android.widget.ScrollView r4 = com.tduk.cachecleaner.AdbShell.access$600(r4)
                    android.view.ViewTreeObserver r4 = r4.getViewTreeObserver()
                    int r5 = r5.getActionMasked()
                    r0 = 0
                    r1 = 1
                    if (r5 == 0) goto L2e
                    if (r5 == r1) goto L1b
                    r2 = 2
                    if (r5 == r2) goto L2e
                    r4 = 3
                    if (r5 == r4) goto L1b
                    goto L38
                L1b:
                    com.tduk.cachecleaner.AdbShell r4 = com.tduk.cachecleaner.AdbShell.this
                    boolean r4 = com.tduk.cachecleaner.AdbShell.access$800(r4)
                    if (r4 == 0) goto L28
                    com.tduk.cachecleaner.AdbShell r4 = com.tduk.cachecleaner.AdbShell.this
                    com.tduk.cachecleaner.AdbShell.access$700(r4)
                L28:
                    com.tduk.cachecleaner.AdbShell r4 = com.tduk.cachecleaner.AdbShell.this
                    com.tduk.cachecleaner.AdbShell.access$902(r4, r0)
                    goto L38
                L2e:
                    android.view.ViewTreeObserver$OnScrollChangedListener r5 = r2
                    r4.addOnScrollChangedListener(r5)
                    com.tduk.cachecleaner.AdbShell r4 = com.tduk.cachecleaner.AdbShell.this
                    com.tduk.cachecleaner.AdbShell.access$902(r4, r1)
                L38:
                    return r0
                */
                throw new UnsupportedOperationException("Method not decompiled: com.tduk.cachecleaner.AdbShell.View$OnTouchListenerC13754.onTouch(android.view.View, android.view.MotionEvent):boolean");
            }
        });
        this.commandBox.setImeActionLabel("Run", 6);
        this.commandBox.setOnEditorActionListener(this);
        this.commandBox.setOnKeyListener(this);
        this.commandBox.setOnLongClickListener(onLongClickListener);
        registerForContextMenu(this.commandBox);
        registerForContextMenu(this.shellView);
        this.commandHistory = CommandHistory.loadCommandHistoryFromPrefs(15, this, PREFS_FILE);
        this.service = new Intent(this, ShellService.class);
        onNewIntent(getIntent());
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        getApplicationContext().startService(this.service);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        DeviceConnection deviceConnection;
        this.commandHistory.save();
        ShellService.ShellServiceBinder shellServiceBinder = this.binder;
        if (shellServiceBinder != null && (deviceConnection = this.connection) != null) {
            shellServiceBinder.notifyDestroyingActivity(deviceConnection);
            this.binder.removeListener(this.connection, this);
        }
        if (this.connectWaiting != null) {
            AdbUtils.safeAsyncClose(this.connection);
        }
        if (this.binder != null) {
            getApplicationContext().unbindService(this.serviceConn);
        }
        Dialog.closeDialogs();
        SpinnerDialog.closeDialogs();
        super.onDestroy();
    }

    @Override // android.app.Activity
    public void onResume() {
        ShellService.ShellServiceBinder shellServiceBinder = this.binder;
        if (shellServiceBinder != null) {
            shellServiceBinder.notifyResumingActivity(this.connection);
        }
        updateTerminalView();
        this.updateGui = true;
        super.onResume();
    }

    @Override // android.app.Activity
    public void onPause() {
        ShellService.ShellServiceBinder shellServiceBinder = this.binder;
        if (shellServiceBinder != null) {
            shellServiceBinder.notifyPausingActivity(this.connection);
        }
        this.updateGui = false;
        super.onPause();
    }

    @Override // android.app.Activity, android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        super.onCreateContextMenu(contextMenu, view, contextMenuInfo);
        if (view == this.commandBox) {
            this.commandHistory.populateMenu(contextMenu);
            return;
        }
        contextMenu.add(0, 1, 0, "Send Ctrl+C");
        MenuItem add = contextMenu.add(0, 2, 0, "Auto-scroll terminal");
        add.setCheckable(true);
        add.setChecked(this.autoScrollEnabled);
        contextMenu.add(0, 3, 0, "Exit Terminal");
    }

    @Override // android.app.Activity
    public boolean onContextItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 0) {
            this.commandBox.setText(menuItem.getTitle());
        } else {
            int itemId = menuItem.getItemId();
            if (itemId == 1) {
                DeviceConnection deviceConnection = this.connection;
                if (deviceConnection != null) {
                    deviceConnection.queueBytes(new byte[]{3});
                    this.scrollViewAtBottom = true;
                    doAsyncGuiUpdate();
                }
            } else if (itemId == 2) {
                menuItem.setChecked(!menuItem.isChecked());
                this.autoScrollEnabled = menuItem.isChecked();
            } else if (itemId == 3) {
                AdbUtils.safeAsyncClose(this.connection);
                finish();
            }
        }
        return true;
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        if (this.commandBox.getText().length() == 0 || this.connection == null || i != 6) {
            return false;
        }
        String obj = this.commandBox.getText().toString();
        this.commandBuffer.append(obj);
        this.commandHistory.add(obj);
        this.commandBuffer.append('\n');
        this.connection.queueCommand(this.commandBuffer.toString());
        this.commandBuffer.setLength(0);
        this.commandBox.setText("");
        this.scrollViewAtBottom = true;
        doAsyncGuiUpdate();
        return true;
    }

    @Override // android.view.View.OnKeyListener
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (i == 66) {
            return onEditorAction((TextView) view, 6, keyEvent);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTerminalView() {
        ConsoleBuffer consoleBuffer = this.lastConsoleBuffer;
        if (consoleBuffer != null) {
            consoleBuffer.updateTextView(this.shellView);
        }
        if (this.autoScrollEnabled) {
            this.shellView.post(new Runnable() { // from class: com.tduk.cachecleaner.AdbShell.5
                @Override // java.lang.Runnable
                public void run() {
                    if (AdbShell.this.scrollViewAtBottom) {
                        AdbShell.this.shellScroller.smoothScrollTo(0, AdbShell.this.shellView.getBottom());
                    }
                }
            });
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionEstablished(DeviceConnection deviceConnection) {
        this.connectWaiting.dismiss();
        this.connectWaiting = null;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionFailed(DeviceConnection deviceConnection, Exception exc) {
        this.connectWaiting.dismiss();
        this.connectWaiting = null;
        Dialog.displayDialog(this, "Connection Failed", exc.getMessage(), true);
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamFailed(DeviceConnection deviceConnection, Exception exc) {
        Dialog.displayDialog(this, "Connection Terminated", exc.getMessage(), true);
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamClosed(DeviceConnection deviceConnection) {
        Dialog.displayDialog(this, "Connection Closed", "The connection was gracefully closed.", true);
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public AdbCrypto loadAdbCrypto(DeviceConnection deviceConnection) {
        return AdbUtils.readCryptoConfig(getFilesDir());
    }

    private void setGuiDirty() {
        this.updateRequired.set(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doAsyncGuiUpdate() {
        if (this.updateRequired.get() && this.updateQueued.compareAndSet(false, true)) {
            new Thread(new Runnable() { // from class: com.tduk.cachecleaner.AdbShell.6
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Thread.sleep(250L);
                        AdbShell.this.runOnUiThread(new Runnable() { // from class: com.tduk.cachecleaner.AdbShell.6.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AdbShell.this.updateRequired.set(false);
                                AdbShell.this.updateTerminalView();
                                AdbShell.this.updateQueued.set(false);
                                if (AdbShell.this.updateRequired.get()) {
                                    AdbShell.this.doAsyncGuiUpdate();
                                }
                            }
                        });
                    } catch (InterruptedException unused) {
                    }
                }
            }).start();
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void consoleUpdated(DeviceConnection deviceConnection, ConsoleBuffer consoleBuffer) {
        this.lastConsoleBuffer = consoleBuffer;
        setGuiDirty();
        if (this.updateGui && !this.userScrolling && this.scrollViewAtBottom) {
            doAsyncGuiUpdate();
        }
    }
}
