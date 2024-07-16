.class public interface abstract Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;
.super Ljava/lang/Object;
.source "DeviceConnectionListener.java"


# virtual methods
.method public abstract canReceiveData()Z
.end method

.method public abstract consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V
.end method

.method public abstract isConsole()Z
.end method

.method public abstract loadAdbCrypto(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbCrypto;
.end method

.method public abstract notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
.end method

.method public abstract notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
.end method

.method public abstract notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
.end method

.method public abstract notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
.end method

.method public abstract receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V
.end method
