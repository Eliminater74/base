package androidx.leanback.app;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.app.Fragment;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.TypedValue;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import androidx.leanback.C0393R;
import androidx.leanback.animation.LogAccelerateInterpolator;
import androidx.leanback.animation.LogDecelerateInterpolator;
import androidx.leanback.media.PlaybackGlueHost;
import androidx.leanback.widget.ArrayObjectAdapter;
import androidx.leanback.widget.BaseGridView;
import androidx.leanback.widget.BaseOnItemViewClickedListener;
import androidx.leanback.widget.BaseOnItemViewSelectedListener;
import androidx.leanback.widget.ClassPresenterSelector;
import androidx.leanback.widget.ItemAlignmentFacet;
import androidx.leanback.widget.ItemBridgeAdapter;
import androidx.leanback.widget.ObjectAdapter;
import androidx.leanback.widget.PlaybackRowPresenter;
import androidx.leanback.widget.PlaybackSeekDataProvider;
import androidx.leanback.widget.PlaybackSeekUi;
import androidx.leanback.widget.Presenter;
import androidx.leanback.widget.PresenterSelector;
import androidx.leanback.widget.Row;
import androidx.leanback.widget.RowPresenter;
import androidx.leanback.widget.SparseArrayObjectAdapter;
import androidx.leanback.widget.VerticalGridView;
import androidx.recyclerview.widget.RecyclerView;
@Deprecated
/* loaded from: classes.dex */
public class PlaybackFragment extends Fragment {
    private static final int ANIMATION_MULTIPLIER = 1;
    public static final int BG_DARK = 1;
    public static final int BG_LIGHT = 2;
    public static final int BG_NONE = 0;
    static final String BUNDLE_CONTROL_VISIBLE_ON_CREATEVIEW = "controlvisible_oncreateview";
    private static final boolean DEBUG = false;
    private static final int START_FADE_OUT = 1;
    private static final String TAG = "PlaybackFragment";
    ObjectAdapter mAdapter;
    int mAnimationTranslateY;
    int mAutohideTimerAfterPlayingInMs;
    int mAutohideTimerAfterTickleInMs;
    View mBackgroundView;
    int mBgAlpha;
    int mBgDarkColor;
    ValueAnimator mBgFadeInAnimator;
    ValueAnimator mBgFadeOutAnimator;
    int mBgLightColor;
    ValueAnimator mControlRowFadeInAnimator;
    ValueAnimator mControlRowFadeOutAnimator;
    BaseOnItemViewClickedListener mExternalItemClickedListener;
    BaseOnItemViewSelectedListener mExternalItemSelectedListener;
    OnFadeCompleteListener mFadeCompleteListener;
    PlaybackGlueHost.HostCallback mHostCallback;
    boolean mInSeek;
    View.OnKeyListener mInputEventHandler;
    int mMajorFadeTranslateY;
    int mMinorFadeTranslateY;
    ValueAnimator mOtherRowFadeInAnimator;
    ValueAnimator mOtherRowFadeOutAnimator;
    int mOtherRowsCenterToBottom;
    int mPaddingBottom;
    BaseOnItemViewClickedListener mPlaybackItemClickedListener;
    PlaybackRowPresenter mPresenter;
    View mRootView;
    Row mRow;
    RowsFragment mRowsFragment;
    PlaybackSeekUi.Client mSeekUiClient;
    ProgressBarManager mProgressBarManager = new ProgressBarManager();
    private final BaseOnItemViewClickedListener mOnItemViewClickedListener = new BaseOnItemViewClickedListener() { // from class: androidx.leanback.app.PlaybackFragment.1
        @Override // androidx.leanback.widget.BaseOnItemViewClickedListener
        public void onItemClicked(Presenter.ViewHolder viewHolder, Object obj, RowPresenter.ViewHolder viewHolder2, Object obj2) {
            if (PlaybackFragment.this.mPlaybackItemClickedListener != null && (viewHolder2 instanceof PlaybackRowPresenter.ViewHolder)) {
                PlaybackFragment.this.mPlaybackItemClickedListener.onItemClicked(viewHolder, obj, viewHolder2, obj2);
            }
            if (PlaybackFragment.this.mExternalItemClickedListener != null) {
                PlaybackFragment.this.mExternalItemClickedListener.onItemClicked(viewHolder, obj, viewHolder2, obj2);
            }
        }
    };
    private final BaseOnItemViewSelectedListener mOnItemViewSelectedListener = new BaseOnItemViewSelectedListener() { // from class: androidx.leanback.app.PlaybackFragment.2
        @Override // androidx.leanback.widget.BaseOnItemViewSelectedListener
        public void onItemSelected(Presenter.ViewHolder viewHolder, Object obj, RowPresenter.ViewHolder viewHolder2, Object obj2) {
            if (PlaybackFragment.this.mExternalItemSelectedListener != null) {
                PlaybackFragment.this.mExternalItemSelectedListener.onItemSelected(viewHolder, obj, viewHolder2, obj2);
            }
        }
    };
    private final SetSelectionRunnable mSetSelectionRunnable = new SetSelectionRunnable();
    int mBackgroundType = 1;
    boolean mFadingEnabled = true;
    boolean mControlVisibleBeforeOnCreateView = true;
    boolean mControlVisible = true;
    boolean mShowOrHideControlsOverlayOnUserInteraction = true;
    private final Animator.AnimatorListener mFadeListener = new Animator.AnimatorListener() { // from class: androidx.leanback.app.PlaybackFragment.3
        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animator) {
            PlaybackFragment.this.enableVerticalGridAnimations(false);
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animator) {
            ItemBridgeAdapter.ViewHolder viewHolder;
            if (PlaybackFragment.this.mBgAlpha > 0) {
                PlaybackFragment.this.enableVerticalGridAnimations(true);
                if (PlaybackFragment.this.mFadeCompleteListener != null) {
                    PlaybackFragment.this.mFadeCompleteListener.onFadeInComplete();
                    return;
                }
                return;
            }
            VerticalGridView verticalGridView = PlaybackFragment.this.getVerticalGridView();
            if (verticalGridView != null && verticalGridView.getSelectedPosition() == 0 && (viewHolder = (ItemBridgeAdapter.ViewHolder) verticalGridView.findViewHolderForAdapterPosition(0)) != null && (viewHolder.getPresenter() instanceof PlaybackRowPresenter)) {
                ((PlaybackRowPresenter) viewHolder.getPresenter()).onReappear((RowPresenter.ViewHolder) viewHolder.getViewHolder());
            }
            if (PlaybackFragment.this.mFadeCompleteListener != null) {
                PlaybackFragment.this.mFadeCompleteListener.onFadeOutComplete();
            }
        }
    };
    private final Handler mHandler = new Handler() { // from class: androidx.leanback.app.PlaybackFragment.4
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message.what == 1 && PlaybackFragment.this.mFadingEnabled) {
                PlaybackFragment.this.hideControlsOverlay(true);
            }
        }
    };
    private final BaseGridView.OnTouchInterceptListener mOnTouchInterceptListener = new BaseGridView.OnTouchInterceptListener() { // from class: androidx.leanback.app.PlaybackFragment.5
        @Override // androidx.leanback.widget.BaseGridView.OnTouchInterceptListener
        public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
            return PlaybackFragment.this.onInterceptInputEvent(motionEvent);
        }
    };
    private final BaseGridView.OnKeyInterceptListener mOnKeyInterceptListener = new BaseGridView.OnKeyInterceptListener() { // from class: androidx.leanback.app.PlaybackFragment.6
        @Override // androidx.leanback.widget.BaseGridView.OnKeyInterceptListener
        public boolean onInterceptKeyEvent(KeyEvent keyEvent) {
            return PlaybackFragment.this.onInterceptInputEvent(keyEvent);
        }
    };
    private TimeInterpolator mLogDecelerateInterpolator = new LogDecelerateInterpolator(100, 0);
    private TimeInterpolator mLogAccelerateInterpolator = new LogAccelerateInterpolator(100, 0);
    private final ItemBridgeAdapter.AdapterListener mAdapterListener = new ItemBridgeAdapter.AdapterListener() { // from class: androidx.leanback.app.PlaybackFragment.10
        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onBind(ItemBridgeAdapter.ViewHolder viewHolder) {
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onAttachedToWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            if (PlaybackFragment.this.mControlVisible) {
                return;
            }
            viewHolder.getViewHolder().view.setAlpha(0.0f);
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onCreate(ItemBridgeAdapter.ViewHolder viewHolder) {
            Presenter.ViewHolder viewHolder2 = viewHolder.getViewHolder();
            if (viewHolder2 instanceof PlaybackSeekUi) {
                ((PlaybackSeekUi) viewHolder2).setPlaybackSeekUiClient(PlaybackFragment.this.mChainedClient);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onDetachedFromWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            viewHolder.getViewHolder().view.setAlpha(1.0f);
            viewHolder.getViewHolder().view.setTranslationY(0.0f);
            viewHolder.getViewHolder().view.setAlpha(1.0f);
        }
    };
    final PlaybackSeekUi.Client mChainedClient = new PlaybackSeekUi.Client() { // from class: androidx.leanback.app.PlaybackFragment.11
        @Override // androidx.leanback.widget.PlaybackSeekUi.Client
        public boolean isSeekEnabled() {
            if (PlaybackFragment.this.mSeekUiClient == null) {
                return false;
            }
            return PlaybackFragment.this.mSeekUiClient.isSeekEnabled();
        }

        @Override // androidx.leanback.widget.PlaybackSeekUi.Client
        public void onSeekStarted() {
            if (PlaybackFragment.this.mSeekUiClient != null) {
                PlaybackFragment.this.mSeekUiClient.onSeekStarted();
            }
            PlaybackFragment.this.setSeekMode(true);
        }

        @Override // androidx.leanback.widget.PlaybackSeekUi.Client
        public PlaybackSeekDataProvider getPlaybackSeekDataProvider() {
            if (PlaybackFragment.this.mSeekUiClient == null) {
                return null;
            }
            return PlaybackFragment.this.mSeekUiClient.getPlaybackSeekDataProvider();
        }

        @Override // androidx.leanback.widget.PlaybackSeekUi.Client
        public void onSeekPositionChanged(long j) {
            if (PlaybackFragment.this.mSeekUiClient != null) {
                PlaybackFragment.this.mSeekUiClient.onSeekPositionChanged(j);
            }
        }

        @Override // androidx.leanback.widget.PlaybackSeekUi.Client
        public void onSeekFinished(boolean z) {
            if (PlaybackFragment.this.mSeekUiClient != null) {
                PlaybackFragment.this.mSeekUiClient.onSeekFinished(z);
            }
            PlaybackFragment.this.setSeekMode(false);
        }
    };

    /* loaded from: classes.dex */
    public static class OnFadeCompleteListener {
        public void onFadeInComplete() {
        }

        public void onFadeOutComplete() {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onError(int i, CharSequence charSequence) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onVideoSizeChanged(int i, int i2) {
    }

    public void resetFocus() {
        ItemBridgeAdapter.ViewHolder viewHolder = (ItemBridgeAdapter.ViewHolder) getVerticalGridView().findViewHolderForAdapterPosition(0);
        if (viewHolder == null || !(viewHolder.getPresenter() instanceof PlaybackRowPresenter)) {
            return;
        }
        ((PlaybackRowPresenter) viewHolder.getPresenter()).onReappear((RowPresenter.ViewHolder) viewHolder.getViewHolder());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class SetSelectionRunnable implements Runnable {
        int mPosition;
        boolean mSmooth = true;

        SetSelectionRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (PlaybackFragment.this.mRowsFragment == null) {
                return;
            }
            PlaybackFragment.this.mRowsFragment.setSelectedPosition(this.mPosition, this.mSmooth);
        }
    }

    public ObjectAdapter getAdapter() {
        return this.mAdapter;
    }

    public PlaybackFragment() {
        this.mProgressBarManager.setInitialDelay(500L);
    }

    VerticalGridView getVerticalGridView() {
        RowsFragment rowsFragment = this.mRowsFragment;
        if (rowsFragment == null) {
            return null;
        }
        return rowsFragment.getVerticalGridView();
    }

    void setBgAlpha(int i) {
        this.mBgAlpha = i;
        View view = this.mBackgroundView;
        if (view != null) {
            view.getBackground().setAlpha(i);
        }
    }

    void enableVerticalGridAnimations(boolean z) {
        if (getVerticalGridView() != null) {
            getVerticalGridView().setAnimateChildLayout(z);
        }
    }

    public void setShowOrHideControlsOverlayOnUserInteraction(boolean z) {
        this.mShowOrHideControlsOverlayOnUserInteraction = z;
    }

    public boolean isShowOrHideControlsOverlayOnUserInteraction() {
        return this.mShowOrHideControlsOverlayOnUserInteraction;
    }

    public void setControlsOverlayAutoHideEnabled(boolean z) {
        if (z != this.mFadingEnabled) {
            this.mFadingEnabled = z;
            if (isResumed() && getView().hasFocus()) {
                showControlsOverlay(true);
                if (z) {
                    startFadeTimer(this.mAutohideTimerAfterPlayingInMs);
                } else {
                    stopFadeTimer();
                }
            }
        }
    }

    public boolean isControlsOverlayAutoHideEnabled() {
        return this.mFadingEnabled;
    }

    @Deprecated
    public void setFadingEnabled(boolean z) {
        setControlsOverlayAutoHideEnabled(z);
    }

    @Deprecated
    public boolean isFadingEnabled() {
        return isControlsOverlayAutoHideEnabled();
    }

    public void setFadeCompleteListener(OnFadeCompleteListener onFadeCompleteListener) {
        this.mFadeCompleteListener = onFadeCompleteListener;
    }

    public OnFadeCompleteListener getFadeCompleteListener() {
        return this.mFadeCompleteListener;
    }

    public final void setOnKeyInterceptListener(View.OnKeyListener onKeyListener) {
        this.mInputEventHandler = onKeyListener;
    }

    public void tickle() {
        stopFadeTimer();
        showControlsOverlay(true);
        int i = this.mAutohideTimerAfterTickleInMs;
        if (i <= 0 || !this.mFadingEnabled) {
            return;
        }
        startFadeTimer(i);
    }

    boolean onInterceptInputEvent(InputEvent inputEvent) {
        boolean z;
        int i;
        int i2;
        boolean z2 = !this.mControlVisible;
        if (inputEvent instanceof KeyEvent) {
            KeyEvent keyEvent = (KeyEvent) inputEvent;
            i = keyEvent.getKeyCode();
            i2 = keyEvent.getAction();
            View.OnKeyListener onKeyListener = this.mInputEventHandler;
            z = onKeyListener != null ? onKeyListener.onKey(getView(), i, keyEvent) : false;
        } else {
            z = false;
            i = 0;
            i2 = 0;
        }
        if (i != 4 && i != 111) {
            switch (i) {
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                    boolean z3 = z2 ? true : z;
                    if (this.mShowOrHideControlsOverlayOnUserInteraction && i2 == 0) {
                        tickle();
                        return z3;
                    }
                    return z3;
                default:
                    if (this.mShowOrHideControlsOverlayOnUserInteraction && z && i2 == 0) {
                        tickle();
                        break;
                    }
                    break;
            }
        } else if (this.mInSeek) {
            return false;
        } else {
            if (this.mShowOrHideControlsOverlayOnUserInteraction && !z2) {
                if (((KeyEvent) inputEvent).getAction() == 1) {
                    hideControlsOverlay(true);
                    return true;
                }
                return true;
            }
        }
        return z;
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mControlVisible = true;
        if (this.mControlVisibleBeforeOnCreateView) {
            return;
        }
        showControlsOverlay(false, false);
        this.mControlVisibleBeforeOnCreateView = true;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mControlVisible && this.mFadingEnabled) {
            startFadeTimer(this.mAutohideTimerAfterPlayingInMs);
        }
        getVerticalGridView().setOnTouchInterceptListener(this.mOnTouchInterceptListener);
        getVerticalGridView().setOnKeyInterceptListener(this.mOnKeyInterceptListener);
        PlaybackGlueHost.HostCallback hostCallback = this.mHostCallback;
        if (hostCallback != null) {
            hostCallback.onHostResume();
        }
    }

    private void stopFadeTimer() {
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.removeMessages(1);
        }
    }

    private void startFadeTimer(int i) {
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.removeMessages(1);
            this.mHandler.sendEmptyMessageDelayed(1, i);
        }
    }

    private static ValueAnimator loadAnimator(Context context, int i) {
        ValueAnimator valueAnimator = (ValueAnimator) AnimatorInflater.loadAnimator(context, i);
        valueAnimator.setDuration(valueAnimator.getDuration() * 1);
        return valueAnimator;
    }

    private void loadBgAnimator() {
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: androidx.leanback.app.PlaybackFragment.7
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                PlaybackFragment.this.setBgAlpha(((Integer) valueAnimator.getAnimatedValue()).intValue());
            }
        };
        Context context = FragmentUtil.getContext(this);
        ValueAnimator loadAnimator = loadAnimator(context, C0393R.animator.lb_playback_bg_fade_in);
        this.mBgFadeInAnimator = loadAnimator;
        loadAnimator.addUpdateListener(animatorUpdateListener);
        this.mBgFadeInAnimator.addListener(this.mFadeListener);
        ValueAnimator loadAnimator2 = loadAnimator(context, C0393R.animator.lb_playback_bg_fade_out);
        this.mBgFadeOutAnimator = loadAnimator2;
        loadAnimator2.addUpdateListener(animatorUpdateListener);
        this.mBgFadeOutAnimator.addListener(this.mFadeListener);
    }

    private void loadControlRowAnimator() {
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: androidx.leanback.app.PlaybackFragment.8
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                RecyclerView.ViewHolder findViewHolderForAdapterPosition;
                View view;
                if (PlaybackFragment.this.getVerticalGridView() == null || (findViewHolderForAdapterPosition = PlaybackFragment.this.getVerticalGridView().findViewHolderForAdapterPosition(0)) == null || (view = findViewHolderForAdapterPosition.itemView) == null) {
                    return;
                }
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                view.setAlpha(floatValue);
                view.setTranslationY(PlaybackFragment.this.mAnimationTranslateY * (1.0f - floatValue));
            }
        };
        Context context = FragmentUtil.getContext(this);
        ValueAnimator loadAnimator = loadAnimator(context, C0393R.animator.lb_playback_controls_fade_in);
        this.mControlRowFadeInAnimator = loadAnimator;
        loadAnimator.addUpdateListener(animatorUpdateListener);
        this.mControlRowFadeInAnimator.setInterpolator(this.mLogDecelerateInterpolator);
        ValueAnimator loadAnimator2 = loadAnimator(context, C0393R.animator.lb_playback_controls_fade_out);
        this.mControlRowFadeOutAnimator = loadAnimator2;
        loadAnimator2.addUpdateListener(animatorUpdateListener);
        this.mControlRowFadeOutAnimator.setInterpolator(this.mLogAccelerateInterpolator);
    }

    private void loadOtherRowAnimator() {
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: androidx.leanback.app.PlaybackFragment.9
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                if (PlaybackFragment.this.getVerticalGridView() == null) {
                    return;
                }
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                int childCount = PlaybackFragment.this.getVerticalGridView().getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = PlaybackFragment.this.getVerticalGridView().getChildAt(i);
                    if (PlaybackFragment.this.getVerticalGridView().getChildAdapterPosition(childAt) > 0) {
                        childAt.setAlpha(floatValue);
                        childAt.setTranslationY(PlaybackFragment.this.mAnimationTranslateY * (1.0f - floatValue));
                    }
                }
            }
        };
        Context context = FragmentUtil.getContext(this);
        ValueAnimator loadAnimator = loadAnimator(context, C0393R.animator.lb_playback_controls_fade_in);
        this.mOtherRowFadeInAnimator = loadAnimator;
        loadAnimator.addUpdateListener(animatorUpdateListener);
        this.mOtherRowFadeInAnimator.setInterpolator(this.mLogDecelerateInterpolator);
        ValueAnimator loadAnimator2 = loadAnimator(context, C0393R.animator.lb_playback_controls_fade_out);
        this.mOtherRowFadeOutAnimator = loadAnimator2;
        loadAnimator2.addUpdateListener(animatorUpdateListener);
        this.mOtherRowFadeOutAnimator.setInterpolator(new AccelerateInterpolator());
    }

    @Deprecated
    public void fadeOut() {
        showControlsOverlay(false, false);
    }

    public void showControlsOverlay(boolean z) {
        showControlsOverlay(true, z);
    }

    public boolean isControlsOverlayVisible() {
        return this.mControlVisible;
    }

    public void hideControlsOverlay(boolean z) {
        showControlsOverlay(false, z);
    }

    static void reverseFirstOrStartSecond(ValueAnimator valueAnimator, ValueAnimator valueAnimator2, boolean z) {
        if (valueAnimator.isStarted()) {
            valueAnimator.reverse();
            if (z) {
                return;
            }
            valueAnimator.end();
            return;
        }
        valueAnimator2.start();
        if (z) {
            return;
        }
        valueAnimator2.end();
    }

    static void endAll(ValueAnimator valueAnimator, ValueAnimator valueAnimator2) {
        if (valueAnimator.isStarted()) {
            valueAnimator.end();
        } else if (valueAnimator2.isStarted()) {
            valueAnimator2.end();
        }
    }

    void showControlsOverlay(boolean z, boolean z2) {
        int i;
        if (getView() == null) {
            this.mControlVisibleBeforeOnCreateView = z;
            return;
        }
        if (!isResumed()) {
            z2 = false;
        }
        if (z == this.mControlVisible) {
            if (z2) {
                return;
            }
            endAll(this.mBgFadeInAnimator, this.mBgFadeOutAnimator);
            endAll(this.mControlRowFadeInAnimator, this.mControlRowFadeOutAnimator);
            endAll(this.mOtherRowFadeInAnimator, this.mOtherRowFadeOutAnimator);
            return;
        }
        this.mControlVisible = z;
        if (!z) {
            stopFadeTimer();
        }
        this.mAnimationTranslateY = (getVerticalGridView() == null || getVerticalGridView().getSelectedPosition() == 0) ? this.mMajorFadeTranslateY : this.mMinorFadeTranslateY;
        if (z) {
            reverseFirstOrStartSecond(this.mBgFadeOutAnimator, this.mBgFadeInAnimator, z2);
            reverseFirstOrStartSecond(this.mControlRowFadeOutAnimator, this.mControlRowFadeInAnimator, z2);
            reverseFirstOrStartSecond(this.mOtherRowFadeOutAnimator, this.mOtherRowFadeInAnimator, z2);
        } else {
            reverseFirstOrStartSecond(this.mBgFadeInAnimator, this.mBgFadeOutAnimator, z2);
            reverseFirstOrStartSecond(this.mControlRowFadeInAnimator, this.mControlRowFadeOutAnimator, z2);
            reverseFirstOrStartSecond(this.mOtherRowFadeInAnimator, this.mOtherRowFadeOutAnimator, z2);
        }
        if (z2) {
            View view = getView();
            if (z) {
                i = C0393R.string.lb_playback_controls_shown;
            } else {
                i = C0393R.string.lb_playback_controls_hidden;
            }
            view.announceForAccessibility(getString(i));
        }
    }

    public void setSelectedPosition(int i) {
        setSelectedPosition(i, true);
    }

    public void setSelectedPosition(int i, boolean z) {
        this.mSetSelectionRunnable.mPosition = i;
        this.mSetSelectionRunnable.mSmooth = z;
        if (getView() == null || getView().getHandler() == null) {
            return;
        }
        getView().getHandler().post(this.mSetSelectionRunnable);
    }

    private void setupChildFragmentLayout() {
        setVerticalGridViewLayout(this.mRowsFragment.getVerticalGridView());
    }

    void setVerticalGridViewLayout(VerticalGridView verticalGridView) {
        if (verticalGridView == null) {
            return;
        }
        verticalGridView.setWindowAlignmentOffset(-this.mPaddingBottom);
        verticalGridView.setWindowAlignmentOffsetPercent(-1.0f);
        verticalGridView.setItemAlignmentOffset(this.mOtherRowsCenterToBottom - this.mPaddingBottom);
        verticalGridView.setItemAlignmentOffsetPercent(50.0f);
        verticalGridView.setPadding(verticalGridView.getPaddingLeft(), verticalGridView.getPaddingTop(), verticalGridView.getPaddingRight(), this.mPaddingBottom);
        verticalGridView.setWindowAlignment(2);
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mOtherRowsCenterToBottom = getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_other_rows_center_to_bottom);
        this.mPaddingBottom = getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_controls_padding_bottom);
        this.mBgDarkColor = getResources().getColor(C0393R.C0394color.lb_playback_controls_background_dark);
        this.mBgLightColor = getResources().getColor(C0393R.C0394color.lb_playback_controls_background_light);
        TypedValue typedValue = new TypedValue();
        FragmentUtil.getContext(this).getTheme().resolveAttribute(C0393R.attr.playbackControlsAutoHideTimeout, typedValue, true);
        this.mAutohideTimerAfterPlayingInMs = typedValue.data;
        FragmentUtil.getContext(this).getTheme().resolveAttribute(C0393R.attr.playbackControlsAutoHideTickleTimeout, typedValue, true);
        this.mAutohideTimerAfterTickleInMs = typedValue.data;
        this.mMajorFadeTranslateY = getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_major_fade_translate_y);
        this.mMinorFadeTranslateY = getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_minor_fade_translate_y);
        loadBgAnimator();
        loadControlRowAnimator();
        loadOtherRowAnimator();
    }

    public void setBackgroundType(int i) {
        if (i == 0 || i == 1 || i == 2) {
            if (i != this.mBackgroundType) {
                this.mBackgroundType = i;
                updateBackground();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Invalid background type");
    }

    public int getBackgroundType() {
        return this.mBackgroundType;
    }

    private void updateBackground() {
        View view = this.mBackgroundView;
        if (view != null) {
            int i = this.mBgDarkColor;
            int i2 = this.mBackgroundType;
            if (i2 == 0) {
                i = 0;
            } else if (i2 == 2) {
                i = this.mBgLightColor;
            }
            view.setBackground(new ColorDrawable(i));
            setBgAlpha(this.mBgAlpha);
        }
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(C0393R.layout.lb_playback_fragment, viewGroup, false);
        this.mRootView = inflate;
        this.mBackgroundView = inflate.findViewById(C0393R.C0396id.playback_fragment_background);
        RowsFragment rowsFragment = (RowsFragment) getChildFragmentManager().findFragmentById(C0393R.C0396id.playback_controls_dock);
        this.mRowsFragment = rowsFragment;
        if (rowsFragment == null) {
            this.mRowsFragment = new RowsFragment();
            getChildFragmentManager().beginTransaction().replace(C0393R.C0396id.playback_controls_dock, this.mRowsFragment).commit();
        }
        ObjectAdapter objectAdapter = this.mAdapter;
        if (objectAdapter == null) {
            setAdapter(new ArrayObjectAdapter(new ClassPresenterSelector()));
        } else {
            this.mRowsFragment.setAdapter(objectAdapter);
        }
        this.mRowsFragment.setOnItemViewSelectedListener(this.mOnItemViewSelectedListener);
        this.mRowsFragment.setOnItemViewClickedListener(this.mOnItemViewClickedListener);
        this.mBgAlpha = 255;
        updateBackground();
        this.mRowsFragment.setExternalAdapterListener(this.mAdapterListener);
        ProgressBarManager progressBarManager = getProgressBarManager();
        if (progressBarManager != null) {
            progressBarManager.setRootView((ViewGroup) this.mRootView);
        }
        return this.mRootView;
    }

    public void setHostCallback(PlaybackGlueHost.HostCallback hostCallback) {
        this.mHostCallback = hostCallback;
    }

    @Override // android.app.Fragment
    public void onStart() {
        super.onStart();
        setupChildFragmentLayout();
        this.mRowsFragment.setAdapter(this.mAdapter);
        PlaybackGlueHost.HostCallback hostCallback = this.mHostCallback;
        if (hostCallback != null) {
            hostCallback.onHostStart();
        }
    }

    @Override // android.app.Fragment
    public void onStop() {
        PlaybackGlueHost.HostCallback hostCallback = this.mHostCallback;
        if (hostCallback != null) {
            hostCallback.onHostStop();
        }
        super.onStop();
    }

    @Override // android.app.Fragment
    public void onPause() {
        PlaybackGlueHost.HostCallback hostCallback = this.mHostCallback;
        if (hostCallback != null) {
            hostCallback.onHostPause();
        }
        if (this.mHandler.hasMessages(1)) {
            this.mHandler.removeMessages(1);
        }
        super.onPause();
    }

    public void setOnItemViewSelectedListener(BaseOnItemViewSelectedListener baseOnItemViewSelectedListener) {
        this.mExternalItemSelectedListener = baseOnItemViewSelectedListener;
    }

    public void setOnItemViewClickedListener(BaseOnItemViewClickedListener baseOnItemViewClickedListener) {
        this.mExternalItemClickedListener = baseOnItemViewClickedListener;
    }

    public void setOnPlaybackItemViewClickedListener(BaseOnItemViewClickedListener baseOnItemViewClickedListener) {
        this.mPlaybackItemClickedListener = baseOnItemViewClickedListener;
    }

    @Override // android.app.Fragment
    public void onDestroyView() {
        this.mRootView = null;
        this.mBackgroundView = null;
        super.onDestroyView();
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        PlaybackGlueHost.HostCallback hostCallback = this.mHostCallback;
        if (hostCallback != null) {
            hostCallback.onHostDestroy();
        }
        super.onDestroy();
    }

    public void setPlaybackRow(Row row) {
        this.mRow = row;
        setupRow();
        setupPresenter();
    }

    public void setPlaybackRowPresenter(PlaybackRowPresenter playbackRowPresenter) {
        this.mPresenter = playbackRowPresenter;
        setupPresenter();
        setPlaybackRowPresenterAlignment();
    }

    /* JADX WARN: Multi-variable type inference failed */
    void setPlaybackRowPresenterAlignment() {
        Presenter[] presenters;
        ObjectAdapter objectAdapter = this.mAdapter;
        if (objectAdapter == null || objectAdapter.getPresenterSelector() == null || (presenters = this.mAdapter.getPresenterSelector().getPresenters()) == null) {
            return;
        }
        for (int i = 0; i < presenters.length; i++) {
            if ((presenters[i] instanceof PlaybackRowPresenter) && presenters[i].getFacet(ItemAlignmentFacet.class) == null) {
                ItemAlignmentFacet itemAlignmentFacet = new ItemAlignmentFacet();
                ItemAlignmentFacet.ItemAlignmentDef itemAlignmentDef = new ItemAlignmentFacet.ItemAlignmentDef();
                itemAlignmentDef.setItemAlignmentOffset(0);
                itemAlignmentDef.setItemAlignmentOffsetPercent(100.0f);
                itemAlignmentFacet.setAlignmentDefs(new ItemAlignmentFacet.ItemAlignmentDef[]{itemAlignmentDef});
                presenters[i].setFacet(ItemAlignmentFacet.class, itemAlignmentFacet);
            }
        }
    }

    public void notifyPlaybackRowChanged() {
        ObjectAdapter objectAdapter = this.mAdapter;
        if (objectAdapter == null) {
            return;
        }
        objectAdapter.notifyItemRangeChanged(0, 1);
    }

    public void setAdapter(ObjectAdapter objectAdapter) {
        this.mAdapter = objectAdapter;
        setupRow();
        setupPresenter();
        setPlaybackRowPresenterAlignment();
        RowsFragment rowsFragment = this.mRowsFragment;
        if (rowsFragment != null) {
            rowsFragment.setAdapter(objectAdapter);
        }
    }

    private void setupRow() {
        Row row;
        ObjectAdapter objectAdapter = this.mAdapter;
        if ((objectAdapter instanceof ArrayObjectAdapter) && this.mRow != null) {
            ArrayObjectAdapter arrayObjectAdapter = (ArrayObjectAdapter) objectAdapter;
            if (arrayObjectAdapter.size() == 0) {
                arrayObjectAdapter.add(this.mRow);
            } else {
                arrayObjectAdapter.replace(0, this.mRow);
            }
        } else if (!(objectAdapter instanceof SparseArrayObjectAdapter) || (row = this.mRow) == null) {
        } else {
            ((SparseArrayObjectAdapter) objectAdapter).set(0, row);
        }
    }

    private void setupPresenter() {
        ObjectAdapter objectAdapter = this.mAdapter;
        if (objectAdapter == null || this.mRow == null || this.mPresenter == null) {
            return;
        }
        PresenterSelector presenterSelector = objectAdapter.getPresenterSelector();
        if (presenterSelector == null) {
            ClassPresenterSelector classPresenterSelector = new ClassPresenterSelector();
            classPresenterSelector.addClassPresenter(this.mRow.getClass(), this.mPresenter);
            this.mAdapter.setPresenterSelector(classPresenterSelector);
        } else if (presenterSelector instanceof ClassPresenterSelector) {
            ((ClassPresenterSelector) presenterSelector).addClassPresenter(this.mRow.getClass(), this.mPresenter);
        }
    }

    public void setPlaybackSeekUiClient(PlaybackSeekUi.Client client) {
        this.mSeekUiClient = client;
    }

    void setSeekMode(boolean z) {
        if (this.mInSeek == z) {
            return;
        }
        this.mInSeek = z;
        getVerticalGridView().setSelectedPosition(0);
        if (this.mInSeek) {
            stopFadeTimer();
        }
        showControlsOverlay(true);
        int childCount = getVerticalGridView().getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getVerticalGridView().getChildAt(i);
            if (getVerticalGridView().getChildAdapterPosition(childAt) > 0) {
                childAt.setVisibility(this.mInSeek ? 4 : 0);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onBufferingStateChanged(boolean z) {
        ProgressBarManager progressBarManager = getProgressBarManager();
        if (progressBarManager != null) {
            if (z) {
                progressBarManager.show();
            } else {
                progressBarManager.hide();
            }
        }
    }

    public ProgressBarManager getProgressBarManager() {
        return this.mProgressBarManager;
    }
}
