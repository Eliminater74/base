.class public Lcom/cgutman/adblib/AdbConnection;
.super Ljava/lang/Object;
.source "AdbConnection.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private connectAttempted:Z

.field private connected:Z

.field private connectionThread:Ljava/lang/Thread;

.field private crypto:Lcom/cgutman/adblib/AdbCrypto;

.field private inputStream:Ljava/io/InputStream;

.field private lastLocalId:I

.field private maxData:I

.field private openStreams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/cgutman/adblib/AdbStream;",
            ">;"
        }
    .end annotation
.end field

.field outputStream:Ljava/io/OutputStream;

.field private sentSignature:Z

.field private socket:Ljava/net/Socket;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->openStreams:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput v0, p0, Lcom/cgutman/adblib/AdbConnection;->lastLocalId:I

    invoke-direct {p0}, Lcom/cgutman/adblib/AdbConnection;->createConnectionThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    return-void
.end method

.method static synthetic access$0(Lcom/cgutman/adblib/AdbConnection;)Ljava/lang/Thread;
    .locals 0

    iget-object p0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    return-object p0
.end method

.method static synthetic access$1(Lcom/cgutman/adblib/AdbConnection;)Ljava/io/InputStream;
    .locals 0

    iget-object p0, p0, Lcom/cgutman/adblib/AdbConnection;->inputStream:Ljava/io/InputStream;

    return-object p0
.end method

.method static synthetic access$10(Lcom/cgutman/adblib/AdbConnection;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/cgutman/adblib/AdbConnection;->connectAttempted:Z

    return-void
.end method

.method static synthetic access$2(Lcom/cgutman/adblib/AdbConnection;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    return p0
.end method

.method static synthetic access$3(Lcom/cgutman/adblib/AdbConnection;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/cgutman/adblib/AdbConnection;->openStreams:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$4(Lcom/cgutman/adblib/AdbConnection;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/cgutman/adblib/AdbConnection;->sentSignature:Z

    return p0
.end method

.method static synthetic access$5(Lcom/cgutman/adblib/AdbConnection;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 0

    iget-object p0, p0, Lcom/cgutman/adblib/AdbConnection;->crypto:Lcom/cgutman/adblib/AdbCrypto;

    return-object p0
.end method

.method static synthetic access$6(Lcom/cgutman/adblib/AdbConnection;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/cgutman/adblib/AdbConnection;->sentSignature:Z

    return-void
.end method

.method static synthetic access$7(Lcom/cgutman/adblib/AdbConnection;I)V
    .locals 0

    iput p1, p0, Lcom/cgutman/adblib/AdbConnection;->maxData:I

    return-void
.end method

.method static synthetic access$8(Lcom/cgutman/adblib/AdbConnection;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    return-void
.end method

.method static synthetic access$9(Lcom/cgutman/adblib/AdbConnection;)V
    .locals 0

    invoke-direct {p0}, Lcom/cgutman/adblib/AdbConnection;->cleanupStreams()V

    return-void
.end method

.method private cleanupStreams()V
    .locals 2

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cgutman/adblib/AdbStream;

    :try_start_0
    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public static create(Ljava/net/Socket;Lcom/cgutman/adblib/AdbCrypto;)Lcom/cgutman/adblib/AdbConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/cgutman/adblib/AdbConnection;

    invoke-direct {v0}, Lcom/cgutman/adblib/AdbConnection;-><init>()V

    iput-object p1, v0, Lcom/cgutman/adblib/AdbConnection;->crypto:Lcom/cgutman/adblib/AdbCrypto;

    iput-object p0, v0, Lcom/cgutman/adblib/AdbConnection;->socket:Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    iput-object p1, v0, Lcom/cgutman/adblib/AdbConnection;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    iput-object p1, v0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    return-object v0
.end method

.method private createConnectionThread()Ljava/lang/Thread;
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/cgutman/adblib/AdbConnection$1;

    invoke-direct {v1, p0, p0}, Lcom/cgutman/adblib/AdbConnection$1;-><init>(Lcom/cgutman/adblib/AdbConnection;Lcom/cgutman/adblib/AdbConnection;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :try_start_0
    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public connect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-static {}, Lcom/cgutman/adblib/AdbProtocol;->generateConnect()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectAttempted:Z

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    :cond_0
    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-eqz v0, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMaxData()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connectAttempted:Z

    if-eqz v0, :cond_2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    :cond_0
    iget-boolean v0, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-eqz v0, :cond_1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget v0, p0, Lcom/cgutman/adblib/AdbConnection;->maxData:I

    return v0

    :cond_1
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "connect() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public open(Ljava/lang/String;)Lcom/cgutman/adblib/AdbStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget v0, p0, Lcom/cgutman/adblib/AdbConnection;->lastLocalId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cgutman/adblib/AdbConnection;->lastLocalId:I

    iget-boolean v1, p0, Lcom/cgutman/adblib/AdbConnection;->connectAttempted:Z

    if-eqz v1, :cond_3

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    :cond_0
    iget-boolean v1, p0, Lcom/cgutman/adblib/AdbConnection;->connected:Z

    if-eqz v1, :cond_2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    new-instance v1, Lcom/cgutman/adblib/AdbStream;

    invoke-direct {v1, p0, v0}, Lcom/cgutman/adblib/AdbStream;-><init>(Lcom/cgutman/adblib/AdbConnection;I)V

    iget-object v2, p0, Lcom/cgutman/adblib/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-static {v0, p1}, Lcom/cgutman/adblib/AdbProtocol;->generateOpen(ILjava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    iget-object p1, p0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    monitor-enter v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->isClosed()Z

    move-result p1

    if-nez p1, :cond_1

    return-object v1

    :cond_1
    new-instance p1, Ljava/net/ConnectException;

    const-string v0, "Stream open actively rejected by remote peer"

    invoke-direct {p1, v0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :cond_2
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Connection failed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "connect() must be called first"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
