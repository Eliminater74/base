.class public abstract Landroidx/leanback/widget/AbstractMediaItemPresenter;
.super Landroidx/leanback/widget/RowPresenter;
.source "AbstractMediaItemPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;
    }
.end annotation


# static fields
.field public static final PLAY_STATE_INITIAL:I = 0x0

.field public static final PLAY_STATE_PAUSED:I = 0x1

.field public static final PLAY_STATE_PLAYING:I = 0x2

.field static final sTempRect:Landroid/graphics/Rect;


# instance fields
.field private mBackgroundColor:I

.field private mBackgroundColorSet:Z

.field private mMediaItemActionPresenter:Landroidx/leanback/widget/Presenter;

.field private mMediaRowSeparator:Z

.field private mThemeId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->sTempRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/leanback/widget/AbstractMediaItemPresenter;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Landroidx/leanback/widget/RowPresenter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mBackgroundColor:I

    new-instance v0, Landroidx/leanback/widget/MediaItemActionPresenter;

    invoke-direct {v0}, Landroidx/leanback/widget/MediaItemActionPresenter;-><init>()V

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mMediaItemActionPresenter:Landroidx/leanback/widget/Presenter;

    iput p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mThemeId:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->setHeaderPresenter(Landroidx/leanback/widget/RowHeaderPresenter;)V

    return-void
.end method

.method static calculateMediaItemNumberFlipperIndex(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)I
    .locals 3

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getRowObject()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->getMediaPlayState(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_4

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPlayingView:Landroid/view/View;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    iget-object p0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPlayingView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/widget/ViewFlipper;->indexOfChild(Landroid/view/View;)I

    move-result p0

    :goto_0
    move v1, p0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPausedView:Landroid/view/View;

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    iget-object p0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPausedView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/widget/ViewFlipper;->indexOfChild(Landroid/view/View;)I

    move-result p0

    goto :goto_0

    :cond_4
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberView:Landroid/widget/TextView;

    if-nez v0, :cond_5

    goto :goto_1

    :cond_5
    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    iget-object p0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/ViewFlipper;->indexOfChild(Landroid/view/View;)I

    move-result p0

    goto :goto_0

    :goto_1
    return v1
.end method

.method static updateSelector(Landroid/view/View;Landroid/view/View;Landroid/animation/ValueAnimator;Z)Landroid/animation/ValueAnimator;
    .locals 16

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-static/range {p0 .. p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->hasFocus()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    int-to-long v3, v0

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-object p2

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual/range {p2 .. p2}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    move-object/from16 v3, p2

    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getAlpha()F

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v6, v7}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    int-to-long v7, v0

    invoke-virtual {v6, v7, v8}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    sget-object v6, Landroidx/leanback/widget/AbstractMediaItemPresenter;->sTempRect:Landroid/graphics/Rect;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v11

    const/4 v12, 0x0

    invoke-virtual {v6, v12, v12, v9, v11}, Landroid/graphics/Rect;->set(IIII)V

    move-object/from16 v9, p1

    invoke-virtual {v0, v9, v6}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    const/4 v9, 0x2

    if-eqz p3, :cond_3

    const/4 v11, 0x1

    if-ne v2, v11, :cond_2

    iget v2, v6, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v11

    add-int/2addr v2, v11

    iput v2, v6, Landroid/graphics/Rect;->right:I

    iget v2, v6, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    div-int/2addr v0, v9

    sub-int/2addr v2, v0

    iput v2, v6, Landroid/graphics/Rect;->left:I

    goto :goto_1

    :cond_2
    iget v2, v6, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v11

    sub-int/2addr v2, v11

    iput v2, v6, Landroid/graphics/Rect;->left:I

    iget v2, v6, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    div-int/2addr v0, v9

    add-int/2addr v2, v0

    iput v2, v6, Landroid/graphics/Rect;->right:I

    :cond_3
    :goto_1
    iget v11, v6, Landroid/graphics/Rect;->left:I

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v13

    iget v0, v10, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    sub-int/2addr v0, v13

    int-to-float v14, v0

    iget v0, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v0, v11

    int-to-float v12, v0

    cmpl-float v0, v12, v4

    if-nez v0, :cond_4

    cmpl-float v0, v14, v4

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    cmpl-float v0, v5, v4

    if-nez v0, :cond_5

    iput v13, v10, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    iput v11, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->requestLayout()V

    goto :goto_2

    :cond_5
    new-array v0, v9, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v3

    invoke-virtual {v3, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v3, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Landroidx/leanback/widget/AbstractMediaItemPresenter$1;

    move-object v9, v0

    move-object/from16 v15, p0

    invoke-direct/range {v9 .. v15}, Landroidx/leanback/widget/AbstractMediaItemPresenter$1;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;IFIFLandroid/view/View;)V

    invoke-virtual {v3, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->start()V

    :goto_2
    return-object v3

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method protected createRowViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/RowPresenter$ViewHolder;
    .locals 3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mThemeId:I

    if-eqz v1, :cond_0

    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget v2, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mThemeId:I

    invoke-direct {v1, v0, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    move-object v0, v1

    :cond_0
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/leanback/R$layout;->lb_row_media_item:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;

    invoke-direct {v0, p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;-><init>(Landroid/view/View;)V

    iput-object p0, v0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    iget-boolean p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mBackgroundColorSet:Z

    if-eqz p1, :cond_1

    iget-object p1, v0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaRowView:Landroid/view/View;

    iget v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mBackgroundColor:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_1
    return-object v0
.end method

.method public getActionPresenter()Landroidx/leanback/widget/Presenter;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mMediaItemActionPresenter:Landroidx/leanback/widget/Presenter;

    return-object v0
.end method

.method protected getMediaPlayState(Ljava/lang/Object;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getThemeId()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mThemeId:I

    return v0
.end method

.method public hasMediaRowSeparator()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mMediaRowSeparator:Z

    return v0
.end method

.method protected isClippingChildren()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isUsingDefaultSelectEffect()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected abstract onBindMediaDetails(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;Ljava/lang/Object;)V
.end method

.method public onBindMediaPlayState(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V
    .locals 2

    invoke-static {p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->calculateMediaItemNumberFlipperIndex(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p1, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    if-eq v1, v0, :cond_0

    iget-object p1, p1, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p1, v0}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    :cond_0
    return-void
.end method

.method protected onBindRowActions(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V
    .locals 0

    invoke-virtual {p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->onBindRowActions()V

    return-void
.end method

.method protected onBindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/RowPresenter;->onBindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;Ljava/lang/Object;)V

    check-cast p1, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onBindRowActions(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    invoke-virtual {p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemRowSeparator()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->hasMediaRowSeparator()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onBindMediaPlayState(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    invoke-virtual {p0, p1, p2}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onBindMediaDetails(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;Ljava/lang/Object;)V

    return-void
.end method

.method protected onUnbindMediaDetails(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V
    .locals 0

    return-void
.end method

.method public onUnbindMediaPlayState(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V
    .locals 0

    return-void
.end method

.method public setActionPresenter(Landroidx/leanback/widget/Presenter;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mMediaItemActionPresenter:Landroidx/leanback/widget/Presenter;

    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mBackgroundColorSet:Z

    iput p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mBackgroundColor:I

    return-void
.end method

.method public setHasMediaRowSeparator(Z)V
    .locals 0

    iput-boolean p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mMediaRowSeparator:Z

    return-void
.end method

.method public setThemeId(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter;->mThemeId:I

    return-void
.end method
