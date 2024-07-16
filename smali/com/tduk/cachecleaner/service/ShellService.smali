.class public Lcom/tduk/cachecleaner/service/ShellService;
.super Landroid/app/Service;
.source "ShellService.java"

# interfaces
.implements Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
    }
.end annotation


# static fields
.field private static final CHANNEL_ID:Ljava/lang/String; = "connectionInfo"

.field private static final CONN_BASE:I = 0x2f63

.field private static final FAILED_BASE:I = 0x2f4f


# instance fields
.field private binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

.field private currentConnectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tduk/cachecleaner/devconn/DeviceConnection;",
            ">;"
        }
    .end annotation
.end field

.field private foregroundId:I

.field private listener:Lcom/tduk/cachecleaner/service/ShellListener;

.field private wakeLock:Landroid/os/PowerManager$WakeLock;

.field private wlanLock:Landroid/net/wifi/WifiManager$WifiLock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;-><init>(Lcom/tduk/cachecleaner/service/ShellService;)V

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    new-instance v0, Lcom/tduk/cachecleaner/service/ShellListener;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/service/ShellListener;-><init>(Landroid/app/Service;)V

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->listener:Lcom/tduk/cachecleaner/service/ShellListener;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$000(Lcom/tduk/cachecleaner/service/ShellService;)Lcom/tduk/cachecleaner/service/ShellListener;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/service/ShellService;->listener:Lcom/tduk/cachecleaner/service/ShellListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/tduk/cachecleaner/service/ShellService;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$200(Lcom/tduk/cachecleaner/service/ShellService;Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getFailedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result p0

    return p0
.end method

.method private declared-synchronized addNewConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wlanLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private createNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)Landroid/app/Notification;
    .locals 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v1, "connectionInfo"

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_0

    new-instance v0, Landroid/app/NotificationChannel;

    const v2, 0x7f11001f

    invoke-virtual {p0, v2}, Lcom/tduk/cachecleaner/service/ShellService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const-class v2, Landroid/app/NotificationManager;

    invoke-virtual {p0, v2}, Lcom/tduk/cachecleaner/service/ShellService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    invoke-virtual {v2, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    if-eqz p2, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connected to "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Connection Established"

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connection to "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " failed"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Connection Terminated"

    :goto_0
    new-instance v3, Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/service/ShellService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TDUK APP Cache Cleaner - "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    const v2, 0x7f0700c3

    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    xor-int/lit8 v3, p2, 0x1

    invoke-virtual {v1, v3}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroidx/core/app/NotificationCompat$Builder;->setSilent(Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p2

    const-string v1, "TDUK APP Cache Cleaner"

    invoke-virtual {p2, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p2

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->createPendingIntentForConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setForegroundServiceBehavior(I)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method

.method private createPendingIntentForConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Landroid/app/PendingIntent;
    .locals 4

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/service/ShellService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/tduk/cachecleaner/AdbShell;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IP"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->getPort()I

    move-result v2

    const-string v3, "Port"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt p1, v2, :cond_0

    const/high16 p1, 0xc000000

    goto :goto_0

    :cond_0
    const/high16 p1, 0x8000000

    :goto_0
    const/4 v2, 0x0

    invoke-static {v0, v2, v1, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    return-object p1
.end method

.method private getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    add-int/lit16 p1, p1, 0x2f63

    return p1
.end method

.method private getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->getPort()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getFailedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    add-int/lit16 p1, p1, 0x2f4f

    return p1
.end method

.method private declared-synchronized removeConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectionString(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/service/ShellService;->stopSelf()V
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

.method private removeNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 4

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/service/ShellService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getFailedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v1

    iget v2, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    if-ne v1, v2, :cond_3

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-ne p1, v3, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v3

    :cond_1
    const/4 p1, 0x1

    if-nez v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->stopForeground(Z)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    goto :goto_1

    :cond_2
    invoke-direct {p0, v1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v2

    iput v2, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->cancel(I)V

    iget v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    invoke-direct {p0, v1, p1}, Lcom/tduk/cachecleaner/service/ShellService;->createNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->startForeground(ILandroid/app/Notification;)V

    goto :goto_1

    :cond_3
    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    :goto_1
    return-void
.end method

.method private updateNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)V
    .locals 2

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/service/ShellService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->removeNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    if-eqz p2, :cond_1

    iget v1, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v1

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService;->createNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getConnectedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v0

    iput v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->foregroundId:I

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService;->createNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->startForeground(ILandroid/app/Notification;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->isForeground()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->getFailedNotificationId(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result v1

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService;->createNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public canReceiveData()Z
    .locals 1

    const/4 v0, 0x0

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

    const/4 p1, 0x0

    return-object p1
.end method

.method public notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->addNewConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/tduk/cachecleaner/service/ShellService;->updateNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)V

    return-void
.end method

.method public notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 0

    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/tduk/cachecleaner/service/ShellService;->updateNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)V

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->removeConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    return-void
.end method

.method public notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 0

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService;->updateNotification(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Z)V

    invoke-direct {p0, p1}, Lcom/tduk/cachecleaner/service/ShellService;->removeConnection(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/service/ShellService;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-object p1
.end method

.method public onCreate()V
    .locals 3

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/service/ShellService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    const/4 v1, 0x1

    const-string v2, "RemoteADBShell:ShellService"

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wlanLock:Landroid/net/wifi/WifiManager$WifiLock;

    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/service/ShellService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wlanLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wlanLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    const/4 p1, 0x2

    return p1
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/service/ShellService;->currentConnectionMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/service/ShellService;->stopSelf()V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V
    .locals 0

    return-void
.end method
