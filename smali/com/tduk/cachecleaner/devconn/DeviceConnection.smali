.class public Lcom/tduk/cachecleaner/devconn/DeviceConnection;
.super Ljava/lang/Object;
.source "DeviceConnection.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final CONN_TIMEOUT:I = 0x1388


# instance fields
.field private closed:Z

.field private commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "[B>;"
        }
    .end annotation
.end field

.field private connection:Lcom/cgutman/adblib/AdbConnection;

.field private foreground:Z

.field private host:Ljava/lang/String;

.field private listener:Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

.field private port:I

.field private shellStream:Lcom/cgutman/adblib/AdbStream;


# direct methods
.method public constructor <init>(Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    iput-object p2, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->host:Ljava/lang/String;

    iput p3, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->port:I

    iput-object p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->listener:Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->foreground:Z

    return-void
.end method

.method static synthetic access$000(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->listener:Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->host:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I
    .locals 0

    iget p0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->port:I

    return p0
.end method

.method static synthetic access$300(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbConnection;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->connection:Lcom/cgutman/adblib/AdbConnection;

    return-object p0
.end method

.method static synthetic access$302(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/cgutman/adblib/AdbConnection;)Lcom/cgutman/adblib/AdbConnection;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->connection:Lcom/cgutman/adblib/AdbConnection;

    return-object p1
.end method

.method static synthetic access$400(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbStream;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->shellStream:Lcom/cgutman/adblib/AdbStream;

    return-object p0
.end method

.method static synthetic access$402(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/cgutman/adblib/AdbStream;)Lcom/cgutman/adblib/AdbStream;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->shellStream:Lcom/cgutman/adblib/AdbStream;

    return-object p1
.end method

.method static synthetic access$500(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->startReceiveThread()V

    return-void
.end method

.method static synthetic access$600(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->sendLoop()V

    return-void
.end method

.method private sendLoop()V
    .locals 2

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->shellStream:Lcom/cgutman/adblib/AdbStream;

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->listener:Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v0, p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->shellStream:Lcom/cgutman/adblib/AdbStream;

    invoke-virtual {v1, v0}, Lcom/cgutman/adblib/AdbStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    :goto_1
    invoke-static {p0}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_1
    iget-object v1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->listener:Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v1, p0, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    return-void

    :goto_3
    invoke-static {p0}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    throw v0
.end method

.method private startReceiveThread()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection$2;-><init>(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->closed:Z

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->shellStream:Lcom/cgutman/adblib/AdbStream;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->connection:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->safeClose(Ljava/io/Closeable;)Z

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    iget v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->port:I

    return v0
.end method

.method public isClosed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->closed:Z

    return v0
.end method

.method public isForeground()Z
    .locals 1

    iget-boolean v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->foreground:Z

    return v0
.end method

.method public queueBytes([B)Z
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public queueCommand(Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->commandQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method public setForeground(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->foreground:Z

    return-void
.end method

.method public startConnect()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection$1;-><init>(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
