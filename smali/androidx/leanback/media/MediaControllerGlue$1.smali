.class Landroidx/leanback/media/MediaControllerGlue$1;
.super Landroid/support/v4/media/session/MediaControllerCompat$Callback;
.source "MediaControllerGlue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/media/MediaControllerGlue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/leanback/media/MediaControllerGlue;


# direct methods
.method constructor <init>(Landroidx/leanback/media/MediaControllerGlue;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/media/MediaControllerGlue$1;->this$0:Landroidx/leanback/media/MediaControllerGlue;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMetadataChanged(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 0

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerGlue$1;->this$0:Landroidx/leanback/media/MediaControllerGlue;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerGlue;->onMetadataChanged()V

    return-void
.end method

.method public onPlaybackStateChanged(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 0

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerGlue$1;->this$0:Landroidx/leanback/media/MediaControllerGlue;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerGlue;->onStateChanged()V

    return-void
.end method

.method public onSessionDestroyed()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerGlue$1;->this$0:Landroidx/leanback/media/MediaControllerGlue;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/leanback/media/MediaControllerGlue;->mMediaController:Landroid/support/v4/media/session/MediaControllerCompat;

    return-void
.end method

.method public onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method
