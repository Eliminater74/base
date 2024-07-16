.class public Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
.super Landroid/os/Binder;
.source "ShellService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tduk/cachecleaner/service/ShellService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ShellServiceBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/service/ShellService;


# direct methods
.method public constructor <init>(Lcom/tduk/cachecleaner/service/ShellService;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {v0}, Lcom/tduk/cachecleaner/service/ShellService;->access$000(Lcom/tduk/cachecleaner/service/ShellService;)Lcom/tduk/cachecleaner/service/ShellListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellListener;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    return-void
.end method

.method public createConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 2

    new-instance v0, Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    iget-object v1, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {v1}, Lcom/tduk/cachecleaner/service/ShellService;->access$000(Lcom/tduk/cachecleaner/service/ShellService;)Lcom/tduk/cachecleaner/service/ShellListener;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;-><init>(Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;Ljava/lang/String;I)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {p1}, Lcom/tduk/cachecleaner/service/ShellService;->access$000(Lcom/tduk/cachecleaner/service/ShellService;)Lcom/tduk/cachecleaner/service/ShellListener;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-virtual {p1, v0, p2}, Lcom/tduk/cachecleaner/service/ShellListener;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    return-object v0
.end method

.method public findConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {p2}, Lcom/tduk/cachecleaner/service/ShellService;->access$100(Lcom/tduk/cachecleaner/service/ShellService;)Ljava/util/HashMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-object p1
.end method

.method public notifyDestroyingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 2

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {v1, p1}, Lcom/tduk/cachecleaner/service/ShellService;->access$200(Lcom/tduk/cachecleaner/service/ShellService;Lcom/tduk/cachecleaner/devconn/DeviceConnection;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method public notifyPausingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->setForeground(Z)V

    return-void
.end method

.method public notifyResumingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->setForeground(Z)V

    return-void
.end method

.method public removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->this$0:Lcom/tduk/cachecleaner/service/ShellService;

    invoke-static {v0}, Lcom/tduk/cachecleaner/service/ShellService;->access$000(Lcom/tduk/cachecleaner/service/ShellService;)Lcom/tduk/cachecleaner/service/ShellListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellListener;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    return-void
.end method
