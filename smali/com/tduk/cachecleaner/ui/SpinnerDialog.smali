.class public Lcom/tduk/cachecleaner/ui/SpinnerDialog;
.super Ljava/lang/Object;
.source "SpinnerDialog.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static rundownDialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tduk/cachecleaner/ui/SpinnerDialog;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activity:Landroid/app/Activity;

.field private finish:Z

.field private message:Ljava/lang/String;

.field private progress:Landroid/app/ProgressDialog;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->rundownDialogs:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->title:Ljava/lang/String;

    iput-object p3, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->message:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    iput-boolean p4, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->finish:Z

    return-void
.end method

.method public static closeDialogs()V
    .locals 2

    sget-object v0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->rundownDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    iget-object v1, v1, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->rundownDialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public static displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Lcom/tduk/cachecleaner/ui/SpinnerDialog;
    .locals 1

    new-instance v0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    return-void
.end method

.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-boolean v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->finish:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    :goto_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :goto_1
    return-void
.end method
