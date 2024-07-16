.class Lcom/tduk/cachecleaner/ShellAutoRunner$7;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner;->onCreate(Landroid/os/Bundle;)V
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$7;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$7;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$600(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->openContextMenu(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method
