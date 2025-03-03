.class public Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;
.super Ljava/lang/Object;
.source "DetailsSupportFragmentBackgroundController.java"


# instance fields
.field mCanUseHost:Z

.field mCoverBitmap:Landroid/graphics/Bitmap;

.field final mFragment:Landroidx/leanback/app/DetailsSupportFragment;

.field mInitialControlVisible:Z

.field private mLastVideoSupportFragmentForGlueHost:Landroidx/fragment/app/Fragment;

.field mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

.field mParallaxDrawableMaxOffset:I

.field mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

.field mSolidColor:I

.field mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;


# direct methods
.method public constructor <init>(Landroidx/leanback/app/DetailsSupportFragment;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCanUseHost:Z

    iput-boolean v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mInitialControlVisible:Z

    iget-object v0, p1, Landroidx/leanback/app/DetailsSupportFragment;->mDetailsBackgroundController:Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;

    if-nez v0, :cond_0

    iput-object p0, p1, Landroidx/leanback/app/DetailsSupportFragment;->mDetailsBackgroundController:Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;

    iput-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Each DetailsSupportFragment is allowed to initialize DetailsSupportFragmentBackgroundController once"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public canNavigateToVideoSupportFragment()Z
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method createGlueHost()Landroidx/leanback/media/PlaybackGlueHost;
    .locals 3

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->onCreateGlueHost()Landroidx/leanback/media/PlaybackGlueHost;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mInitialControlVisible:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v0, v2}, Landroidx/leanback/media/PlaybackGlueHost;->showControlsOverlay(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v2}, Landroidx/leanback/media/PlaybackGlueHost;->hideControlsOverlay(Z)V

    :goto_0
    return-object v0
.end method

.method disableVideoParallax()Z
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsBackgroundVideoHelper;->stopParallax()V

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsBackgroundVideoHelper;->isVideoVisible()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public enableParallax()V
    .locals 7

    iget v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawableMaxOffset:I

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsSupportFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_details_cover_drawable_parallax_movement:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :cond_0
    new-instance v1, Landroidx/leanback/graphics/FitWidthBitmapDrawable;

    invoke-direct {v1}, Landroidx/leanback/graphics/FitWidthBitmapDrawable;-><init>()V

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    new-instance v3, Landroidx/leanback/widget/ParallaxTarget$PropertyValuesHolderTarget;

    sget-object v4, Landroidx/leanback/graphics/FitWidthBitmapDrawable;->PROPERTY_VERTICAL_OFFSET:Landroid/util/Property;

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput v6, v5, v6

    const/4 v6, 0x1

    neg-int v0, v0

    aput v0, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    invoke-direct {v3, v1, v0}, Landroidx/leanback/widget/ParallaxTarget$PropertyValuesHolderTarget;-><init>(Ljava/lang/Object;Landroid/animation/PropertyValuesHolder;)V

    invoke-virtual {p0, v1, v2, v3}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->enableParallax(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroidx/leanback/widget/ParallaxTarget$PropertyValuesHolderTarget;)V

    return-void
.end method

