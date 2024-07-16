.class Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;
.super Landroidx/leanback/widget/ControlBarPresenter$ViewHolder;
.source "PlaybackControlsPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/PlaybackControlsPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field final mCurrentTime:Landroid/widget/TextView;

.field mCurrentTimeInMs:J

.field mCurrentTimeMarginStart:I

.field mCurrentTimeStringBuilder:Ljava/lang/StringBuilder;

.field mMoreActionsAdapter:Landroidx/leanback/widget/ObjectAdapter;

.field final mMoreActionsDock:Landroid/widget/FrameLayout;

.field mMoreActionsObserver:Landroidx/leanback/widget/ObjectAdapter$DataObserver;

.field mMoreActionsShowing:Z

.field mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

.field final mProgressBar:Landroid/widget/ProgressBar;

.field mSecondaryProgressInMs:J

.field final mTotalTime:Landroid/widget/TextView;

.field mTotalTimeInMs:J

.field mTotalTimeMarginEnd:I

.field mTotalTimeStringBuilder:Ljava/lang/StringBuilder;

.field final synthetic this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;


# direct methods
.method constructor <init>(Landroidx/leanback/widget/PlaybackControlsPresenter;Landroid/view/View;)V
    .locals 3

    iput-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;

    invoke-direct {p0, p1, p2}, Landroidx/leanback/widget/ControlBarPresenter$ViewHolder;-><init>(Landroidx/leanback/widget/ControlBarPresenter;Landroid/view/View;)V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeInMs:J

    iput-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    iput-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mSecondaryProgressInMs:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeStringBuilder:Ljava/lang/StringBuilder;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeStringBuilder:Ljava/lang/StringBuilder;

    sget v0, Landroidx/leanback/R$id;->more_actions_dock:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsDock:Landroid/widget/FrameLayout;

    sget v0, Landroidx/leanback/R$id;->current_time:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTime:Landroid/widget/TextView;

    sget v1, Landroidx/leanback/R$id;->total_time:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTime:Landroid/widget/TextView;

    sget v2, Landroidx/leanback/R$id;->playback_progress:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    new-instance p2, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder$1;

    invoke-direct {p2, p0, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder$1;-><init>(Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;Landroidx/leanback/widget/PlaybackControlsPresenter;)V

    iput-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsObserver:Landroidx/leanback/widget/ObjectAdapter$DataObserver;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeMarginStart:I

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeMarginEnd:I

    return-void
.end method


# virtual methods
.method getChildMarginFromCenter(Landroid/content/Context;I)I
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter;->getControlIconWidth(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x4

    if-ge p2, v1, :cond_0

    iget-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;

    invoke-virtual {p2, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter;->getChildMarginBiggest(Landroid/content/Context;)I

    move-result p1

    :goto_0
    add-int/2addr v0, p1

    goto :goto_1

    :cond_0
    const/4 v1, 0x6

    if-ge p2, v1, :cond_1

    iget-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;

    invoke-virtual {p2, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter;->getChildMarginBigger(Landroid/content/Context;)I

    move-result p1

    goto :goto_0

    :cond_1
    iget-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->this$0:Landroidx/leanback/widget/PlaybackControlsPresenter;

    invoke-virtual {p2, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter;->getChildMarginDefault(Landroid/content/Context;)I

    move-result p1

    goto :goto_0

    :goto_1
    return v0
.end method

.method getCurrentTime()J
    .locals 2

    iget-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    return-wide v0
.end method

.method getDisplayedAdapter()Landroidx/leanback/widget/ObjectAdapter;
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsShowing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsAdapter:Landroidx/leanback/widget/ObjectAdapter;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mAdapter:Landroidx/leanback/widget/ObjectAdapter;

    :goto_0
    return-object v0
.end method

.method getSecondaryProgress()J
    .locals 2

    iget-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mSecondaryProgressInMs:J

    return-wide v0
.end method

.method getTotalTime()J
    .locals 2

    iget-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    return-wide v0
.end method

.method setCurrentTime(J)V
    .locals 4

    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    iget-wide v2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeInMs:J

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    iput-wide p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeInMs:J

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeStringBuilder:Ljava/lang/StringBuilder;

    invoke-static {v0, v1, p1}, Landroidx/leanback/widget/PlaybackControlsPresenter;->formatTime(JLjava/lang/StringBuilder;)V

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTime:Landroid/widget/TextView;

    iget-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-wide p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mCurrentTimeInMs:J

    long-to-double p1, p1

    iget-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    long-to-double v0, v0

    div-double/2addr p1, v0

    const-wide v0, 0x41dfffffffc00000L    # 2.147483647E9

    mul-double/2addr p1, v0

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    double-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void
.end method

.method setSecondaryProgress(J)V
    .locals 2

    iput-wide p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mSecondaryProgressInMs:J

    long-to-double p1, p1

    iget-wide v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    long-to-double v0, v0

    div-double/2addr p1, v0

    const-wide v0, 0x41dfffffffc00000L    # 2.147483647E9

    mul-double/2addr p1, v0

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    double-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setSecondaryProgress(I)V

    return-void
.end method

.method setTotalTime(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTime:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iput-wide p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeInMs:J

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeStringBuilder:Ljava/lang/StringBuilder;

    invoke-static {p1, p2, v0}, Landroidx/leanback/widget/PlaybackControlsPresenter;->formatTime(JLjava/lang/StringBuilder;)V

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTime:Landroid/widget/TextView;

    iget-object p2, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mTotalTimeStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    const p2, 0x7fffffff

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setMax(I)V

    :goto_0
    return-void
.end method

.method showMoreActions(Z)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    if-nez p1, :cond_0

    new-instance p1, Landroidx/leanback/widget/PlaybackControlsRow$MoreActions;

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsDock:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroidx/leanback/widget/PlaybackControlsRow$MoreActions;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsDock:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/Presenter;->onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/Presenter$ViewHolder;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v0, v1, p1}, Landroidx/leanback/widget/Presenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    new-instance v1, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder$2;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder$2;-><init>(Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;)V

    invoke-virtual {p1, v0, v1}, Landroidx/leanback/widget/Presenter;->setOnClickListener(Landroidx/leanback/widget/Presenter$ViewHolder;Landroid/view/View$OnClickListener;)V

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    iget-object p1, p1, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-nez p1, :cond_2

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsDock:Landroid/widget/FrameLayout;

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    iget-object v0, v0, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    if-eqz p1, :cond_2

    iget-object p1, p1, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsDock:Landroid/widget/FrameLayout;

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsViewHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    iget-object v0, v0, Landroidx/leanback/widget/Presenter$ViewHolder;->view:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_2
    :goto_0
    return-void
.end method

.method toggleMoreActions()V
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsShowing:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mMoreActionsShowing:Z

    iget-object v0, p0, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/PlaybackControlsPresenter$ViewHolder;->showControls(Landroidx/leanback/widget/Presenter;)V

    return-void
.end method
