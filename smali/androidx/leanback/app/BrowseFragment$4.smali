.class Landroidx/leanback/app/BrowseFragment$4;
.super Ljava/lang/Object;
.source "BrowseFragment.java"

# interfaces
.implements Landroidx/leanback/widget/BrowseFrameLayout$OnFocusSearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/app/BrowseFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/leanback/app/BrowseFragment;


# direct methods
.method constructor <init>(Landroidx/leanback/app/BrowseFragment;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusSearch(Landroid/view/View;I)Landroid/view/View;
    .locals 5

    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean v0, v0, Landroidx/leanback/app/BrowseFragment;->mCanShowHeaders:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/BrowseFragment;->isInHeadersTransition()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/BrowseFragment;->getTitleView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/BrowseFragment;->getTitleView()Landroid/view/View;

    move-result-object v0

    if-eq p1, v0, :cond_1

    const/16 v0, 0x21

    if-ne p2, v0, :cond_1

    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {p1}, Landroidx/leanback/app/BrowseFragment;->getTitleView()Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/BrowseFragment;->getTitleView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x82

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/BrowseFragment;->getTitleView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_3

    if-ne p2, v1, :cond_3

    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean p1, p1, Landroidx/leanback/app/BrowseFragment;->mCanShowHeaders:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean p1, p1, Landroidx/leanback/app/BrowseFragment;->mShowingHeaders:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseFragment;->mHeadersFragment:Landroidx/leanback/app/HeadersFragment;

    invoke-virtual {p1}, Landroidx/leanback/app/HeadersFragment;->getVerticalGridView()Landroidx/leanback/widget/VerticalGridView;

    move-result-object p1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseFragment;->mMainFragment:Landroid/app/Fragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    :goto_0
    return-object p1

    :cond_3
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    :goto_1
    const/16 v0, 0x42

    const/16 v3, 0x11

    if-eqz v2, :cond_5

    move v4, v0

    goto :goto_2

    :cond_5
    move v4, v3

    :goto_2
    if-eqz v2, :cond_6

    move v0, v3

    :cond_6
    iget-object v2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean v2, v2, Landroidx/leanback/app/BrowseFragment;->mCanShowHeaders:Z

    if-eqz v2, :cond_9

    if-ne p2, v4, :cond_9

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {p2}, Landroidx/leanback/app/BrowseFragment;->isVerticalScrolling()Z

    move-result p2

    if-nez p2, :cond_8

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean p2, p2, Landroidx/leanback/app/BrowseFragment;->mShowingHeaders:Z

    if-nez p2, :cond_8

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {p2}, Landroidx/leanback/app/BrowseFragment;->isHeadersDataReady()Z

    move-result p2

    if-nez p2, :cond_7

    goto :goto_3

    :cond_7
    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseFragment;->mHeadersFragment:Landroidx/leanback/app/HeadersFragment;

    invoke-virtual {p1}, Landroidx/leanback/app/HeadersFragment;->getVerticalGridView()Landroidx/leanback/widget/VerticalGridView;

    move-result-object p1

    :cond_8
    :goto_3
    return-object p1

    :cond_9
    if-ne p2, v0, :cond_c

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    invoke-virtual {p2}, Landroidx/leanback/app/BrowseFragment;->isVerticalScrolling()Z

    move-result p2

    if-eqz p2, :cond_a

    return-object p1

    :cond_a
    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p2, p2, Landroidx/leanback/app/BrowseFragment;->mMainFragment:Landroid/app/Fragment;

    if-eqz p2, :cond_b

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p2, p2, Landroidx/leanback/app/BrowseFragment;->mMainFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_b

    iget-object p1, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseFragment;->mMainFragment:Landroid/app/Fragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    :cond_b
    return-object p1

    :cond_c
    if-ne p2, v1, :cond_d

    iget-object p2, p0, Landroidx/leanback/app/BrowseFragment$4;->this$0:Landroidx/leanback/app/BrowseFragment;

    iget-boolean p2, p2, Landroidx/leanback/app/BrowseFragment;->mShowingHeaders:Z

    if-eqz p2, :cond_d

    return-object p1

    :cond_d
    const/4 p1, 0x0

    return-object p1
.end method
