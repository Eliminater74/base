.class Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;
.super Ljava/lang/Object;
.source "DeviceConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/devconn/DeviceConnection;->startConnect()V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v1

    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v1, v2}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->loadAdbCrypto(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v2, Ljava/net/InetSocketAddress;

    iget-object v3, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v3}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$100(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v4}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$200(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v3, 0x1388

    invoke-virtual {v0, v2, v3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    :try_start_1
    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0, v1}, Lcom/cgutman/adblib/AdbConnection;->create(Ljava/net/Socket;Lcom/cgutman/adblib/AdbCrypto;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$302(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/cgutman/adblib/AdbConnection;)Lcom/cgutman/adblib/AdbConnection;

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbConnection;->connect()V

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v2

    const-string v3, "shell:"

    invoke-virtual {v2, v3}, Lcom/cgutman/adblib/AdbConnection;->open(Ljava/lang/String;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$402(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/cgutman/adblib/AdbStream;)Lcom/cgutman/adblib/AdbStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v0, v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$500(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$600(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    return-void

    :catch_0
    move-exception v1

    :try_start_2
    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v2

    iget-object v3, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v2, v3, v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    move-result v1

    if-nez v1, :cond_1

    :try_start_3
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    :cond_1
    return-void

    :catch_2
    move-exception v1

    :try_start_4
    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v2

    iget-object v3, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v2, v3, v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    move-result v1

    if-nez v1, :cond_2

    :try_start_5
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    :cond_2
    return-void

    :catchall_0
    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;

    move-result-object v1

    invoke-static {v1}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    move-result v1

    if-nez v1, :cond_3

    :try_start_6
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    :catch_4
    :cond_3
    return-void

    :catch_5
    move-exception v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    move-result-object v1

    iget-object v2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;->this$0:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-interface {v1, v2, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V

    return-void
.end method
