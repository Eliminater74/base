.class public Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;
.super Landroidx/leanback/widget/RowPresenter$ViewHolder;
.source "AbstractMediaItemPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/AbstractMediaItemPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field private final mActionViewHolders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/leanback/widget/Presenter$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field mFocusViewAnimator:Landroid/animation/ValueAnimator;

.field private final mMediaItemActionsContainer:Landroid/view/ViewGroup;

.field private final mMediaItemDetailsView:Landroid/view/View;

.field private final mMediaItemDurationView:Landroid/widget/TextView;

.field private final mMediaItemNameView:Landroid/widget/TextView;

.field final mMediaItemNumberView:Landroid/widget/TextView;

.field final mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

.field final mMediaItemPausedView:Landroid/view/View;

.field final mMediaItemPlayingView:Landroid/view/View;

.field mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

.field private final mMediaItemRowSeparator:Landroid/view/View;

.field final mMediaRowView:Landroid/view/View;

.field mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

.field final mSelectorView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 5

    invoke-direct {p0, p1}, Landroidx/leanback/widget/RowPresenter$ViewHolder;-><init>(Landroid/view/View;)V

    sget v0, Landroidx/leanback/R$id;->mediaRowSelector:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mSelectorView:Landroid/view/View;

    sget v0, Landroidx/leanback/R$id;->mediaItemRow:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaRowView:Landroid/view/View;

    sget v0, Landroidx/leanback/R$id;->mediaItemDetails:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemDetailsView:Landroid/view/View;

    sget v0, Landroidx/leanback/R$id;->mediaItemName:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNameView:Landroid/widget/TextView;

    sget v0, Landroidx/leanback/R$id;->mediaItemDuration:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemDurationView:Landroid/widget/TextView;

    sget v0, Landroidx/leanback/R$id;->mediaRowSeparator:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowSeparator:Landroid/view/View;

    sget v0, Landroidx/leanback/R$id;->mediaItemActionsContainer:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemActionsContainer:Landroid/view/ViewGroup;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemDetailsView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$1;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$1;-><init>(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemDetailsView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$2;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$2;-><init>(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    sget v0, Landroidx/leanback/R$id;->mediaItemNumberViewFlipper:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewFlipper;

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget v3, Landroidx/leanback/R$attr;->playbackMediaItemNumberViewFlipperLayout:I

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    if-eqz v2, :cond_0

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    goto :goto_0

    :cond_0
    sget v1, Landroidx/leanback/R$layout;->lb_media_item_number_view_flipper:I

    :goto_0
    invoke-virtual {p1, v1, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    sget v0, Landroidx/leanback/R$id;->initial:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberView:Landroid/widget/TextView;

    sget v0, Landroidx/leanback/R$id;->paused:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPausedView:Landroid/view/View;

    sget v0, Landroidx/leanback/R$id;->playing:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPlayingView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method findActionIndex(Landroidx/leanback/widget/MultiActionsProvider$MultiAction;)I
    .locals 3

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getMediaItemActionsContainer()Landroid/view/ViewGroup;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemActionsContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getMediaItemDetailsView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemDetailsView:Landroid/view/View;

    return-object v0
.end method

.method public getMediaItemDurationView()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemDurationView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getMediaItemNameView()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNameView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getMediaItemNumberView()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getMediaItemNumberViewFlipper()Landroid/widget/ViewFlipper;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method public getMediaItemPausedView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPausedView:Landroid/view/View;

    return-object v0
.end method

.method public getMediaItemPlayingView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemPlayingView:Landroid/view/View;

    return-object v0
.end method

.method public getMediaItemRowActions()[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    return-object v0
.end method

.method public getMediaItemRowSeparator()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowSeparator:Landroid/view/View;

    return-object v0
.end method

.method public getSelectorView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mSelectorView:Landroid/view/View;

    return-object v0
.end method

.method public notifyActionChanged(Landroidx/leanback/widget/MultiActionsProvider$MultiAction;)V
    .locals 3

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {v0}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->getActionPresenter()Landroidx/leanback/widget/Presenter;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->findActionIndex(Landroidx/leanback/widget/MultiActionsProvider$MultiAction;)I

    move-result v1

    if-ltz v1, :cond_1

    iget-object v2, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/Presenter;->onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    invoke-virtual {v0, v1, p1}, Landroidx/leanback/widget/Presenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public notifyDetailsChanged()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {v0, p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onUnbindMediaDetails(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getRowObject()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onBindMediaDetails(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;Ljava/lang/Object;)V

    return-void
.end method

.method public notifyPlayStateChanged()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {v0, p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->onBindMediaPlayState(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    return-void
.end method

.method public onBindRowActions()V
    .locals 6

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemActionsContainer()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    iget-object v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemActionsContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    iget-object v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getRowObject()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroidx/leanback/widget/MultiActionsProvider;

    if-eqz v1, :cond_3

    check-cast v0, Landroidx/leanback/widget/MultiActionsProvider;

    invoke-interface {v0}, Landroidx/leanback/widget/MultiActionsProvider;->getActions()[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mRowPresenter:Landroidx/leanback/widget/AbstractMediaItemPresenter;

    invoke-virtual {v1}, Landroidx/leanback/widget/AbstractMediaItemPresenter;->getActionPresenter()Landroidx/leanback/widget/Presenter;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    iput-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    iget-object v2, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_2

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemActionsContainer()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/leanback/widget/Presenter;->onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/Presenter$ViewHolder;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->getMediaItemActionsContainer()Landroid/view/ViewGroup;

    move-result-object v4

    iget-object v5, v3, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v4, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v4, v3, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    new-instance v5, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$3;

    invoke-direct {v5, p0}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$3;-><init>(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v4, v3, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    new-instance v5, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$4;

    invoke-direct {v5, p0, v3, v2}, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder$4;-><init>(Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;Landroidx/leanback/widget/Presenter$ViewHolder;I)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    iget-object v2, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemActionsContainer:Landroid/view/ViewGroup;

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    :goto_2
    array-length v3, v0

    if-ge v2, v3, :cond_3

    iget-object v3, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mActionViewHolders:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v1, v3}, Landroidx/leanback/widget/Presenter;->onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    iget-object v4, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemRowActions:[Landroidx/leanback/widget/MultiActionsProvider$MultiAction;

    aget-object v4, v4, v2

    invoke-virtual {v1, v3, v4}, Landroidx/leanback/widget/Presenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method public setSelectedMediaItemNumberView(I)V
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/AbstractMediaItemPresenter$ViewHolder;->mMediaItemNumberViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, p1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    :cond_0
    return-void
.end method
