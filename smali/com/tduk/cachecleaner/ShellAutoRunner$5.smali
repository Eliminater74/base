.class Lcom/tduk/cachecleaner/ShellAutoRunner$5;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$5;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$5;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    iget-object v0, v0, Lcom/tduk/cachecleaner/ShellAutoRunner;->whitelistButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$5;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {v0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
