.class Lcom/tduk/cachecleaner/AdbShell$2;
.super Ljava/lang/Object;
.source "AdbShell.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AdbShell;->onCreate(Landroid/os/Bundle;)V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$2;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$2;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbShell;->access$500(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/AdbShell;->openContextMenu(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method
