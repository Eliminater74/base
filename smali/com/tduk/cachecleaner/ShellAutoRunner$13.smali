.class Lcom/tduk/cachecleaner/ShellAutoRunner$13;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner;->notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$13;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$13;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectButton:Landroid/widget/Button;

    const v1, 0x7f110025

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$13;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner;->cleanAndBootButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$13;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner;->cleanButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
