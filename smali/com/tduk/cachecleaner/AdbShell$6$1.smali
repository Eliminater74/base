.class Lcom/tduk/cachecleaner/AdbShell$6$1;
.super Ljava/lang/Object;
.source "AdbShell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AdbShell$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tduk/cachecleaner/AdbShell$6;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AdbShell$6;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$1100(Lcom/tduk/cachecleaner/AdbShell;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$1200(Lcom/tduk/cachecleaner/AdbShell;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$1300(Lcom/tduk/cachecleaner/AdbShell;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$1100(Lcom/tduk/cachecleaner/AdbShell;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6$1;->this$1:Lcom/tduk/cachecleaner/AdbShell$6;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$700(Lcom/tduk/cachecleaner/AdbShell;)V

    :cond_0
    return-void
.end method
