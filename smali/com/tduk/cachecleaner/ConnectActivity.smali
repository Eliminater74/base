.class public Lcom/tduk/cachecleaner/ConnectActivity;
.super Landroid/app/Activity;
.source "ConnectActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final PREFS_FILE:Ljava/lang/String; = "AdbConnectPrefs"


# instance fields
.field private autoConnect:Z

.field private connectButton:Landroid/widget/Button;

.field private ipField:Landroid/widget/EditText;

.field private keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

.field private portField:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ConnectActivity;->autoConnect:Z

    return-void
.end method

.method static synthetic access$000(Lcom/tduk/cachecleaner/ConnectActivity;)Lcom/tduk/cachecleaner/ui/SpinnerDialog;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ConnectActivity;->keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    return-object p0
.end method

.method private loadPreferences()V
    .locals 5

    const-string v0, "AdbConnectPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/tduk/cachecleaner/ConnectActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v2, p0, Lcom/tduk/cachecleaner/ConnectActivity;->ipField:Landroid/widget/EditText;

    const-string v3, "IP"

    const-string v4, "localhost"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/tduk/cachecleaner/ConnectActivity;->portField:Landroid/widget/EditText;

    const-string v3, "Port"

    const-string v4, "5555"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const-string v2, "auto_connect"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ConnectActivity;->autoConnect:Z

    return-void
.end method

.method private savePreferences()V
    .locals 3

    const-string v0, "AdbConnectPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/tduk/cachecleaner/ConnectActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->ipField:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IP"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->portField:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Port"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    const-string p1, "Invalid Port"

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->ipField:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IP"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/tduk/cachecleaner/ConnectActivity;->portField:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    const v3, 0xffff

    if-le v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const-string v3, "Port"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ConnectActivity;->savePreferences()V

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/ConnectActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "The port number must be between 1 and 65535"

    invoke-static {p0, p1, v0, v1}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    const-string v0, "The port must be an integer"

    invoke-static {p0, p1, v0, v1}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001e

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ConnectActivity;->setContentView(I)V

    const p1, 0x7f090095

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ConnectActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->connectButton:Landroid/widget/Button;

    const p1, 0x7f09012c

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ConnectActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->ipField:Landroid/widget/EditText;

    const p1, 0x7f0901cf

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ConnectActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->portField:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->connectButton:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ConnectActivity;->loadPreferences()V

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->autoConnect:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->connectButton:Landroid/widget/Button;

    invoke-virtual {p1}, Landroid/widget/Button;->performClick()Z

    :cond_0
    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ConnectActivity;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    const-string v0, "Generating RSA Key Pair"

    const-string v1, "This will only be done once."

    invoke-static {p0, v0, v1, p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/tduk/cachecleaner/ConnectActivity;->keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/tduk/cachecleaner/ConnectActivity$1;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ConnectActivity$1;-><init>(Lcom/tduk/cachecleaner/ConnectActivity;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_1
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-static {}, Lcom/tduk/cachecleaner/ui/Dialog;->closeDialogs()V

    invoke-static {}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->closeDialogs()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
