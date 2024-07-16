package com.tduk.cachecleaner.service;

import android.app.Service;
import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.AdbUtils;
import com.tduk.cachecleaner.console.ConsoleBuffer;
import com.tduk.cachecleaner.devconn.DeviceConnection;
import com.tduk.cachecleaner.devconn.DeviceConnectionListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
/* loaded from: classes.dex */
public class ShellListener implements DeviceConnectionListener {
    private static final int TERM_LENGTH = 25000;
    private Service service;
    private HashMap<DeviceConnection, LinkedList<DeviceConnectionListener>> listenerMap = new HashMap<>();
    private HashMap<DeviceConnection, ConsoleBuffer> consoleMap = new HashMap<>();

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean canReceiveData() {
        return true;
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void consoleUpdated(DeviceConnection deviceConnection, ConsoleBuffer consoleBuffer) {
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public boolean isConsole() {
        return false;
    }

    public ShellListener(Service service) {
        this.service = service;
    }

    public synchronized void addListener(DeviceConnection deviceConnection, DeviceConnectionListener deviceConnectionListener) {
        LinkedList<DeviceConnectionListener> linkedList = this.listenerMap.get(deviceConnection);
        if (linkedList != null) {
            linkedList.add(deviceConnectionListener);
        } else {
            LinkedList<DeviceConnectionListener> linkedList2 = new LinkedList<>();
            linkedList2.add(deviceConnectionListener);
            this.listenerMap.put(deviceConnection, linkedList2);
        }
        ConsoleBuffer consoleBuffer = this.consoleMap.get(deviceConnection);
        if (consoleBuffer != null && deviceConnectionListener.isConsole()) {
            deviceConnectionListener.consoleUpdated(deviceConnection, consoleBuffer);
        }
    }

    public synchronized void removeListener(DeviceConnection deviceConnection, DeviceConnectionListener deviceConnectionListener) {
        LinkedList<DeviceConnectionListener> linkedList = this.listenerMap.get(deviceConnection);
        if (linkedList != null) {
            linkedList.remove(deviceConnectionListener);
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionEstablished(DeviceConnection deviceConnection) {
        this.consoleMap.put(deviceConnection, new ConsoleBuffer(TERM_LENGTH));
        LinkedList<DeviceConnectionListener> linkedList = this.listenerMap.get(deviceConnection);
        if (linkedList != null) {
            Iterator<DeviceConnectionListener> it = linkedList.iterator();
            while (it.hasNext()) {
                it.next().notifyConnectionEstablished(deviceConnection);
            }
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyConnectionFailed(DeviceConnection deviceConnection, Exception exc) {
        LinkedList<DeviceConnectionListener> linkedList = this.listenerMap.get(deviceConnection);
        if (linkedList != null) {
            Iterator<DeviceConnectionListener> it = linkedList.iterator();
            while (it.hasNext()) {
                it.next().notifyConnectionFailed(deviceConnection, exc);
            }
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamFailed(DeviceConnection deviceConnection, Exception exc) {
        LinkedList<DeviceConnectionListener> linkedList;
        if (this.consoleMap.remove(deviceConnection) == null || (linkedList = this.listenerMap.get(deviceConnection)) == null) {
            return;
        }
        Iterator<DeviceConnectionListener> it = linkedList.iterator();
        while (it.hasNext()) {
            it.next().notifyStreamFailed(deviceConnection, exc);
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void notifyStreamClosed(DeviceConnection deviceConnection) {
        LinkedList<DeviceConnectionListener> linkedList;
        if (this.consoleMap.remove(deviceConnection) == null || (linkedList = this.listenerMap.get(deviceConnection)) == null) {
            return;
        }
        Iterator<DeviceConnectionListener> it = linkedList.iterator();
        while (it.hasNext()) {
            it.next().notifyStreamClosed(deviceConnection);
        }
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public AdbCrypto loadAdbCrypto(DeviceConnection deviceConnection) {
        return AdbUtils.readCryptoConfig(this.service.getFilesDir());
    }

    @Override // com.tduk.cachecleaner.devconn.DeviceConnectionListener
    public void receivedData(DeviceConnection deviceConnection, byte[] bArr, int i, int i2) {
        ConsoleBuffer consoleBuffer = this.consoleMap.get(deviceConnection);
        if (consoleBuffer != null) {
            if (bArr[(i + i2) - 1] == 7) {
                i2--;
            }
            consoleBuffer.append(bArr, i, i2);
            LinkedList<DeviceConnectionListener> linkedList = this.listenerMap.get(deviceConnection);
            if (linkedList != null) {
                Iterator<DeviceConnectionListener> it = linkedList.iterator();
                while (it.hasNext()) {
                    DeviceConnectionListener next = it.next();
                    if (next.isConsole()) {
                        next.consoleUpdated(deviceConnection, consoleBuffer);
                    }
                }
            }
        }
    }
}
