.class final Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;
.super Landroidx/core/app/SharedElementCallback;
.source "DetailsOverviewSharedElementHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$TransitionTimeOutRunnable;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "DetailsTransitionHelper"


# instance fields
.field mActivityToRunTransition:Landroid/app/Activity;

.field mRightPanelHeight:I

.field mRightPanelWidth:I

.field private mSavedMatrix:Landroid/graphics/Matrix;

.field private mSavedScaleType:Landroid/widget/ImageView$ScaleType;

.field mSharedElementName:Ljava/lang/String;

.field mStartedPostpone:Z

.field mViewHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroidx/core/app/SharedElementCallback;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private static changeImageViewScale(Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;Landroid/view/View;)V
    .locals 2

    check-cast p1, Landroid/widget/ImageView;

    iget-object p0, p0, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    invoke-static {p0}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->updateImageViewAfterScaleTypeChange(Landroid/widget/ImageView;)V

    return-void
.end method

.method private hasImageViewScaleChange(Landroid/view/View;)Z
    .locals 0

    instance-of p1, p1, Landroid/widget/ImageView;

    return p1
.end method

.method private restoreImageViewScale(Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_1

    iget-object p1, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-static {p1}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->updateImageViewAfterScaleTypeChange(Landroid/widget/ImageView;)V

    :cond_1
    return-void
.end method

.method private saveImageViewScale()V
    .locals 3

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;

    iget-object v1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    iget-object v0, v0, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    iput-object v1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSavedMatrix:Landroid/graphics/Matrix;

    :cond_1
    return-void
.end method

.method private static updateImageViewAfterScaleTypeChange(Landroid/widget/ImageView;)V
    .locals 4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/widget/ImageView;->measure(II)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/ImageView;->getRight()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    return-void
.end method


# virtual methods
.method onBindToDrawable(Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setTransitionName(Landroid/view/View;Ljava/lang/String;)V

    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    iget-object v0, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mRightPanel:Landroid/view/ViewGroup;

    new-instance v1, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$1;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$1;-><init>(Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p1, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mRightPanel:Landroid/view/ViewGroup;

    new-instance v0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$2;

    invoke-direct {v0, p0}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$2;-><init>(Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSharedElementEnd(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 p3, 0x1

    if-ge p1, p3, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;

    const/4 p3, 0x0

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object v0, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    if-eq v0, p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->restoreImageViewScale(Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;)V

    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    const/high16 v0, 0x20000

    invoke-virtual {p2, v0}, Landroidx/leanback/widget/HorizontalGridView;->setDescendantFocusability(I)V

    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    invoke-virtual {p2, p3}, Landroidx/leanback/widget/HorizontalGridView;->setVisibility(I)V

    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    const/high16 v0, 0x40000

    invoke-virtual {p2, v0}, Landroidx/leanback/widget/HorizontalGridView;->setDescendantFocusability(I)V

    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    invoke-virtual {p2}, Landroidx/leanback/widget/HorizontalGridView;->requestFocus()Z

    iget-object p1, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onSharedElementStart(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mViewHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    if-eqz p1, :cond_4

    iget-object v1, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    if-eq v1, p2, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-direct {p0, p3}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->hasImageViewScaleChange(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->saveImageViewScale()V

    invoke-static {p1, p3}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->changeImageViewScale(Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;Landroid/view/View;)V

    :cond_2
    iget-object p3, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {p3, v3, v4}, Landroid/view/View;->measure(II)V

    invoke-virtual {p3, v0, v0, v1, p2}, Landroid/view/View;->layout(IIII)V

    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mRightPanel:Landroid/view/ViewGroup;

    iget p3, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mRightPanelWidth:I

    if-eqz p3, :cond_3

    iget v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mRightPanelHeight:I

    if-eqz v0, :cond_3

    invoke-static {p3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    iget v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mRightPanelHeight:I

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p2, p3, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    iget v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mRightPanelWidth:I

    add-int/2addr v0, v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mRightPanelHeight:I

    add-int/2addr v2, v3

    invoke-virtual {p2, v1, p3, v0, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p3

    sub-int/2addr v1, p3

    invoke-virtual {p2, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    :goto_0
    iget-object p2, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    const/4 p3, 0x4

    invoke-virtual {p2, p3}, Landroidx/leanback/widget/HorizontalGridView;->setVisibility(I)V

    iget-object p1, p1, Landroidx/leanback/widget/DetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_4
    :goto_1
    return-void
.end method

.method setSharedElementEnterTransition(Landroid/app/Activity;Ljava/lang/String;J)V
    .locals 2

    if-nez p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    if-eqz p1, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    :cond_2
    :goto_0
    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mActivityToRunTransition:Landroid/app/Activity;

    if-ne p1, v0, :cond_3

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSharedElementName:Ljava/lang/String;

    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mActivityToRunTransition:Landroid/app/Activity;

    if-eqz v0, :cond_4

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->setEnterSharedElementCallback(Landroid/app/Activity;Landroidx/core/app/SharedElementCallback;)V

    :cond_4
    iput-object p1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mActivityToRunTransition:Landroid/app/Activity;

    iput-object p2, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mSharedElementName:Ljava/lang/String;

    invoke-static {p1, p0}, Landroidx/core/app/ActivityCompat;->setEnterSharedElementCallback(Landroid/app/Activity;Landroidx/core/app/SharedElementCallback;)V

    iget-object p1, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mActivityToRunTransition:Landroid/app/Activity;

    invoke-static {p1}, Landroidx/core/app/ActivityCompat;->postponeEnterTransition(Landroid/app/Activity;)V

    const-wide/16 p1, 0x0

    cmp-long p1, p3, p1

    if-lez p1, :cond_5

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance p2, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$TransitionTimeOutRunnable;

    invoke-direct {p2, p0}, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper$TransitionTimeOutRunnable;-><init>(Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;)V

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_5
    return-void
.end method

.method startPostponedEnterTransition()V
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mStartedPostpone:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mActivityToRunTransition:Landroid/app/Activity;

    invoke-static {v0}, Landroidx/core/app/ActivityCompat;->startPostponedEnterTransition(Landroid/app/Activity;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/leanback/widget/DetailsOverviewSharedElementHelper;->mStartedPostpone:Z

    :cond_0
    return-void
.end method
