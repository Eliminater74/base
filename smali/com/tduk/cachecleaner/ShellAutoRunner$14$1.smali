.class Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner$14;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/ShellAutoRunner$14;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner$14;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$1300(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner$14;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$1400(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner$14;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$1500(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner$14;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$1300(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$14$1;->this$1:Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner$14;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$800(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    :cond_0
    return-void
.end method
