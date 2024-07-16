.class Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;
.super Ljava/lang/Object;
.source "DeviceConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/devconn/DeviceConnection;->startReceiveThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cgutman/adblib/AdbStream;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cgutman/adblib/AdbStream;->read()[B

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v1

    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-interface {v1, v2, v0, v3, v4}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v0, v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    :goto_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_1
    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v1

    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v1, v2, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    return-void

    :goto_3
    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    throw v0
.end method
