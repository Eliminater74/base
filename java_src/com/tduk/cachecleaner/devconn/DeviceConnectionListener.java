package com.tduk.cachecleaner.devconn;

import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.console.ConsoleBuffer;
/* loaded from: classes.dex */
public interface DeviceConnectionListener {
    boolean canReceiveData();

    void consoleUpdated(DeviceConnection deviceConnection, ConsoleBuffer consoleBuffer);

    boolean isConsole();

    AdbCrypto loadAdbCrypto(DeviceConnection deviceConnection);

    void notifyConnectionEstablished(DeviceConnection deviceConnection);

    void notifyConnectionFailed(DeviceConnection deviceConnection, Exception exc);

    void notifyStreamClosed(DeviceConnection deviceConnection);

    void notifyStreamFailed(DeviceConnection deviceConnection, Exception exc);

    void receivedData(DeviceConnection deviceConnection, byte[] bArr, int i, int i2);
}
