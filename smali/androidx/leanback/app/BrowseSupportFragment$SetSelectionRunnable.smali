.class final Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;
.super Ljava/lang/Object;
.source "BrowseSupportFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/app/BrowseSupportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SetSelectionRunnable"
.end annotation


# static fields
.field static final TYPE_INTERNAL_SYNC:I = 0x0

.field static final TYPE_INVALID:I = -0x1

.field static final TYPE_USER_REQUEST:I = 0x1


# instance fields
.field private mPosition:I

.field private mSmooth:Z

.field private mType:I

.field final synthetic this$0:Landroidx/leanback/app/BrowseSupportFragment;


# direct methods
.method constructor <init>(Landroidx/leanback/app/BrowseSupportFragment;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->reset()V

    return-void
.end method

.method private reset()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mPosition:I

    iput v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mType:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mSmooth:Z

    return-void
.end method


# virtual methods
.method post(IIZ)V
    .locals 1

    iget v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mType:I

    if-lt p2, v0, :cond_0

    iput p1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mPosition:I

    iput p2, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mType:I

    iput-boolean p3, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mSmooth:Z

    iget-object p1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseSupportFragment;->mBrowseFrame:Landroidx/leanback/widget/BrowseFrameLayout;

    invoke-virtual {p1, p0}, Landroidx/leanback/widget/BrowseFrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget-boolean p1, p1, Landroidx/leanback/app/BrowseSupportFragment;->mStopped:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget-object p1, p1, Landroidx/leanback/app/BrowseSupportFragment;->mBrowseFrame:Landroidx/leanback/widget/BrowseFrameLayout;

    invoke-virtual {p1, p0}, Landroidx/leanback/widget/BrowseFrameLayout;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public run()V
    .locals 3

    iget-object v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget v1, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mPosition:I

    iget-boolean v2, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mSmooth:Z

    invoke-virtual {v0, v1, v2}, Landroidx/leanback/app/BrowseSupportFragment;->setSelection(IZ)V

    invoke-direct {p0}, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->reset()V

    return-void
.end method

.method public start()V
    .locals 2

    iget v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget-object v0, v0, Landroidx/leanback/app/BrowseSupportFragment;->mBrowseFrame:Landroidx/leanback/widget/BrowseFrameLayout;

    invoke-virtual {v0, p0}, Landroidx/leanback/widget/BrowseFrameLayout;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/BrowseSupportFragment$SetSelectionRunnable;->this$0:Landroidx/leanback/app/BrowseSupportFragment;

    iget-object v0, v0, Landroidx/leanback/app/BrowseSupportFragment;->mBrowseFrame:Landroidx/leanback/widget/BrowseFrameLayout;

    invoke-virtual {v0, p0}, Landroidx/leanback/widget/BrowseFrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method
