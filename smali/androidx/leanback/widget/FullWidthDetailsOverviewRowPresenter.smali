.class public Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;
.super Landroidx/leanback/widget/RowPresenter;
.source "FullWidthDetailsOverviewRowPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;,
        Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ActionsItemBridgeAdapter;,
        Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;
    }
.end annotation


# static fields
.field public static final ALIGN_MODE_MIDDLE:I = 0x1

.field public static final ALIGN_MODE_START:I = 0x0

.field static final DEBUG:Z = false

.field public static final STATE_FULL:I = 0x1

.field public static final STATE_HALF:I = 0x0

.field public static final STATE_SMALL:I = 0x2

.field static final TAG:Ljava/lang/String; = "FullWidthDetailsRP"

.field static final sHandler:Landroid/os/Handler;


# instance fields
.field mActionClickedListener:Landroidx/leanback/widget/OnActionClickedListener;

.field private mActionsBackgroundColor:I

.field private mActionsBackgroundColorSet:Z

.field private mAlignmentMode:I

.field private mBackgroundColor:I

.field private mBackgroundColorSet:Z

.field final mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

.field final mDetailsPresenter:Landroidx/leanback/widget/Presenter;

.field protected mInitialState:I

.field private mListener:Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;

.field private mParticipatingEntranceTransition:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->sHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroidx/leanback/widget/Presenter;)V
    .locals 1

    new-instance v0, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    invoke-direct {v0}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;-><init>()V

    invoke-direct {p0, p1, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;-><init>(Landroidx/leanback/widget/Presenter;Landroidx/leanback/widget/DetailsOverviewLogoPresenter;)V

    return-void
.end method

.method public constructor <init>(Landroidx/leanback/widget/Presenter;Landroidx/leanback/widget/DetailsOverviewLogoPresenter;)V
    .locals 2

    invoke-direct {p0}, Landroidx/leanback/widget/RowPresenter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mInitialState:I

    iput v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColor:I

    iput v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColor:I

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->setHeaderPresenter(Landroidx/leanback/widget/RowHeaderPresenter;)V

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->setSelectEffectEnabled(Z)V

    iput-object p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iput-object p2, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    return-void
.end method


# virtual methods
.method protected createRowViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/RowPresenter$ViewHolder;
    .locals 3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->getLayoutResourceId()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    iget-object v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v2, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    invoke-direct {v0, p0, p1, v1, v2}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;-><init>(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;Landroid/view/View;Landroidx/leanback/widget/Presenter;Landroidx/leanback/widget/DetailsOverviewLogoPresenter;)V

    iget-object p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    iget-object v1, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsLogoViewHolder:Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    invoke-virtual {p1, v1, v0, p0}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->setContext(Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;)V

    iget p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mInitialState:I

    invoke-virtual {p0, v0, p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->setState(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;I)V

    new-instance p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ActionsItemBridgeAdapter;

    invoke-direct {p1, p0, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ActionsItemBridgeAdapter;-><init>(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;)V

    iput-object p1, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mActionBridgeAdapter:Landroidx/leanback/widget/ItemBridgeAdapter;

    iget-object p1, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    iget-boolean v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColorSet:Z

    if-eqz v1, :cond_0

    iget v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColor:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_0
    iget-boolean v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColorSet:Z

    if-eqz v1, :cond_1

    sget v1, Landroidx/leanback/R$id;->details_overview_actions_background:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_1
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroidx/leanback/widget/RoundedRectHelper;->setClipToRoundedOutline(Landroid/view/View;Z)V

    invoke-virtual {p0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->getSelectEffectEnabled()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    iget-object p1, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mActionsRow:Landroidx/leanback/widget/HorizontalGridView;

    new-instance v1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$1;

    invoke-direct {v1, p0, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$1;-><init>(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;)V

    invoke-virtual {p1, v1}, Landroidx/leanback/widget/HorizontalGridView;->setOnUnhandledKeyListener(Landroidx/leanback/widget/BaseGridView$OnUnhandledKeyListener;)V

    return-object v0
.end method

.method public final getActionsBackgroundColor()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColor:I

    return v0
.end method

.method public final getAlignmentMode()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mAlignmentMode:I

    return v0
.end method

.method public final getBackgroundColor()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColor:I

    return v0
.end method

.method public final getInitialState()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mInitialState:I

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    sget v0, Landroidx/leanback/R$layout;->lb_fullwidth_details_overview:I

    return v0
.end method

.method public getOnActionClickedListener()Landroidx/leanback/widget/OnActionClickedListener;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionClickedListener:Landroidx/leanback/widget/OnActionClickedListener;

    return-object v0
.end method

.method protected isClippingChildren()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final isParticipatingEntranceTransition()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mParticipatingEntranceTransition:Z

    return v0
.end method

.method public final isUsingDefaultSelectEffect()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final notifyOnBindLogo(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;)V
    .locals 2

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->onLayoutOverviewFrame(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result v0

    invoke-virtual {p0, p1, v0, v1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->onLayoutLogo(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mListener:Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;->onBindLogo(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;)V

    :cond_0
    return-void
.end method

.method protected onBindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/RowPresenter;->onBindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;Ljava/lang/Object;)V

    check-cast p2, Landroidx/leanback/widget/DetailsOverviewRow;

    check-cast p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    iget-object v1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsLogoViewHolder:Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    invoke-virtual {v0, v1, p2}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {p2}, Landroidx/leanback/widget/DetailsOverviewRow;->getItem()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroidx/leanback/widget/Presenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->onBind()V

    return-void
.end method

.method protected onLayoutLogo(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V
    .locals 2

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getLogoViewHolder()Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    move-result-object p2

    iget-object p2, p2, Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mAlignmentMode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_logo_margin_start:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_left:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget v1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    sub-int/2addr v0, v1

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    :goto_0
    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result p1

    if-eqz p1, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_blank_height:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget v1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    div-int/2addr v1, v0

    sub-int/2addr p1, v1

    iput p1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    iput p1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Landroidx/leanback/R$dimen;->lb_details_v2_blank_height:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_actions_height:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_description_margin_top:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr p1, v0

    iput p1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :goto_1
    invoke-virtual {p2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected onLayoutOverviewFrame(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V
    .locals 5

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p2, v0, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    move p2, v2

    :goto_0
    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result v3

    if-ne v3, v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    if-ne p2, v0, :cond_2

    if-eqz p3, :cond_9

    :cond_2
    iget-object p2, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    iget-object p3, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getLogoViewHolder()Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    move-result-object v3

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getRow()Landroidx/leanback/widget/Row;

    move-result-object v4

    check-cast v4, Landroidx/leanback/widget/DetailsOverviewRow;

    invoke-virtual {p3, v3, v4}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->isBoundToImage(Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;Landroidx/leanback/widget/DetailsOverviewRow;)Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getLogoViewHolder()Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    move-result-object p3

    iget-object p3, p3, Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_2

    :cond_3
    move p3, v2

    :goto_2
    iget v3, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mAlignmentMode:I

    if-eq v3, v1, :cond_5

    if-eqz v0, :cond_4

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_logo_margin_start:I

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_4

    :cond_4
    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_logo_margin_start:I

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr p3, v1

    :goto_3
    move v1, v2

    goto :goto_4

    :cond_5
    if-eqz v0, :cond_6

    sget v1, Landroidx/leanback/R$dimen;->lb_details_v2_left:I

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sub-int/2addr v1, p3

    goto :goto_4

    :cond_6
    sget p3, Landroidx/leanback/R$dimen;->lb_details_v2_left:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    goto :goto_3

    :goto_4
    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getOverviewView()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_7

    move v4, v2

    goto :goto_5

    :cond_7
    sget v4, Landroidx/leanback/R$dimen;->lb_details_v2_blank_height:I

    invoke-virtual {p2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    :goto_5
    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getOverviewView()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getDetailsDescriptionFrame()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v3, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getActionsRow()Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v1, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    if-eqz v0, :cond_8

    goto :goto_6

    :cond_8
    sget p3, Landroidx/leanback/R$dimen;->lb_details_v2_actions_height:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_6
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9
    return-void
.end method

.method protected onRowViewAttachedToWindow(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/leanback/widget/RowPresenter;->onRowViewAttachedToWindow(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V

    check-cast p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/Presenter;->onViewAttachedToWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    iget-object p1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsLogoViewHolder:Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->onViewAttachedToWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    return-void
.end method

.method protected onRowViewDetachedFromWindow(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/leanback/widget/RowPresenter;->onRowViewDetachedFromWindow(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V

    check-cast p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/Presenter;->onViewDetachedFromWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    iget-object v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    iget-object p1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsLogoViewHolder:Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->onViewDetachedFromWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    return-void
.end method

.method protected onSelectLevelChanged(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/leanback/widget/RowPresenter;->onSelectLevelChanged(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V

    invoke-virtual {p0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->getSelectEffectEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    iget-object v0, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mColorDimmer:Landroidx/leanback/graphics/ColorOverlayDimmer;

    invoke-virtual {v0}, Landroidx/leanback/graphics/ColorOverlayDimmer;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    iget-object p1, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mOverviewFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    :cond_0
    return-void
.end method

.method protected onStateChanged(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->onLayoutOverviewFrame(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V

    invoke-virtual {p0, p1, p2, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->onLayoutLogo(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;IZ)V

    return-void
.end method

.method protected onUnbindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V
    .locals 3

    move-object v0, p1

    check-cast v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;

    invoke-virtual {v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->onUnbind()V

    iget-object v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v2, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsDescriptionViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v1, v2}, Landroidx/leanback/widget/Presenter;->onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    iget-object v1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mDetailsOverviewLogoPresenter:Landroidx/leanback/widget/DetailsOverviewLogoPresenter;

    iget-object v0, v0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mDetailsLogoViewHolder:Landroidx/leanback/widget/DetailsOverviewLogoPresenter$ViewHolder;

    invoke-virtual {v1, v0}, Landroidx/leanback/widget/DetailsOverviewLogoPresenter;->onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    invoke-super {p0, p1}, Landroidx/leanback/widget/RowPresenter;->onUnbindRowViewHolder(Landroidx/leanback/widget/RowPresenter$ViewHolder;)V

    return-void
.end method

.method public final setActionsBackgroundColor(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColor:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionsBackgroundColorSet:Z

    return-void
.end method

.method public final setAlignmentMode(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mAlignmentMode:I

    return-void
.end method

.method public final setBackgroundColor(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColor:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mBackgroundColorSet:Z

    return-void
.end method

.method public setEntranceTransitionState(Landroidx/leanback/widget/RowPresenter$ViewHolder;Z)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/RowPresenter;->setEntranceTransitionState(Landroidx/leanback/widget/RowPresenter$ViewHolder;Z)V

    iget-boolean v0, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mParticipatingEntranceTransition:Z

    if-eqz v0, :cond_1

    iget-object p1, p1, Landroidx/leanback/widget/RowPresenter$ViewHolder;->view:Landroid/view/View;

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x4

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public final setInitialState(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mInitialState:I

    return-void
.end method

.method public final setListener(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mListener:Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$Listener;

    return-void
.end method

.method public setOnActionClickedListener(Landroidx/leanback/widget/OnActionClickedListener;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mActionClickedListener:Landroidx/leanback/widget/OnActionClickedListener;

    return-void
.end method

.method public final setParticipatingEntranceTransition(Z)V
    .locals 0

    iput-boolean p1, p0, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->mParticipatingEntranceTransition:Z

    return-void
.end method

.method public final setState(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;I)V
    .locals 1

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result v0

    if-eq v0, p2, :cond_0

    invoke-virtual {p1}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->getState()I

    move-result v0

    iput p2, p1, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;->mState:I

    invoke-virtual {p0, p1, v0}, Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter;->onStateChanged(Landroidx/leanback/widget/FullWidthDetailsOverviewRowPresenter$ViewHolder;I)V

    :cond_0
    return-void
.end method
