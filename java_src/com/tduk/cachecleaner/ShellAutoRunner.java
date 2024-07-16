package com.tduk.cachecleaner;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.IBinder;
import android.provider.Settings;
import android.util.Log;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.console.CommandHistory;
import com.tduk.cachecleaner.console.ConsoleBuffer;
import com.tduk.cachecleaner.devconn.DeviceConnection;
import com.tduk.cachecleaner.devconn.DeviceConnectionListener;
import com.tduk.cachecleaner.p004ui.Dialog;
import com.tduk.cachecleaner.p004ui.SpinnerDialog;
import com.tduk.cachecleaner.service.ShellService;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class ShellAutoRunner extends Activity implements DeviceConnectionListener, View.OnKeyListener, TextView.OnEditorActionListener {
    private static final int MAX_COMMAND_HISTORY = 15;
    private static final int MENU_ID_AUTOSCROLL = 2;
    private static final int MENU_ID_CTRL_C = 1;
    private static final int MENU_ID_EXIT = 3;
    private static final String PREFS_FILE = "AdbCmdHistoryPrefs";
    private ShellService.ShellServiceBinder binder;
    Button cleanAndBootButton;
    Button cleanButton;
    private EditText commandBox;
    private CommandHistory commandHistory;
    Button connectButton;
    private SpinnerDialog connectWaiting;
    private DeviceConnection connection;
    private String hostName;
    boolean isExcludingApps;
    private SpinnerDialog keygenSpinner;
    private ConsoleBuffer lastConsoleBuffer;
    private int port;
    private Intent service;
    private ScrollView shellScroller;
    private TextView shellView;
    private boolean updateGui;
    CheckBox whiteList;
    Button whitelistButton;
    private boolean isRebooting = false;
    private AtomicBoolean updateQueued = new AtomicBoolean();
    private AtomicBoolean updateRequired = new AtomicBoolean();
    private boolean autoScrollEnabled = true;
    private boolean userScrolling = false;
    private boolean scrollViewAtBottom = true;
    private boolean _wasCleaned = false;
    private StringBuilder commandBuffer = new StringBuilder();
    private ServiceConnection serviceConn = new ServiceConnection() { // from class: com.tduk.cachecleaner.ShellAutoRunner.1
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            ShellAutoRunner.this.binder = (ShellService.ShellServiceBinder) iBinder;
            if (ShellAutoRunner.this.connection != null) {
                ShellAutoRunner.this.binder.removeListener(ShellAutoRunner.this.connection, ShellAutoRunner.this);
            }
            ShellAutoRunner shellAutoRunner = ShellAutoRunner.this;
            shellAutoRunner.connection = shellAutoRunner.connectOrLookupConnection(shellAutoRunner.hostName, ShellAutoRunner.this.port);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            ShellAutoRunner.this.binder = null;
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

    public void xyz(int i) {
        Toast.makeText(this, "Total number of background apps running: " + i, 1).show();
    }

    void connect() {
        this.hostName = "localhost";
        this.port = 5555;
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
        this.connectWaiting = SpinnerDialog.displayDialog(this, "Connecting to " + this.hostName + ":" + i, "Please make sure your device has ADB Debugging enabled.\n\nYou may need to accept a prompt on your device if you are connecting to it for the first time.\n\nIf you see this message for more than 5seconds, press Back on the remote and then click on Connect", true);
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
        setContentView(com.tduk.appklr.R.layout.activity_shell_auto_runner);
        this.shellView = (TextView) findViewById(com.tduk.appklr.R.id.shellView);
        this.commandBox = (EditText) findViewById(com.tduk.appklr.R.id.command);
        this.shellScroller = (ScrollView) findViewById(com.tduk.appklr.R.id.shellScroller);
        Button button = (Button) findViewById(com.tduk.appklr.R.id.button1);
        this.cleanButton = button;
        button.setOnClickListener(new View.OnClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ShellAutoRunner.this.autoSubmitCommand();
            }
        });
        Button button2 = (Button) findViewById(com.tduk.appklr.R.id.button_connect);
        this.connectButton = button2;
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                boolean z = false;
                boolean z2 = Settings.Global.getInt(ShellAutoRunner.this.getApplicationContext().getContentResolver(), "adb_enabled", 0) == 1;
                boolean z3 = Settings.Global.getInt(ShellAutoRunner.this.getApplicationContext().getContentResolver(), "adb_wifi_enabled", 0) == 1;
                boolean z4 = Settings.Global.getInt(ShellAutoRunner.this.getApplicationContext().getContentResolver(), "adb_over_ethernet", 0) == 1;
                boolean z5 = Settings.Global.getInt(ShellAutoRunner.this.getApplicationContext().getContentResolver(), "adb_tcp_enabled", 0) == 1;
                if (z2 || z3 || z4 || z5) {
                    z = true;
                }
                if (z) {
                    ShellAutoRunner.this.connect();
                } else {
                    Toast.makeText(ShellAutoRunner.this.getApplicationContext(), (int) com.tduk.appklr.R.string.enable_debugging, 1).show();
                }
            }
        });
        Button button3 = (Button) findViewById(com.tduk.appklr.R.id.button2);
        this.cleanAndBootButton = button3;
        button3.setOnClickListener(new View.OnClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                List<PackageInfo> installedPackages = ShellAutoRunner.this.getPackageManager().getInstalledPackages(0);
                int i = 0;
                int i2 = 0;
                while (i < installedPackages.size()) {
                    int i3 = i + 1;
                    PackageInfo packageInfo = installedPackages.get(i);
                    boolean z = (packageInfo.applicationInfo.flags & 1) != 0;
                    boolean z2 = (packageInfo.applicationInfo.flags & 2097152) != 0;
                    String str = packageInfo.applicationInfo.packageName;
                    if (!z && !z2 && !str.equals(BuildConfig.APPLICATION_ID)) {
                        i2++;
                    }
                    i = i3;
                }
                ShellAutoRunner.this.xyz(i2);
            }
        });
        Button button4 = (Button) findViewById(com.tduk.appklr.R.id.button_whitelist);
        this.whitelistButton = button4;
        button4.setOnClickListener(new View.OnClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ShellAutoRunner.this.startActivity(new Intent(ShellAutoRunner.this.whitelistButton.getContext(), AppsWhitelistActivity.class));
            }
        });
        ((Button) findViewById(com.tduk.appklr.R.id.button3)).setOnClickListener(new View.OnClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ShellAutoRunner.this.finishAffinity();
                System.exit(0);
            }
        });
        View.OnLongClickListener onLongClickListener = new View.OnLongClickListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.7
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View view) {
                ShellAutoRunner shellAutoRunner = ShellAutoRunner.this;
                shellAutoRunner.openContextMenu(shellAutoRunner.commandBox);
                return true;
            }
        };
        final ViewTreeObserver.OnScrollChangedListener onScrollChangedListener = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.8
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                if (ShellAutoRunner.this.shellScroller.getChildAt(0).getBottom() - (ShellAutoRunner.this.shellScroller.getHeight() + ShellAutoRunner.this.shellScroller.getScrollY()) <= 0) {
                    ShellAutoRunner.this.doAsyncGuiUpdate();
                    ShellAutoRunner.this.scrollViewAtBottom = true;
                    return;
                }
                ShellAutoRunner.this.scrollViewAtBottom = false;
            }
        };
        this.shellScroller.setOnTouchListener(new View.OnTouchListener() { // from class: com.tduk.cachecleaner.ShellAutoRunner.9
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
                    com.tduk.cachecleaner.ShellAutoRunner r4 = com.tduk.cachecleaner.ShellAutoRunner.this
                    android.widget.ScrollView r4 = com.tduk.cachecleaner.ShellAutoRunner.access$700(r4)
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
                    com.tduk.cachecleaner.ShellAutoRunner r4 = com.tduk.cachecleaner.ShellAutoRunner.this
                    boolean r4 = com.tduk.cachecleaner.ShellAutoRunner.access$900(r4)
                    if (r4 == 0) goto L28
                    com.tduk.cachecleaner.ShellAutoRunner r4 = com.tduk.cachecleaner.ShellAutoRunner.this
                    com.tduk.cachecleaner.ShellAutoRunner.access$800(r4)
                L28:
                    com.tduk.cachecleaner.ShellAutoRunner r4 = com.tduk.cachecleaner.ShellAutoRunner.this
                    com.tduk.cachecleaner.ShellAutoRunner.access$1002(r4, r0)
                    goto L38
                L2e:
                    android.view.ViewTreeObserver$OnScrollChangedListener r5 = r2
                    r4.addOnScrollChangedListener(r5)
                    com.tduk.cachecleaner.ShellAutoRunner r4 = com.tduk.cachecleaner.ShellAutoRunner.this
                    com.tduk.cachecleaner.ShellAutoRunner.access$1002(r4, r1)
                L38:
                    return r0
                */
                throw new UnsupportedOperationException("Method not decompiled: com.tduk.cachecleaner.ShellAutoRunner.View$OnTouchListenerC14089.onTouch(android.view.View, android.view.MotionEvent):boolean");
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
        LayoutInflater.from(this).inflate(com.tduk.appklr.R.layout.init_dialog, (ViewGroup) null);
        if (AdbUtils.readCryptoConfig(getFilesDir()) == null) {
            this.keygenSpinner = SpinnerDialog.displayDialog(this, "Generating RSA Key Pair", "This will only be done once.", true);
            new Thread(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.10
                @Override // java.lang.Runnable
                public void run() {
                    AdbCrypto writeNewCryptoConfig = AdbUtils.writeNewCryptoConfig(ShellAutoRunner.this.getFilesDir());
                    ShellAutoRunner.this.keygenSpinner.dismiss();
                    if (writeNewCryptoConfig == null) {
                        Dialog.displayDialog(ShellAutoRunner.this, "Key Pair Generation Failed", "Unable to generate and save RSA key pair", true);
                    } else {
                        Dialog.displayDialog(ShellAutoRunner.this, "New Key Pair Generated", "", false);
                    }
                }
            }).start();
        }
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

    /* JADX INFO: Access modifiers changed from: private */
    public void autoSubmitCommand() {
        List<PackageInfo> installedPackages = getPackageManager().getInstalledPackages(0);
        ArrayList<String> whitelist = AppsWhitelistUtils.getWhitelist(this);
        int i = 0;
        int i2 = -1;
        while (true) {
            if (i >= installedPackages.size()) {
                break;
            }
            int i3 = i + 1;
            PackageInfo packageInfo = installedPackages.get(i);
            boolean z = (packageInfo.applicationInfo.flags & 1) != 0;
            boolean z2 = (packageInfo.applicationInfo.flags & 2097152) != 0;
            String str = packageInfo.applicationInfo.packageName;
            if (!z && !z2 && !str.equals(BuildConfig.APPLICATION_ID) && !whitelist.contains(str)) {
                String str2 = "am force-stop " + str;
                sendCommand(str2);
                i2++;
                Log.d("sendCommand", str2);
            }
            i = i3;
        }
        if (i2 == -1) {
            Toast.makeText(this, "Total number of apps killed 0", 1).show();
        } else {
            Toast.makeText(this, "Total number of apps killed is " + i2, 1).show();
        }
    }

    private void sendCommand(String str) {
        this.commandBuffer.append(str);
        this.commandHistory.add(str);
        this.commandBuffer.append('\n');
        this.connection.queueCommand(this.commandBuffer.toString());
        this.commandBuffer.setLength(0);
        this.commandBox.setText("");
        this.scrollViewAtBottom = true;
        doAsyncGuiUpdate();
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
            this.shellView.post(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.11
                @Override // java.lang.Runnable
                public void run() {
                    if (ShellAutoRunner.this.scrollViewAtBottom) {
                        ShellAutoRunner.this.shellScroller.smoothScrollTo(0, ShellAutoRunner.this.shellView.getBottom());
                    }
                }
            });
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionEstablished(DeviceConnection deviceConnection) {
        getSharedPreferences("AdbConnectPrefs", 0).edit().putBoolean("auto_connect", true).apply();
        this.connectWaiting.dismiss();
        this.connectWaiting = null;
        runOnUiThread(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.12
            @Override // java.lang.Runnable
            public void run() {
                ShellAutoRunner.this.connectButton.setText(com.tduk.appklr.R.string.connected);
                ShellAutoRunner.this.cleanAndBootButton.setEnabled(true);
                ShellAutoRunner.this.cleanButton.setEnabled(true);
            }
        });
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionFailed(DeviceConnection deviceConnection, Exception exc) {
        getSharedPreferences("AdbConnectPrefs", 0).edit().putBoolean("auto_connect", false).apply();
        this.connectWaiting.dismiss();
        this.connectWaiting = null;
        Dialog.displayDialog(this, "Connection Failed", exc.getMessage(), true);
        runOnUiThread(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.13
            @Override // java.lang.Runnable
            public void run() {
                ShellAutoRunner.this.connectButton.setText(com.tduk.appklr.R.string.connect_button);
                ShellAutoRunner.this.cleanAndBootButton.setEnabled(false);
                ShellAutoRunner.this.cleanButton.setEnabled(false);
            }
        });
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
            new Thread(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.14
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Thread.sleep(250L);
                        ShellAutoRunner.this.runOnUiThread(new Runnable() { // from class: com.tduk.cachecleaner.ShellAutoRunner.14.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ShellAutoRunner.this.updateRequired.set(false);
                                ShellAutoRunner.this.updateTerminalView();
                                ShellAutoRunner.this.updateQueued.set(false);
                                if (ShellAutoRunner.this.updateRequired.get()) {
                                    ShellAutoRunner.this.doAsyncGuiUpdate();
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
