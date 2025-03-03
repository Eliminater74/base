.class public Landroidx/leanback/widget/TitleHelper;
.super Ljava/lang/Object;
.source "TitleHelper.java"


# instance fields
.field private final mOnFocusSearchListener:Landroidx/leanback/widget/BrowseFrameLayout$OnFocusSearchListener;

.field mSceneRoot:Landroid/view/ViewGroup;

.field private mSceneWithTitle:Ljava/lang/Object;

.field private mSceneWithoutTitle:Ljava/lang/Object;

.field private mTitleDownTransition:Ljava/lang/Object;

.field private mTitleUpTransition:Ljava/lang/Object;

.field mTitleView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroidx/leanback/widget/TitleHelper$1;

    invoke-direct {v0, p0}, Landroidx/leanback/widget/TitleHelper$1;-><init>(Landroidx/leanback/widget/TitleHelper;)V

    iput-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mOnFocusSearchListener:Landroidx/leanback/widget/BrowseFrameLayout$OnFocusSearchListener;

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iput-object p1, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    iput-object p2, p0, Landroidx/leanback/widget/TitleHelper;->mTitleView:Landroid/view/View;

    invoke-direct {p0}, Landroidx/leanback/widget/TitleHelper;->createTransitions()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Views may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private createTransitions()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/leanback/transition/LeanbackTransitionHelper;->loadTitleOutTransition(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mTitleUpTransition:Ljava/lang/Object;

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/leanback/transition/LeanbackTransitionHelper;->loadTitleInTransition(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mTitleDownTransition:Ljava/lang/Object;

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    new-instance v1, Landroidx/leanback/widget/TitleHelper$2;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/TitleHelper$2;-><init>(Landroidx/leanback/widget/TitleHelper;)V

    invoke-static {v0, v1}, Landroidx/leanback/transition/TransitionHelper;->createScene(Landroid/view/ViewGroup;Ljava/lang/Runnable;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneWithTitle:Ljava/lang/Object;

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    new-instance v1, Landroidx/leanback/widget/TitleHelper$3;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/TitleHelper$3;-><init>(Landroidx/leanback/widget/TitleHelper;)V

    invoke-static {v0, v1}, Landroidx/leanback/transition/TransitionHelper;->createScene(Landroid/view/ViewGroup;Ljava/lang/Runnable;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneWithoutTitle:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getOnFocusSearchListener()Landroidx/leanback/widget/BrowseFrameLayout$OnFocusSearchListener;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mOnFocusSearchListener:Landroidx/leanback/widget/BrowseFrameLayout$OnFocusSearchListener;

    return-object v0
.end method

.method public getSceneRoot()Landroid/view/ViewGroup;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mSceneRoot:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getTitleView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mTitleView:Landroid/view/View;

    return-object v0
.end method

.method public showTitle(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/widget/TitleHelper;->mSceneWithTitle:Ljava/lang/Object;

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mTitleDownTransition:Ljava/lang/Object;

    invoke-static {p1, v0}, Landroidx/leanback/transition/TransitionHelper;->runTransition(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/TitleHelper;->mSceneWithoutTitle:Ljava/lang/Object;

    iget-object v0, p0, Landroidx/leanback/widget/TitleHelper;->mTitleUpTransition:Ljava/lang/Object;

    invoke-static {p1, v0}, Landroidx/leanback/transition/TransitionHelper;->runTransition(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
