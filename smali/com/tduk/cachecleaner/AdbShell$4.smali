.class Lcom/tduk/cachecleaner/AdbShell$4;
.super Ljava/lang/Object;
.source "AdbShell.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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

.field final synthetic val$onScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AdbShell;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    iput-object p2, p0, Lcom/tduk/cachecleaner/AdbShell$4;->val$onScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbShell;->access$600(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/ScrollView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_2

    if-eq p2, v1, :cond_0

    const/4 v2, 0x2

    if-eq p2, v2, :cond_2

    const/4 p1, 0x3

    if-eq p2, p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbShell;->access$800(Lcom/tduk/cachecleaner/AdbShell;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbShell;->access$700(Lcom/tduk/cachecleaner/AdbShell;)V

    :cond_1
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1, v0}, Lcom/tduk/cachecleaner/AdbShell;->access$902(Lcom/tduk/cachecleaner/AdbShell;Z)Z

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell$4;->val$onScrollChangedListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell$4;->this$0:Lcom/tduk/cachecleaner/AdbShell;

    invoke-static {p1, v1}, Lcom/tduk/cachecleaner/AdbShell;->access$902(Lcom/tduk/cachecleaner/AdbShell;Z)Z

    :goto_0
    return v0
.end method
