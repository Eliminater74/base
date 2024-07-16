.class Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;
.super Ljava/lang/Object;
.source "AppsWhitelistActivity.java"

# interfaces
.implements Landroidx/transition/Transition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AppsWhitelistActivity;->finish()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AppsWhitelistActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTransitionCancel(Landroidx/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionEnd(Landroidx/transition/Transition;)V
    .locals 0

    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->removeListener(Landroidx/transition/Transition$TransitionListener;)Landroidx/transition/Transition;

    iget-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->finish()V

    return-void
.end method

.method public onTransitionPause(Landroidx/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionResume(Landroidx/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionStart(Landroidx/transition/Transition;)V
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/Window;->setDimAmount(F)V

    return-void
.end method
