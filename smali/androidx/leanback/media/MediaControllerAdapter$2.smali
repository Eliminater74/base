.class Landroidx/leanback/media/MediaControllerAdapter$2;
.super Landroid/support/v4/media/session/MediaControllerCompat$Callback;
.source "MediaControllerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/media/MediaControllerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/leanback/media/MediaControllerAdapter;


# direct methods
.method constructor <init>(Landroidx/leanback/media/MediaControllerAdapter;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMetadataChanged(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 1

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onMetadataChanged(Landroidx/leanback/media/PlayerAdapter;)V

    return-void
.end method

.method public onPlaybackStateChanged(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 4

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    iget-boolean v0, v0, Landroidx/leanback/media/MediaControllerAdapter;->mIsBuffering:Z

    const/4 v1, 0x6

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {v0}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object v0

    iget-object v2, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroidx/leanback/media/PlayerAdapter$Callback;->onBufferingStateChanged(Landroidx/leanback/media/PlayerAdapter;Z)V

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {v0}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object v0

    iget-object v2, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {v0, v2}, Landroidx/leanback/media/PlayerAdapter$Callback;->onBufferedPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    iput-boolean v3, v0, Landroidx/leanback/media/MediaControllerAdapter;->mIsBuffering:Z

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onPlayCompleted(Landroidx/leanback/media/PlayerAdapter;)V

    goto/16 :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onPlayStateChanged(Landroidx/leanback/media/PlayerAdapter;)V

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onCurrentPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    goto/16 :goto_0

    :cond_3
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_4

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onPlayStateChanged(Landroidx/leanback/media/PlayerAdapter;)V

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onCurrentPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    goto/16 :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    if-ne v0, v1, :cond_5

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    iput-boolean v2, p1, Landroidx/leanback/media/MediaControllerAdapter;->mIsBuffering:Z

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0, v2}, Landroidx/leanback/media/PlayerAdapter$Callback;->onBufferingStateChanged(Landroidx/leanback/media/PlayerAdapter;Z)V

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onBufferedPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_7

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getErrorMessage()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_6

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {v0}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getErrorCode()I

    move-result p1

    const-string v2, ""

    invoke-virtual {v0, v1, p1, v2}, Landroidx/leanback/media/PlayerAdapter$Callback;->onError(Landroidx/leanback/media/PlayerAdapter;ILjava/lang/String;)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {v0}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getErrorMessage()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Landroidx/leanback/media/PlayerAdapter$Callback;->onError(Landroidx/leanback/media/PlayerAdapter;ILjava/lang/String;)V

    goto :goto_0

    :cond_7
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_8

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onPlayStateChanged(Landroidx/leanback/media/PlayerAdapter;)V

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onCurrentPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    goto :goto_0

    :cond_8
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result p1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_9

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onPlayStateChanged(Landroidx/leanback/media/PlayerAdapter;)V

    iget-object p1, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1}, Landroidx/leanback/media/MediaControllerAdapter;->getCallback()Landroidx/leanback/media/PlayerAdapter$Callback;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/media/MediaControllerAdapter$2;->this$0:Landroidx/leanback/media/MediaControllerAdapter;

    invoke-virtual {p1, v0}, Landroidx/leanback/media/PlayerAdapter$Callback;->onCurrentPositionChanged(Landroidx/leanback/media/PlayerAdapter;)V

    :cond_9
    :goto_0
    return-void
.end method
