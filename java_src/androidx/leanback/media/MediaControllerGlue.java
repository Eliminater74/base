package androidx.leanback.media;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.p000v4.media.MediaMetadataCompat;
import android.support.p000v4.media.session.MediaControllerCompat;
import android.support.p000v4.media.session.PlaybackStateCompat;
import android.util.Log;
@Deprecated
/* loaded from: classes.dex */
public abstract class MediaControllerGlue extends PlaybackControlGlue {
    static final boolean DEBUG = false;
    static final String TAG = "MediaControllerGlue";
    private final MediaControllerCompat.Callback mCallback;
    MediaControllerCompat mMediaController;

    public MediaControllerGlue(Context context, int[] iArr, int[] iArr2) {
        super(context, iArr, iArr2);
        this.mCallback = new MediaControllerCompat.Callback() { // from class: androidx.leanback.media.MediaControllerGlue.1
            @Override // android.support.p000v4.media.session.MediaControllerCompat.Callback
            public void onSessionEvent(String str, Bundle bundle) {
            }

            @Override // android.support.p000v4.media.session.MediaControllerCompat.Callback
            public void onMetadataChanged(MediaMetadataCompat mediaMetadataCompat) {
                MediaControllerGlue.this.onMetadataChanged();
            }

            @Override // android.support.p000v4.media.session.MediaControllerCompat.Callback
            public void onPlaybackStateChanged(PlaybackStateCompat playbackStateCompat) {
                MediaControllerGlue.this.onStateChanged();
            }

            @Override // android.support.p000v4.media.session.MediaControllerCompat.Callback
            public void onSessionDestroyed() {
                MediaControllerGlue.this.mMediaController = null;
            }
        };
    }

    public void attachToMediaController(MediaControllerCompat mediaControllerCompat) {
        if (mediaControllerCompat != this.mMediaController) {
            detach();
            this.mMediaController = mediaControllerCompat;
            if (mediaControllerCompat != null) {
                mediaControllerCompat.registerCallback(this.mCallback);
            }
            onMetadataChanged();
            onStateChanged();
        }
    }

    public void detach() {
        MediaControllerCompat mediaControllerCompat = this.mMediaController;
        if (mediaControllerCompat != null) {
            mediaControllerCompat.unregisterCallback(this.mCallback);
        }
        this.mMediaController = null;
    }

    public final MediaControllerCompat getMediaController() {
        return this.mMediaController;
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public boolean hasValidMedia() {
        MediaControllerCompat mediaControllerCompat = this.mMediaController;
        return (mediaControllerCompat == null || mediaControllerCompat.getMetadata() == null) ? false : true;
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public boolean isMediaPlaying() {
        return this.mMediaController.getPlaybackState().getState() == 3;
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public int getCurrentSpeedId() {
        int playbackSpeed = (int) this.mMediaController.getPlaybackState().getPlaybackSpeed();
        int i = 0;
        if (playbackSpeed == 0) {
            return 0;
        }
        if (playbackSpeed == 1) {
            return 1;
        }
        if (playbackSpeed > 0) {
            int[] fastForwardSpeeds = getFastForwardSpeeds();
            while (i < fastForwardSpeeds.length) {
                if (playbackSpeed == fastForwardSpeeds[i]) {
                    return i + 10;
                }
                i++;
            }
        } else {
            int[] rewindSpeeds = getRewindSpeeds();
            while (i < rewindSpeeds.length) {
                if ((-playbackSpeed) == rewindSpeeds[i]) {
                    return (-10) - i;
                }
                i++;
            }
        }
        Log.w(TAG, "Couldn't find index for speed " + playbackSpeed);
        return -1;
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public CharSequence getMediaTitle() {
        return this.mMediaController.getMetadata().getDescription().getTitle();
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public CharSequence getMediaSubtitle() {
        return this.mMediaController.getMetadata().getDescription().getSubtitle();
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public int getMediaDuration() {
        return (int) this.mMediaController.getMetadata().getLong(MediaMetadataCompat.METADATA_KEY_DURATION);
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public int getCurrentPosition() {
        return (int) this.mMediaController.getPlaybackState().getPosition();
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public Drawable getMediaArt() {
        Bitmap iconBitmap = this.mMediaController.getMetadata().getDescription().getIconBitmap();
        if (iconBitmap == null) {
            return null;
        }
        return new BitmapDrawable(getContext().getResources(), iconBitmap);
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public long getSupportedActions() {
        long actions = this.mMediaController.getPlaybackState().getActions();
        long j = (512 & actions) != 0 ? 64L : 0L;
        if ((actions & 32) != 0) {
            j |= 256;
        }
        if ((actions & 16) != 0) {
            j |= 16;
        }
        if ((64 & actions) != 0) {
            j |= 128;
        }
        return (actions & 8) != 0 ? j | 32 : j;
    }

    @Override // androidx.leanback.media.PlaybackControlGlue
    public void play(int i) {
        if (i == 1) {
            this.mMediaController.getTransportControls().play();
        } else if (i > 0) {
            this.mMediaController.getTransportControls().fastForward();
        } else {
            this.mMediaController.getTransportControls().rewind();
        }
    }

    @Override // androidx.leanback.media.PlaybackGlue
    public void pause() {
        this.mMediaController.getTransportControls().pause();
    }

    @Override // androidx.leanback.media.PlaybackGlue
    public void next() {
        this.mMediaController.getTransportControls().skipToNext();
    }

    @Override // androidx.leanback.media.PlaybackGlue
    public void previous() {
        this.mMediaController.getTransportControls().skipToPrevious();
    }
}
