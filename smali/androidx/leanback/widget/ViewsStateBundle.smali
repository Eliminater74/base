.class final Landroidx/leanback/widget/ViewsStateBundle;
.super Ljava/lang/Object;
.source "ViewsStateBundle.java"


# static fields
.field private static final LIMIT_DEFAULT:I = 0x64

.field private static final UNLIMITED:I = 0x7fffffff


# instance fields
.field private mChildStates:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;>;"
        }
    .end annotation
.end field

.field private mLimitNumber:I

.field private mSavePolicy:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    const/16 v0, 0x64

    iput v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    return-void
.end method

.method private applyPolicyChanges()V
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    if-lez v0, :cond_1

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/collection/LruCache;->maxSize()I

    move-result v0

    iget v1, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    if-eq v0, v1, :cond_6

    :cond_0
    new-instance v0, Landroidx/collection/LruCache;

    iget v1, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    invoke-direct {v0, v1}, Landroidx/collection/LruCache;-><init>(I)V

    iput-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    goto :goto_1

    :cond_4
    :goto_0
    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    const v1, 0x7fffffff

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroidx/collection/LruCache;->maxSize()I

    move-result v0

    if-eq v0, v1, :cond_6

    :cond_5
    new-instance v0, Landroidx/collection/LruCache;

    invoke-direct {v0, v1}, Landroidx/collection/LruCache;-><init>(I)V

    iput-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    :cond_6
    :goto_1
    return-void
.end method

.method static getSaveStatesKey(I)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private saveViewUnchecked(Landroid/view/View;I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroidx/leanback/widget/ViewsStateBundle;->getSaveStatesKey(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    iget-object p1, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    invoke-virtual {p1, p2, v0}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method


# virtual methods
.method clear()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    :cond_0
    return-void
.end method

.method getLimitNumber()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    return v0
.end method

.method getSavePolicy()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    return v0
.end method

.method loadFromBundle(Landroid/os/Bundle;)V
    .locals 4

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method loadView(Landroid/view/View;I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroidx/leanback/widget/ViewsStateBundle;->getSaveStatesKey(I)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    invoke-virtual {v0, p2}, Landroidx/collection/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/util/SparseArray;

    if-eqz p2, :cond_0

    invoke-virtual {p1, p2}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_0
    return-void
.end method

.method remove(I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/collection/LruCache;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    invoke-static {p1}, Landroidx/leanback/widget/ViewsStateBundle;->getSaveStatesKey(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/collection/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method saveAsBundle()Landroid/os/Bundle;
    .locals 4

    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroidx/collection/LruCache;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mChildStates:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->snapshot()Ljava/util/Map;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method saveOffscreenView(Landroid/view/View;I)V
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Landroidx/leanback/widget/ViewsStateBundle;->saveViewUnchecked(Landroid/view/View;I)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p2}, Landroidx/leanback/widget/ViewsStateBundle;->remove(I)V

    :goto_0
    return-void
.end method

.method saveOnScreenView(Landroid/os/Bundle;Landroid/view/View;I)Landroid/os/Bundle;
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    if-eqz v0, :cond_1

    invoke-static {p3}, Landroidx/leanback/widget/ViewsStateBundle;->getSaveStatesKey(I)Ljava/lang/String;

    move-result-object p3

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    invoke-virtual {p2, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    if-nez p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    :cond_0
    invoke-virtual {p1, p3, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_1
    return-object p1
.end method

.method setLimitNumber(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/ViewsStateBundle;->mLimitNumber:I

    invoke-direct {p0}, Landroidx/leanback/widget/ViewsStateBundle;->applyPolicyChanges()V

    return-void
.end method

.method setSavePolicy(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/ViewsStateBundle;->mSavePolicy:I

    invoke-direct {p0}, Landroidx/leanback/widget/ViewsStateBundle;->applyPolicyChanges()V

    return-void
.end method
