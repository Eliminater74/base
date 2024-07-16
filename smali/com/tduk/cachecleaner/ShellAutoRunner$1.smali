.class Lcom/tduk/cachecleaner/ShellAutoRunner$1;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    check-cast p2, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-static {p1, p2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$002(Lcom/tduk/cachecleaner/ShellAutoRunner;Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$100(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$000(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {p2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$100(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1, p2, v0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :cond_0
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$200(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$300(Lcom/tduk/cachecleaner/ShellAutoRunner;)I

    move-result v0

    invoke-static {p1, p2, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$400(Lcom/tduk/cachecleaner/ShellAutoRunner;Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$102(Lcom/tduk/cachecleaner/ShellAutoRunner;Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$002(Lcom/tduk/cachecleaner/ShellAutoRunner;Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-void
.end method
