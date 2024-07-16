package com.cgutman.adblib;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.Socket;
import java.util.HashMap;
/* loaded from: classes.dex */
public class AdbConnection implements Closeable {
    private boolean connectAttempted;
    private boolean connected;
    private AdbCrypto crypto;
    private InputStream inputStream;
    private int maxData;
    OutputStream outputStream;
    private boolean sentSignature;
    private Socket socket;
    private HashMap<Integer, AdbStream> openStreams = new HashMap<>();
    private int lastLocalId = 0;
    private Thread connectionThread = createConnectionThread();

    private AdbConnection() {
    }

    public static AdbConnection create(Socket socket, AdbCrypto adbCrypto) throws IOException {
        AdbConnection adbConnection = new AdbConnection();
        adbConnection.crypto = adbCrypto;
        adbConnection.socket = socket;
        adbConnection.inputStream = socket.getInputStream();
        adbConnection.outputStream = socket.getOutputStream();
        socket.setTcpNoDelay(true);
        return adbConnection;
    }

    private Thread createConnectionThread() {
        return new Thread(new Runnable() { // from class: com.cgutman.adblib.AdbConnection.1
            /* JADX WARN: Removed duplicated region for block: B:55:0x00e6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void run() {
                /*
                    Method dump skipped, instructions count: 274
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.cgutman.adblib.AdbConnection.RunnableC09731.run():void");
            }
        });
    }

    public int getMaxData() throws InterruptedException, IOException {
        if (!this.connectAttempted) {
            throw new IllegalStateException("connect() must be called first");
        }
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
        return this.maxData;
    }

    public void connect() throws IOException, InterruptedException {
        if (this.connected) {
            throw new IllegalStateException("Already connected");
        }
        this.outputStream.write(AdbProtocol.generateConnect());
        this.outputStream.flush();
        this.connectAttempted = true;
        this.connectionThread.start();
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
    }

    public AdbStream open(String str) throws UnsupportedEncodingException, IOException, InterruptedException {
        int i = this.lastLocalId + 1;
        this.lastLocalId = i;
        if (!this.connectAttempted) {
            throw new IllegalStateException("connect() must be called first");
        }
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
        AdbStream adbStream = new AdbStream(this, i);
        this.openStreams.put(Integer.valueOf(i), adbStream);
        this.outputStream.write(AdbProtocol.generateOpen(i, str));
        this.outputStream.flush();
        synchronized (adbStream) {
            adbStream.wait();
        }
        if (adbStream.isClosed()) {
            throw new ConnectException("Stream open actively rejected by remote peer");
        }
        return adbStream;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanupStreams() {
        for (AdbStream adbStream : this.openStreams.values()) {
            try {
                adbStream.close();
            } catch (IOException unused) {
            }
        }
        this.openStreams.clear();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.connectionThread == null) {
            return;
        }
        this.socket.close();
        this.connectionThread.interrupt();
        try {
            this.connectionThread.join();
        } catch (InterruptedException unused) {
        }
    }
}
