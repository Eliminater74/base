.class Landroidx/leanback/media/PlaybackControlGlue$UpdatePlaybackStateHandler;
.super Landroid/os/Handler;
.source "PlaybackControlGlue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/media/PlaybackControlGlue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UpdatePlaybackStateHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/leanback/media/PlaybackControlGlue;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/leanback/media/PlaybackControlGlue;->updatePlaybackState()V

    :cond_0
    return-void
.end method
