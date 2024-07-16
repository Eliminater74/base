.class Lcom/tduk/cachecleaner/ConnectActivity$1;
.super Ljava/lang/Object;
.source "ConnectActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ConnectActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/ConnectActivity;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/ConnectActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity$1;->this$0:Lcom/tduk/cachecleaner/ConnectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/tduk/cachecleaner/ConnectActivity$1;->this$0:Lcom/tduk/cachecleaner/ConnectActivity;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/ConnectActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->writeNewCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ConnectActivity$1;->this$0:Lcom/tduk/cachecleaner/ConnectActivity;

    invoke-static {v1}, Lcom/tduk/cachecleaner/ConnectActivity;->access$000(Lcom/tduk/cachecleaner/ConnectActivity;)Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->dismiss()V

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/ConnectActivity$1;->this$0:Lcom/tduk/cachecleaner/ConnectActivity;

    const/4 v1, 0x1

    const-string v2, "Key Pair Generation Failed"

    const-string v3, "Unable to generate and save RSA key pair"

    invoke-static {v0, v2, v3, v1}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/ConnectActivity$1;->this$0:Lcom/tduk/cachecleaner/ConnectActivity;

    const/4 v1, 0x0

    const-string v2, "New Key Pair Generated"

    const-string v3, "Devices running 4.2.2 will need to be plugged in to a computer the next time you connect to them"

    invoke-static {v0, v2, v3, v1}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
