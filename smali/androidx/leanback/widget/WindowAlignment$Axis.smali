.class final Landroidx/leanback/widget/WindowAlignment$Axis;
.super Ljava/lang/Object;
.source "WindowAlignment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/WindowAlignment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Axis"
.end annotation


# static fields
.field private static final PF_KEYLINE_OVER_HIGH_EDGE:I = 0x2

.field private static final PF_KEYLINE_OVER_LOW_EDGE:I = 0x1


# instance fields
.field private mMaxEdge:I

.field private mMaxScroll:I

.field private mMinEdge:I

.field private mMinScroll:I

.field private mPaddingMax:I

.field private mPaddingMin:I

.field private mPreferredKeyLine:I

.field private mReversedFlow:Z

.field private mSize:I

.field private mWindowAlignment:I

.field private mWindowAlignmentOffset:I

.field private mWindowAlignmentOffsetPercent:F


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    const/4 p1, 0x3

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    const/4 p1, 0x0

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffset:I

    const/high16 p1, 0x42480000    # 50.0f

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffsetPercent:F

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->reset()V

    return-void
.end method


# virtual methods
.method calculateKeyline()I
    .locals 4

    iget-boolean v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    const/high16 v1, 0x42c80000    # 100.0f

    const/high16 v2, -0x40800000    # -1.0f

    if-nez v0, :cond_1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffset:I

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    add-int/2addr v0, v3

    :goto_0
    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffsetPercent:F

    cmpl-float v2, v3, v2

    if-eqz v2, :cond_3

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    int-to-float v2, v2

    mul-float/2addr v2, v3

    div-float/2addr v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    goto :goto_2

    :cond_1
    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffset:I

    if-ltz v0, :cond_2

    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    sub-int/2addr v3, v0

    move v0, v3

    goto :goto_1

    :cond_2
    neg-int v0, v0

    :goto_1
    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffsetPercent:F

    cmpl-float v2, v3, v2

    if-eqz v2, :cond_3

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    int-to-float v2, v2

    mul-float/2addr v2, v3

    div-float/2addr v2, v1

    float-to-int v1, v2

    sub-int/2addr v0, v1

    :cond_3
    :goto_2
    return v0
.end method

.method calculateScrollToKeyLine(II)I
    .locals 0

    sub-int/2addr p1, p2

    return p1
.end method

.method public getClientSize()I
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    iget v1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMax:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getMaxScroll()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    return v0
.end method

.method public getMinScroll()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    return v0
.end method

.method public getPaddingMax()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMax:I

    return v0
.end method

.method public getPaddingMin()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    return v0
.end method

.method public getScroll(I)I
    .locals 8

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->getSize()I

    move-result v0

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateKeyline()I

    move-result v1

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isMinUnknown()Z

    move-result v2

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isMaxUnknown()Z

    move-result v3

    if-nez v2, :cond_2

    iget v4, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    sub-int v5, v1, v4

    iget-boolean v6, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    if-nez v6, :cond_0

    iget v6, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_2

    goto :goto_0

    :cond_0
    iget v6, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_2

    :goto_0
    iget v6, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    sub-int v7, p1, v6

    if-gt v7, v5, :cond_2

    sub-int/2addr v6, v4

    if-nez v3, :cond_1

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    if-le v6, p1, :cond_1

    move v6, p1

    :cond_1
    return v6

    :cond_2
    if-nez v3, :cond_5

    sub-int v3, v0, v1

    iget v4, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMax:I

    sub-int/2addr v3, v4

    iget-boolean v5, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    if-nez v5, :cond_3

    iget v5, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_5

    goto :goto_1

    :cond_3
    iget v5, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_5

    :goto_1
    iget v5, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    sub-int v6, v5, p1

    if-gt v6, v3, :cond_5

    sub-int/2addr v0, v4

    sub-int/2addr v5, v0

    if-nez v2, :cond_4

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    if-ge v5, p1, :cond_4

    move v5, p1

    :cond_4
    return v5

    :cond_5
    invoke-virtual {p0, p1, v1}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p1

    return p1
.end method

