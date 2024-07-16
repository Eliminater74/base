.class Lcom/tduk/cachecleaner/ShellAutoRunner$8;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollChanged()V
    .locals 4

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$700(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/ScrollView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    iget-object v2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$700(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/ScrollView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v3}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$700(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/ScrollView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v0, v2

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$800(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$902(Lcom/tduk/cachecleaner/ShellAutoRunner;Z)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-static {v0, v1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->access$902(Lcom/tduk/cachecleaner/ShellAutoRunner;Z)Z

    :goto_0
    return-void
.end method
