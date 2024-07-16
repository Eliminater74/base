.class Lcom/tduk/cachecleaner/AdbShell$5;
.super Ljava/lang/Object;
.source "AdbShell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AdbShell;->updateTerminalView()V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$5;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$5;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$800(Lcom/tduk/cachecleaner/AdbShell;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell$5;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbShell;->access$600(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/ScrollView;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/tduk/cachecleaner/AdbShell$5;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {v2}, Lcom/tduk/cachecleaner/AdbShell;->access$1000(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getBottom()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    :cond_0
    return-void
.end method
