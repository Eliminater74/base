package com.tduk.cachecleaner.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Binder;
import android.os.Build;
import android.os.IBinder;
import android.os.PowerManager;
import androidx.core.app.NotificationCompat;
import com.cgutman.adblib.AdbCrypto;
import com.tduk.appklr.R;
import com.tduk.cachecleaner.AdbShell;
import com.tduk.cachecleaner.console.ConsoleBuffer;
import com.tduk.cachecleaner.devconn.DeviceConnection;
import com.tduk.cachecleaner.devconn.DeviceConnectionListener;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes.dex */
public class ShellService extends Service implements DeviceConnectionListener {
    private static final String CHANNEL_ID = "connectionInfo";
    private static final int CONN_BASE = 12131;
    private static final int FAILED_BASE = 12111;
    private int foregroundId;
    private PowerManager.WakeLock wakeLock;
    private WifiManager.WifiLock wlanLock;
    private ShellServiceBinder binder = new ShellServiceBinder();
    private ShellListener listener = new ShellListener(this);
    private HashMap<String, DeviceConnection> currentConnectionMap = new HashMap<>();

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean canReceiveData() {
        return false;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void consoleUpdated(DeviceConnection deviceConnection, ConsoleBuffer consoleBuffer) {
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean isConsole() {
        return false;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public AdbCrypto loadAdbCrypto(DeviceConnection deviceConnection) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        return 2;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void receivedData(DeviceConnection deviceConnection, byte[] bArr, int i, int i2) {
    }

    /* loaded from: classes.dex */
    public class ShellServiceBinder extends Binder {
        public ShellServiceBinder() {
        }

        public DeviceConnection createConnection(String str, int i) {
            DeviceConnection deviceConnection = new DeviceConnection(ShellService.this.listener, str, i);
            ShellService.this.listener.addListener(deviceConnection, ShellService.this);
            return deviceConnection;
        }

        public DeviceConnection findConnection(String str, int i) {
            return (DeviceConnection) ShellService.this.currentConnectionMap.get(str + ":" + i);
        }

        public void notifyPausingActivity(DeviceConnection deviceConnection) {
            deviceConnection.setForeground(false);
        }

        public void notifyResumingActivity(DeviceConnection deviceConnection) {
            deviceConnection.setForeground(true);
        }

        public void notifyDestroyingActivity(DeviceConnection deviceConnection) {
            if (deviceConnection.isClosed()) {
                ((NotificationManager) ShellService.this.getSystemService("notification")).cancel(ShellService.this.getFailedNotificationId(deviceConnection));
            }
        }

        public void addListener(DeviceConnection deviceConnection, DeviceConnectionListener deviceConnectionListener) {
            ShellService.this.listener.addListener(deviceConnection, deviceConnectionListener);
        }

        public void removeListener(DeviceConnection deviceConnection, DeviceConnectionListener deviceConnectionListener) {
            ShellService.this.listener.removeListener(deviceConnection, deviceConnectionListener);
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return this.binder;
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        if (this.currentConnectionMap.isEmpty()) {
            stopSelf();
            return false;
        }
        return false;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.wlanLock = ((WifiManager) getApplicationContext().getSystemService("wifi")).createWifiLock(1, "RemoteADBShell:ShellService");
        this.wakeLock = ((PowerManager) getSystemService("power")).newWakeLock(1, "RemoteADBShell:ShellService");
    }

    @Override // android.app.Service
    public void onDestroy() {
        if (this.wlanLock.isHeld()) {
            this.wlanLock.release();
        }
        if (this.wakeLock.isHeld()) {
            this.wakeLock.release();
        }
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getFailedNotificationId(DeviceConnection deviceConnection) {
        return getConnectionString(deviceConnection).hashCode() + FAILED_BASE;
    }

    private int getConnectedNotificationId(DeviceConnection deviceConnection) {
        return getConnectionString(deviceConnection).hashCode() + CONN_BASE;
    }

    private PendingIntent createPendingIntentForConnection(DeviceConnection deviceConnection) {
        Context applicationContext = getApplicationContext();
        Intent intent = new Intent(applicationContext, AdbShell.class);
        intent.putExtra("IP", deviceConnection.getHost());
        intent.putExtra("Port", deviceConnection.getPort());
        intent.setAction(getConnectionString(deviceConnection));
        return PendingIntent.getActivity(applicationContext, 0, intent, Build.VERSION.SDK_INT >= 23 ? 201326592 : 134217728);
    }

    private Notification createNotification(DeviceConnection deviceConnection, boolean z) {
        String str;
        String str2;
        if (Build.VERSION.SDK_INT >= 26) {
            ((NotificationManager) getSystemService(NotificationManager.class)).createNotificationChannel(new NotificationChannel(CHANNEL_ID, getString(R.string.channel_name), 3));
        }
        if (z) {
            str = "Connected to " + getConnectionString(deviceConnection);
            str2 = "Connection Established";
        } else {
            str = "Connection to " + getConnectionString(deviceConnection) + " failed";
            str2 = "Connection Terminated";
        }
        return new NotificationCompat.Builder(getApplicationContext(), CHANNEL_ID).setTicker("TDUK APP Cache Cleaner - " + str2).setSmallIcon(R.drawable.notificationicon).setOnlyAlertOnce(true).setOngoing(z).setAutoCancel(!z).setSilent(z).setContentTitle("TDUK APP Cache Cleaner").setContentText(str).setContentIntent(createPendingIntentForConnection(deviceConnection)).setForegroundServiceBehavior(1).build();
    }

    private void updateNotification(DeviceConnection deviceConnection, boolean z) {
        NotificationManager notificationManager = (NotificationManager) getSystemService("notification");
        removeNotification(deviceConnection);
        if (z) {
            if (this.foregroundId != 0) {
                notificationManager.notify(getConnectedNotificationId(deviceConnection), createNotification(deviceConnection, z));
                return;
            }
            int connectedNotificationId = getConnectedNotificationId(deviceConnection);
            this.foregroundId = connectedNotificationId;
            startForeground(connectedNotificationId, createNotification(deviceConnection, z));
        } else if (deviceConnection.isForeground()) {
        } else {
            notificationManager.notify(getFailedNotificationId(deviceConnection), createNotification(deviceConnection, z));
        }
    }

    private void removeNotification(DeviceConnection deviceConnection) {
        NotificationManager notificationManager = (NotificationManager) getSystemService("notification");
        notificationManager.cancel(getFailedNotificationId(deviceConnection));
        if (getConnectedNotificationId(deviceConnection) == this.foregroundId) {
            DeviceConnection deviceConnection2 = null;
            Iterator<DeviceConnection> it = this.currentConnectionMap.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                DeviceConnection next = it.next();
                if (deviceConnection != next) {
                    deviceConnection2 = next;
                    break;
                }
            }
            if (deviceConnection2 == null) {
                stopForeground(true);
                this.foregroundId = 0;
                return;
            }
            int connectedNotificationId = getConnectedNotificationId(deviceConnection2);
            this.foregroundId = connectedNotificationId;
            notificationManager.cancel(connectedNotificationId);
            startForeground(this.foregroundId, createNotification(deviceConnection2, true));
            return;
        }
        notificationManager.cancel(getConnectedNotificationId(deviceConnection));
    }

    private String getConnectionString(DeviceConnection deviceConnection) {
        return deviceConnection.getHost() + ":" + deviceConnection.getPort();
    }

    private synchronized void addNewConnection(DeviceConnection deviceConnection) {
        if (this.currentConnectionMap.isEmpty()) {
            this.wakeLock.acquire();
            this.wlanLock.acquire();
        }
        this.currentConnectionMap.put(getConnectionString(deviceConnection), deviceConnection);
    }

    private synchronized void removeConnection(DeviceConnection deviceConnection) {
        this.currentConnectionMap.remove(getConnectionString(deviceConnection));
        if (this.currentConnectionMap.isEmpty()) {
            stopSelf();
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionEstablished(DeviceConnection deviceConnection) {
        addNewConnection(deviceConnection);
        updateNotification(deviceConnection, true);
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionFailed(DeviceConnection deviceConnection, Exception exc) {
        exc.printStackTrace();
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamFailed(DeviceConnection deviceConnection, Exception exc) {
        updateNotification(deviceConnection, false);
        removeConnection(deviceConnection);
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamClosed(DeviceConnection deviceConnection) {
        updateNotification(deviceConnection, false);
        removeConnection(deviceConnection);
    }
}
