.class Landroidx/leanback/transition/CustomChangeBounds;
.super Landroid/transition/ChangeBounds;
.source "CustomChangeBounds.java"


# instance fields
.field final mClassStartDelays:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mDefaultStartDelay:I

.field final mIdStartDelays:Landroid/util/SparseIntArray;

.field final mViewStartDelays:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/transition/ChangeBounds;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mViewStartDelays:Ljava/util/HashMap;

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mIdStartDelays:Landroid/util/SparseIntArray;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mClassStartDelays:Ljava/util/HashMap;

    return-void
.end method

.method private getDelay(Landroid/view/View;)I
    .locals 3

    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mViewStartDelays:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mIdStartDelays:Landroid/util/SparseIntArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    if-eq v0, v2, :cond_1

    return v0

    :cond_1
    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mClassStartDelays:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_2
    iget p1, p0, Landroidx/leanback/transition/CustomChangeBounds;->mDefaultStartDelay:I

    return p1
.end method


# virtual methods
.method public createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/transition/ChangeBounds;->createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;

    move-result-object p1

    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    iget-object p2, p3, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    if-eqz p2, :cond_0

    iget-object p2, p3, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    invoke-direct {p0, p2}, Landroidx/leanback/transition/CustomChangeBounds;->getDelay(Landroid/view/View;)I

    move-result p2

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    :cond_0
    return-object p1
.end method

.method public setDefaultStartDelay(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/transition/CustomChangeBounds;->mDefaultStartDelay:I

    return-void
.end method

.method public setStartDelay(II)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mIdStartDelays:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method

.method public setStartDelay(Landroid/view/View;I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mViewStartDelays:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setStartDelay(Ljava/lang/String;I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/transition/CustomChangeBounds;->mClassStartDelays:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
