.class public Lcom/tduk/cachecleaner/ui/Dialog;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static rundownDialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tduk/cachecleaner/ui/Dialog;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activity:Landroid/app/Activity;

.field alert:Landroid/app/AlertDialog;

.field private endAfterDismiss:Z

.field private message:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/tduk/cachecleaner/ui/Dialog;->rundownDialogs:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tduk/cachecleaner/ui/Dialog;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/tduk/cachecleaner/ui/Dialog;->title:Ljava/lang/String;

    iput-object p3, p0, Lcom/tduk/cachecleaner/ui/Dialog;->message:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/tduk/cachecleaner/ui/Dialog;->endAfterDismiss:Z

    return-void
.end method

.method static synthetic access$000()Ljava/util/ArrayList;
    .locals 1

    sget-object v0, Lcom/tduk/cachecleaner/ui/Dialog;->rundownDialogs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/tduk/cachecleaner/ui/Dialog;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->endAfterDismiss:Z

    return p0
.end method

.method static synthetic access$200(Lcom/tduk/cachecleaner/ui/Dialog;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method public static closeDialogs()V
    .locals 2

    sget-object v0, Lcom/tduk/cachecleaner/ui/Dialog;->rundownDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/ui/Dialog;

    iget-object v1, v1, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/tduk/cachecleaner/ui/Dialog;->rundownDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public static displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    new-instance v0, Lcom/tduk/cachecleaner/ui/Dialog;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tduk/cachecleaner/ui/Dialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/Dialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/Dialog;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/Dialog;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    const/4 v1, -0x3

    new-instance v2, Lcom/tduk/cachecleaner/ui/Dialog$1;

    invoke-direct {v2, p0}, Lcom/tduk/cachecleaner/ui/Dialog$1;-><init>(Lcom/tduk/cachecleaner/ui/Dialog;)V

    const-string v3, "OK"

    invoke-virtual {v0, v1, v3, v2}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    sget-object v0, Lcom/tduk/cachecleaner/ui/Dialog;->rundownDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
