.class Lcom/tduk/cachecleaner/ShellAutoRunner$6;
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$6;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$6;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->finishAffinity()V

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    return-void
.end method