.method public getSize()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    return v0
.end method

.method public getWindowAlignment()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    return v0
.end method

.method public getWindowAlignmentOffset()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffset:I

    return v0
.end method

.method public getWindowAlignmentOffsetPercent()F
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffsetPercent:F

    return v0
.end method

.method public invalidateScrollMax()V
    .locals 1

    const v0, 0x7fffffff

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    return-void
.end method

.method public invalidateScrollMin()V
    .locals 1

    const/high16 v0, -0x80000000

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    return-void
.end method

.method public isMaxUnknown()Z
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMinUnknown()Z
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isPreferKeylineOverHighEdge()Z
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isPreferKeylineOverLowEdge()Z
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method reset()V
    .locals 1

    const/high16 v0, -0x80000000

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    const v0, 0x7fffffff

    iput v0, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    return-void
.end method

.method public setPadding(II)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    iput p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMax:I

    return-void
.end method

.method setPreferKeylineOverHighEdge(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    or-int/lit8 p1, p1, 0x2

    goto :goto_0

    :cond_0
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    and-int/lit8 p1, p1, -0x3

    :goto_0
    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    return-void
.end method

.method setPreferKeylineOverLowEdge(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    or-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    and-int/lit8 p1, p1, -0x2

    :goto_0
    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPreferredKeyLine:I

    return-void
.end method

.method public setReversedFlow(Z)V
    .locals 0

    iput-boolean p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    return-void
.end method

.method public setSize(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mSize:I

    return-void
.end method

.method public setWindowAlignment(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    return-void
.end method

.method public setWindowAlignmentOffset(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffset:I

    return-void
.end method

.method public setWindowAlignmentOffsetPercent(F)V
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_2

    :cond_1
    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignmentOffsetPercent:F

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " min:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " max:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateMinMax(IIII)V
    .locals 4

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    iput p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->getClientSize()I

    move-result p1

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateKeyline()I

    move-result p2

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isMinUnknown()Z

    move-result v0

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isMaxUnknown()Z

    move-result v1

    if-nez v0, :cond_2

    iget-boolean v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    if-nez v2, :cond_0

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_0
    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_1

    :goto_0
    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinEdge:I

    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    sub-int/2addr v2, v3

    iput v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p3, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result v2

    iput v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    :cond_2
    :goto_1
    if-nez v1, :cond_5

    iget-boolean v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    if-nez v2, :cond_3

    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_4

    goto :goto_2

    :cond_3
    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_4

    :goto_2
    iget v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxEdge:I

    iget v3, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mPaddingMin:I

    sub-int/2addr v2, v3

    sub-int/2addr v2, p1

    iput v2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    goto :goto_3

    :cond_4
    invoke-virtual {p0, p4, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    :cond_5
    :goto_3
    if-nez v1, :cond_d

    if-nez v0, :cond_d

    iget-boolean p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mReversedFlow:Z

    if-nez p1, :cond_9

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isPreferKeylineOverLowEdge()Z

    move-result p1

    if-eqz p1, :cond_6

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    invoke-virtual {p0, p4, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    :cond_6
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    iget p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    goto :goto_4

    :cond_7
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isPreferKeylineOverHighEdge()Z

    move-result p1

    if-eqz p1, :cond_8

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-virtual {p0, p3, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    :cond_8
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    iget p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    goto :goto_4

    :cond_9
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mWindowAlignment:I

    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isPreferKeylineOverLowEdge()Z

    move-result p1

    if-eqz p1, :cond_a

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-virtual {p0, p3, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    :cond_a
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    iget p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    goto :goto_4

    :cond_b
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Landroidx/leanback/widget/WindowAlignment$Axis;->isPreferKeylineOverHighEdge()Z

    move-result p1

    if-eqz p1, :cond_c

    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    invoke-virtual {p0, p4, p2}, Landroidx/leanback/widget/WindowAlignment$Axis;->calculateScrollToKeyLine(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    :cond_c
    iget p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMinScroll:I

    iget p2, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/WindowAlignment$Axis;->mMaxScroll:I

    :cond_d
    :goto_4
    return-void
.end method
