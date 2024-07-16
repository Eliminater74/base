.class final Landroidx/leanback/app/DetailsFragment$EnterTransitionListener;
.super Landroidx/leanback/transition/TransitionListener;
.source "DetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/app/DetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EnterTransitionListener"
.end annotation


# instance fields
.field final mFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/leanback/app/DetailsFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/leanback/app/DetailsFragment;)V
    .locals 1

    invoke-direct {p0}, Landroidx/leanback/transition/TransitionListener;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/leanback/app/DetailsFragment$EnterTransitionListener;->mFragment:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onTransitionCancel(Ljava/lang/Object;)V
    .locals 1

    iget-object p1, p0, Landroidx/leanback/app/DetailsFragment$EnterTransitionListener;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/app/DetailsFragment;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p1, Landroidx/leanback/app/DetailsFragment;->mStateMachine:Landroidx/leanback/util/StateMachine;

    iget-object p1, p1, Landroidx/leanback/app/DetailsFragment;->EVT_ENTER_TRANSIITON_DONE:Landroidx/leanback/util/StateMachine$Event;

    invoke-virtual {v0, p1}, Landroidx/leanback/util/StateMachine;->fireEvent(Landroidx/leanback/util/StateMachine$Event;)V

    return-void
.end method

.method public onTransitionEnd(Ljava/lang/Object;)V
    .locals 1

    iget-object p1, p0, Landroidx/leanback/app/DetailsFragment$EnterTransitionListener;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/app/DetailsFragment;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p1, Landroidx/leanback/app/DetailsFragment;->mStateMachine:Landroidx/leanback/util/StateMachine;

    iget-object p1, p1, Landroidx/leanback/app/DetailsFragment;->EVT_ENTER_TRANSIITON_DONE:Landroidx/leanback/util/StateMachine$Event;

    invoke-virtual {v0, p1}, Landroidx/leanback/util/StateMachine;->fireEvent(Landroidx/leanback/util/StateMachine$Event;)V

    return-void
.end method

.method public onTransitionStart(Ljava/lang/Object;)V
    .locals 1

    iget-object p1, p0, Landroidx/leanback/app/DetailsFragment$EnterTransitionListener;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/app/DetailsFragment;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p1, Landroidx/leanback/app/DetailsFragment;->mWaitEnterTransitionTimeout:Landroidx/leanback/app/DetailsFragment$WaitEnterTransitionTimeout;

    if-eqz v0, :cond_1

    iget-object p1, p1, Landroidx/leanback/app/DetailsFragment;->mWaitEnterTransitionTimeout:Landroidx/leanback/app/DetailsFragment$WaitEnterTransitionTimeout;

    iget-object p1, p1, Landroidx/leanback/app/DetailsFragment$WaitEnterTransitionTimeout;->mRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_1
    return-void
.end method
