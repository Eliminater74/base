.class Lcom/tduk/cachecleaner/ui/Dialog$1;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ui/Dialog;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/ui/Dialog;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/ui/Dialog;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ui/Dialog$1;->this$0:Lcom/tduk/cachecleaner/ui/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ui/Dialog$1;->this$0:Lcom/tduk/cachecleaner/ui/Dialog;

    iget-object p1, p1, Lcom/tduk/cachecleaner/ui/Dialog;->alert:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    invoke-static {}, Lcom/tduk/cachecleaner/ui/Dialog;->access$000()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/tduk/cachecleaner/ui/Dialog$1;->this$0:Lcom/tduk/cachecleaner/ui/Dialog;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ui/Dialog;->access$100(Lcom/tduk/cachecleaner/ui/Dialog;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ui/Dialog$1;->this$0:Lcom/tduk/cachecleaner/ui/Dialog;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ui/Dialog;->access$200(Lcom/tduk/cachecleaner/ui/Dialog;)Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method
