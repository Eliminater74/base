.class public abstract Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;
.super Landroidx/leanback/widget/Presenter;
.source "AbstractDetailsDescriptionPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/widget/Presenter;-><init>()V

    return-void
.end method

.method private setTopMargin(Landroid/widget/TextView;I)V
    .locals 1

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method protected abstract onBindDescription(Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;Ljava/lang/Object;)V
.end method

.method public final onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V
    .locals 6

    check-cast p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->onBindDescription(Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;Ljava/lang/Object;)V

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v0, 0x1

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    move p2, v2

    goto :goto_0

    :cond_0
    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    iget v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitleLineSpacing:I

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineHeight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineSpacingExtra()F

    move-result v4

    add-float/2addr v3, v4

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    move-result v4

    invoke-virtual {p2, v3, v4}, Landroid/widget/TextView;->setLineSpacing(FF)V

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    iget v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitleMaxLines:I

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    move p2, v0

    :goto_0
    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitle:Landroid/widget/TextView;

    iget v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitleMargin:I

    invoke-direct {p0, v3, v4}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v0, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    move v0, v2

    goto :goto_1

    :cond_1
    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    if-eqz p2, :cond_2

    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitle:Landroid/widget/TextView;

    iget v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mUnderTitleBaselineMargin:I

    iget-object v5, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitleFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v5, v5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    add-int/2addr v4, v5

    iget-object v5, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitleFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v5, v5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v4, v5

    invoke-direct {p0, v3, v4}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    goto :goto_1

    :cond_2
    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-direct {p0, v3, v2}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    :goto_1
    iget-object v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object p1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_3
    iget-object v1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    iget v3, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBodyLineSpacing:I

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineHeight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineSpacingExtra()F

    move-result v4

    add-float/2addr v3, v4

    iget-object v4, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setLineSpacing(FF)V

    if-eqz v0, :cond_4

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    iget v0, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mUnderSubtitleBaselineMargin:I

    iget-object v1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBodyFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v1, v1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    add-int/2addr v0, v1

    iget-object p1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mSubtitleFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v0, p1

    invoke-direct {p0, p2, v0}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    goto :goto_2

    :cond_4
    if-eqz p2, :cond_5

    iget-object p2, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    iget v0, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mUnderTitleBaselineMargin:I

    iget-object v1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBodyFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v1, v1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    add-int/2addr v0, v1

    iget-object p1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mTitleFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v0, p1

    invoke-direct {p0, p2, v0}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    goto :goto_2

    :cond_5
    iget-object p1, p1, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->mBody:Landroid/widget/TextView;

    invoke-direct {p0, p1, v2}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->setTopMargin(Landroid/widget/TextView;I)V

    :goto_2
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;
    .locals 3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/leanback/R$layout;->lb_details_description:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;

    invoke-direct {v0, p1}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/Presenter$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter;->onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V
    .locals 0

    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V
    .locals 1

    move-object v0, p1

    check-cast v0, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;

    invoke-virtual {v0}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->addPreDrawListener()V

    invoke-super {p0, p1}, Landroidx/leanback/widget/Presenter;->onViewAttachedToWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V
    .locals 1

    move-object v0, p1

    check-cast v0, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;

    invoke-virtual {v0}, Landroidx/leanback/widget/AbstractDetailsDescriptionPresenter$ViewHolder;->removePreDrawListener()V

    invoke-super {p0, p1}, Landroidx/leanback/widget/Presenter;->onViewDetachedFromWindow(Landroidx/leanback/widget/Presenter$ViewHolder;)V

    return-void
.end method