.method public enableParallax(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroidx/leanback/widget/ParallaxTarget$PropertyValuesHolderTarget;)V
    .locals 7

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCoverBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    instance-of v1, p1, Landroidx/leanback/graphics/FitWidthBitmapDrawable;

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Landroidx/leanback/graphics/FitWidthBitmapDrawable;

    invoke-virtual {v1, v0}, Landroidx/leanback/graphics/FitWidthBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    :cond_1
    iget v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mSolidColor:I

    if-eqz v0, :cond_2

    instance-of v1, p2, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_2

    move-object v1, p2

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    :cond_2
    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-nez v0, :cond_3

    new-instance v0, Landroidx/leanback/widget/DetailsParallaxDrawable;

    iget-object v1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v1}, Landroidx/leanback/app/DetailsSupportFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v1}, Landroidx/leanback/app/DetailsSupportFragment;->getParallax()Landroidx/leanback/widget/DetailsParallax;

    move-result-object v3

    move-object v1, v0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Landroidx/leanback/widget/DetailsParallaxDrawable;-><init>(Landroid/content/Context;Landroidx/leanback/widget/DetailsParallax;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroidx/leanback/widget/ParallaxTarget;)V

    iput-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    iget-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {p1, v0}, Landroidx/leanback/app/DetailsSupportFragment;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    const/4 p2, 0x0

    iget-object p3, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {p3}, Landroidx/leanback/app/DetailsSupportFragment;->getParallax()Landroidx/leanback/widget/DetailsParallax;

    move-result-object p3

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    invoke-virtual {v0}, Landroidx/leanback/widget/DetailsParallaxDrawable;->getCoverDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p1, p2, p3, v0}, Landroidx/leanback/app/DetailsBackgroundVideoHelper;-><init>(Landroidx/leanback/media/PlaybackGlue;Landroidx/leanback/widget/DetailsParallax;Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "enableParallaxDrawable must be called before enableVideoPlayback"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsSupportFragment;->findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public final getBottomDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Landroidx/leanback/widget/DetailsParallaxDrawable;->getBottomDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public final getCoverBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCoverBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public final getCoverDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Landroidx/leanback/widget/DetailsParallaxDrawable;->getCoverDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public final getParallaxDrawableMaxOffset()I
    .locals 1

    iget v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawableMaxOffset:I

    return v0
.end method

.method public final getPlaybackGlue()Landroidx/leanback/media/PlaybackGlue;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    return-object v0
.end method

.method public final getSolidColor()I
    .locals 1

    iget v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mSolidColor:I

    return v0
.end method

.method public onCreateGlueHost()Landroidx/leanback/media/PlaybackGlueHost;
    .locals 2

    new-instance v0, Landroidx/leanback/app/VideoSupportFragmentGlueHost;

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Landroidx/leanback/app/VideoSupportFragment;

    invoke-direct {v0, v1}, Landroidx/leanback/app/VideoSupportFragmentGlueHost;-><init>(Landroidx/leanback/app/VideoSupportFragment;)V

    return-object v0
.end method

.method public onCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;
    .locals 1

    new-instance v0, Landroidx/leanback/app/VideoSupportFragment;

    invoke-direct {v0}, Landroidx/leanback/app/VideoSupportFragment;-><init>()V

    return-object v0
.end method

.method onStart()V
    .locals 2

    iget-boolean v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCanUseHost:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCanUseHost:Z

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->createGlueHost()Landroidx/leanback/media/PlaybackGlueHost;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/leanback/media/PlaybackGlue;->setHost(Landroidx/leanback/media/PlaybackGlueHost;)V

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mLastVideoSupportFragmentForGlueHost:Landroidx/fragment/app/Fragment;

    :cond_0
    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/leanback/media/PlaybackGlue;->isPrepared()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    invoke-virtual {v0}, Landroidx/leanback/media/PlaybackGlue;->play()V

    :cond_1
    return-void
.end method

.method onStop()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/leanback/media/PlaybackGlue;->pause()V

    :cond_0
    return-void
.end method

.method public final setCoverBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    iput-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCoverBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->getCoverDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v0, p1, Landroidx/leanback/graphics/FitWidthBitmapDrawable;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/leanback/graphics/FitWidthBitmapDrawable;

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCoverBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroidx/leanback/graphics/FitWidthBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public final setParallaxDrawableMaxOffset(I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawable:Landroidx/leanback/widget/DetailsParallaxDrawable;

    if-nez v0, :cond_0

    iput p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mParallaxDrawableMaxOffset:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "enableParallax already called"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setSolidColor(I)V
    .locals 2

    iput p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mSolidColor:I

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->getBottomDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setupVideoPlayback(Landroidx/leanback/media/PlaybackGlue;)V
    .locals 3

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/leanback/media/PlaybackGlue;->getHost()Landroidx/leanback/media/PlaybackGlueHost;

    move-result-object v0

    iget-object v2, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    invoke-virtual {v2, v1}, Landroidx/leanback/media/PlaybackGlue;->setHost(Landroidx/leanback/media/PlaybackGlueHost;)V

    move-object v1, v0

    :cond_1
    iput-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    invoke-virtual {v0, p1}, Landroidx/leanback/app/DetailsBackgroundVideoHelper;->setPlaybackGlue(Landroidx/leanback/media/PlaybackGlue;)V

    iget-boolean p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mCanUseHost:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    if-eqz p1, :cond_4

    if-eqz v1, :cond_3

    iget-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mLastVideoSupportFragmentForGlueHost:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eq p1, v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    invoke-virtual {p1, v1}, Landroidx/leanback/media/PlaybackGlue;->setHost(Landroidx/leanback/media/PlaybackGlueHost;)V

    goto :goto_1

    :cond_3
    :goto_0
    iget-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mPlaybackGlue:Landroidx/leanback/media/PlaybackGlue;

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->createGlueHost()Landroidx/leanback/media/PlaybackGlueHost;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlaybackGlue;->setHost(Landroidx/leanback/media/PlaybackGlueHost;)V

    invoke-virtual {p0}, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->findOrCreateVideoSupportFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    iput-object p1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mLastVideoSupportFragmentForGlueHost:Landroidx/fragment/app/Fragment;

    :cond_4
    :goto_1
    return-void
.end method

.method public final switchToRows()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsSupportFragment;->switchToRows()V

    return-void
.end method

.method public final switchToVideo()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mFragment:Landroidx/leanback/app/DetailsSupportFragment;

    invoke-virtual {v0}, Landroidx/leanback/app/DetailsSupportFragment;->switchToVideo()V

    return-void
.end method

.method switchToVideoBeforeCreate()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mVideoHelper:Landroidx/leanback/app/DetailsBackgroundVideoHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Landroidx/leanback/app/DetailsBackgroundVideoHelper;->crossFadeBackgroundToVideo(ZZ)V

    iput-boolean v1, p0, Landroidx/leanback/app/DetailsSupportFragmentBackgroundController;->mInitialControlVisible:Z

    return-void
.end method
