.class public Lcom/tduk/cachecleaner/service/ShellListener;
.super Ljava/lang/Object;
.source "ShellListener.java"

# interfaces
.implements Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;


# static fields
.field private static final TERM_LENGTH:I = 0x61a8


# instance fields
.field private consoleMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/tduk/cachecleaner/devconn/DeviceConnection;",
            "Lcom/tduk/cachecleaner/console/ConsoleBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private listenerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/tduk/cachecleaner/devconn/DeviceConnection;",
            "Ljava/util/LinkedList<",
            "Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private service:Landroid/app/Service;


# direct methods
.method public constructor <init>(Landroid/app/Service;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    iput-object p1, p0, Lcom/tduk/cachecleaner/service/ShellListener;->service:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public declared-synchronized addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->isConsole()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2, p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public canReceiveData()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V
    .locals 0

    return-void
.end method

.method public isConsole()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public loadAdbCrypto(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/service/ShellListener;->service:Landroid/app/Service;

    invoke-virtual {p1}, Landroid/app/Service;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p1

    return-object p1
.end method

.method public notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    new-instance v1, Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    const/16 v2, 0x61a8

    invoke-direct {v1, v2}, Lcom/tduk/cachecleaner/console/ConsoleBuffer;-><init>(I)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v1, p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v1, p1, p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v1, p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {v1, p1, p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->consoleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    if-eqz v0, :cond_2

    add-int v1, p3, p4

    add-int/lit8 v1, v1, -0x1

    aget-byte v1, p2, v1

    const/4 v2, 0x7

    if-ne v1, v2, :cond_0

    add-int/lit8 p4, p4, -0x1

    :cond_0
    invoke-virtual {v0, p2, p3, p4}, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->append([BII)V

    iget-object p2, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/LinkedList;

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;

    invoke-interface {p3}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->isConsole()Z

    move-result p4

    if-eqz p4, :cond_1

    invoke-interface {p3, p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;->consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public declared-synchronized removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellListener;->listenerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/LinkedList;

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
