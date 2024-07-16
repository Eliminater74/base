.class Lcom/tduk/cachecleaner/ShellAutoRunner$11;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner;->updateTerminalView()V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$11;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$11;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$900(Lcom/tduk/cachecleaner/ShellAutoRunner;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$11;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$700(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/ScrollView;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$11;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$1200(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getBottom()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    :cond_0
    return-void
.end method
