.class public Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ItemBridgeAdapter.java"

# interfaces
.implements Landroidx/leanback/widget/FacetProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/ItemBridgeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field mExtraObject:Ljava/lang/Object;

.field final mHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

.field mItem:Ljava/lang/Object;

.field final mPresenter:Landroidx/leanback/widget/Presenter;


# direct methods
.method constructor <init>(Landroidx/leanback/widget/Presenter;Landroid/view/View;Landroidx/leanback/widget/Presenter$ViewHolder;)V
    .locals 0

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    iput-object p3, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    return-void
.end method


# virtual methods
.method public final getExtraObject()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mExtraObject:Ljava/lang/Object;

    return-object v0
.end method

.method public getFacet(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/Presenter$ViewHolder;->getFacet(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final getItem()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mItem:Ljava/lang/Object;

    return-object v0
.end method

.method public final getPresenter()Landroidx/leanback/widget/Presenter;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mPresenter:Landroidx/leanback/widget/Presenter;

    return-object v0
.end method

.method public final getViewHolder()Landroidx/leanback/widget/Presenter$ViewHolder;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mHolder:Landroidx/leanback/widget/Presenter$ViewHolder;

    return-object v0
.end method

.method public setExtraObject(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/ItemBridgeAdapter$ViewHolder;->mExtraObject:Ljava/lang/Object;

    return-void
.end method
