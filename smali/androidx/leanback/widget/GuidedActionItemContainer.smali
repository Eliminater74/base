.class Landroidx/leanback/widget/GuidedActionItemContainer;
.super Landroidx/leanback/widget/NonOverlappingLinearLayoutWithForeground;
.source "GuidedActionItemContainer.java"


# instance fields
.field private mFocusOutAllowed:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/leanback/widget/GuidedActionItemContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/leanback/widget/GuidedActionItemContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroidx/leanback/widget/NonOverlappingLinearLayoutWithForeground;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/leanback/widget/GuidedActionItemContainer;->mFocusOutAllowed:Z

    return-void
.end method


# virtual methods
.method public focusSearch(Landroid/view/View;I)Landroid/view/View;
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/GuidedActionItemContainer;->mFocusOutAllowed:Z

    if-nez v0, :cond_2

    invoke-static {p0, p1}, Landroidx/leanback/widget/Util;->isDescendant(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/NonOverlappingLinearLayoutWithForeground;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    move-result-object p1

    invoke-static {p0, p1}, Landroidx/leanback/widget/Util;->isDescendant(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1

    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/NonOverlappingLinearLayoutWithForeground;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public setFocusOutAllowed(Z)V
    .locals 0

    iput-boolean p1, p0, Landroidx/leanback/widget/GuidedActionItemContainer;->mFocusOutAllowed:Z

    return-void
.end method
