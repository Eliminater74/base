package com.tduk.cachecleaner.devconn;

import com.cgutman.adblib.AdbConnection;
import com.cgutman.adblib.AdbCrypto;
import com.cgutman.adblib.AdbStream;
import com.tduk.cachecleaner.AdbUtils;
import java.io.Closeable;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.concurrent.LinkedBlockingQueue;
/* loaded from: classes.dex */
public class DeviceConnection implements Closeable {
    private static final int CONN_TIMEOUT = 5000;
    private boolean closed;
    private AdbConnection connection;
    private String host;
    private DeviceConnectionListener listener;
    private int port;
    private AdbStream shellStream;
    private LinkedBlockingQueue<byte[]> commandQueue = new LinkedBlockingQueue<>();
    private boolean foreground = true;

    public DeviceConnection(DeviceConnectionListener deviceConnectionListener, String str, int i) {
        this.host = str;
        this.port = i;
        this.listener = deviceConnectionListener;
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public boolean queueCommand(String str) {
        try {
            this.commandQueue.add(str.getBytes("UTF-8"));
            return true;
        } catch (UnsupportedEncodingException unused) {
            return false;
        }
    }

    public boolean queueBytes(byte[] bArr) {
        this.commandQueue.add(bArr);
        return true;
    }

    public void startConnect() {
        new Thread(new Runnable() { // from class: com.tduk.cachecleaner.devconn.DeviceConnection.1
            @Override // java.lang.Runnable
            public void run() {
                Socket socket = new Socket();
                AdbCrypto loadAdbCrypto = DeviceConnection.this.listener.loadAdbCrypto(DeviceConnection.this);
                if (loadAdbCrypto == null) {
                    return;
                }
                try {
                    try {
                        socket.connect(new InetSocketAddress(DeviceConnection.this.host, DeviceConnection.this.port), DeviceConnection.CONN_TIMEOUT);
                        try {
                            DeviceConnection.this.connection = AdbConnection.create(socket, loadAdbCrypto);
                            DeviceConnection.this.connection.connect();
                            DeviceConnection deviceConnection = DeviceConnection.this;
                            deviceConnection.shellStream = deviceConnection.connection.open("shell:");
                            DeviceConnection.this.listener.notifyConnectionEstablished(DeviceConnection.this);
                            DeviceConnection.this.startReceiveThread();
                            DeviceConnection.this.sendLoop();
                        } catch (IOException e) {
                            DeviceConnection.this.listener.notifyConnectionFailed(DeviceConnection.this, e);
                            AdbUtils.safeClose(DeviceConnection.this.shellStream);
                            if (AdbUtils.safeClose(DeviceConnection.this.connection)) {
                                return;
                            }
                            try {
                                socket.close();
                            } catch (IOException unused) {
                            }
                        } catch (InterruptedException e2) {
                            DeviceConnection.this.listener.notifyConnectionFailed(DeviceConnection.this, e2);
                            AdbUtils.safeClose(DeviceConnection.this.shellStream);
                            if (AdbUtils.safeClose(DeviceConnection.this.connection)) {
                                return;
                            }
                            try {
                                socket.close();
                            } catch (IOException unused2) {
                            }
                        }
                    } catch (IOException e3) {
                        DeviceConnection.this.listener.notifyConnectionFailed(DeviceConnection.this, e3);
                    }
                } catch (Throwable unused3) {
                    AdbUtils.safeClose(DeviceConnection.this.shellStream);
                    if (AdbUtils.safeClose(DeviceConnection.this.connection)) {
                        return;
                    }
                    try {
                        socket.close();
                    } catch (IOException unused4) {
                    }
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendLoop() {
        while (true) {
            try {
                try {
                    byte[] take = this.commandQueue.take();
                    if (this.shellStream.isClosed()) {
                        break;
                    }
                    this.shellStream.write(take);
                } catch (IOException e) {
                    this.listener.notifyStreamFailed(this, e);
                } catch (InterruptedException unused) {
                }
            } finally {
                AdbUtils.safeClose(this);
            }
        }
        this.listener.notifyStreamClosed(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startReceiveThread() {
        new Thread(new Runnable() { // from class: com.tduk.cachecleaner.devconn.DeviceConnection.2
            @Override // java.lang.Runnable
            public void run() {
                while (!DeviceConnection.this.shellStream.isClosed()) {
                    try {
                        try {
                            byte[] read = DeviceConnection.this.shellStream.read();
                            DeviceConnection.this.listener.receivedData(DeviceConnection.this, read, 0, read.length);
                        } catch (IOException e) {
                            DeviceConnection.this.listener.notifyStreamFailed(DeviceConnection.this, e);
                        } catch (InterruptedException unused) {
                        }
                    } finally {
                        AdbUtils.safeClose(DeviceConnection.this);
                    }
                }
                DeviceConnection.this.listener.notifyStreamClosed(DeviceConnection.this);
            }
        }).start();
    }

    public boolean isClosed() {
        return this.closed;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (isClosed()) {
            return;
        }
        this.closed = true;
        AdbUtils.safeClose(this.shellStream);
        AdbUtils.safeClose(this.connection);
        this.commandQueue.add(new byte[0]);
    }

    public boolean isForeground() {
        return this.foreground;
    }

    public void setForeground(boolean z) {
        this.foreground = z;
    }
}
