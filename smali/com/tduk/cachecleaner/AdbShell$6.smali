.class Lcom/tduk/cachecleaner/AdbShell$6;
.super Ljava/lang/Object;
.source "AdbShell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AdbShell;->doAsyncGuiUpdate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/AdbShell;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AdbShell;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-wide/16 v0, 0xfa

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$6;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    new-instance v1, Lcom/tduk/cachecleaner/AdbShell$6$1;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/AdbShell$6$1;-><init>(Lcom/tduk/cachecleaner/AdbShell$6;)V

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/AdbShell;->runOnUiThread(Ljava/lang/Runnable;)V

    :catch_0
    return-void
.end method
