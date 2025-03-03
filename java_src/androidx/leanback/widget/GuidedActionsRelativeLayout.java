package androidx.leanback.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
class GuidedActionsRelativeLayout extends RelativeLayout {
    private boolean mInOverride;
    private InterceptKeyEventListener mInterceptKeyEventListener;
    private float mKeyLinePercent;

    /* loaded from: classes.dex */
    interface InterceptKeyEventListener {
        boolean onInterceptKeyEvent(KeyEvent keyEvent);
    }

    public GuidedActionsRelativeLayout(Context context) {
        this(context, null);
    }

    public GuidedActionsRelativeLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public GuidedActionsRelativeLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mInOverride = false;
        this.mKeyLinePercent = GuidanceStylingRelativeLayout.getKeyLinePercent(context);
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        View findViewById;
        int size = View.MeasureSpec.getSize(i2);
        if (size > 0 && (findViewById = findViewById(C0393R.C0396id.guidedactions_sub_list)) != null) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) findViewById.getLayoutParams();
            if (marginLayoutParams.topMargin < 0 && !this.mInOverride) {
                this.mInOverride = true;
            }
            if (this.mInOverride) {
                marginLayoutParams.topMargin = (int) ((this.mKeyLinePercent * size) / 100.0f);
            }
        }
        super.onMeasure(i, i2);
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.mInOverride = false;
    }

    public void setInterceptKeyEventListener(InterceptKeyEventListener interceptKeyEventListener) {
        this.mInterceptKeyEventListener = interceptKeyEventListener;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        InterceptKeyEventListener interceptKeyEventListener = this.mInterceptKeyEventListener;
        if (interceptKeyEventListener == null || !interceptKeyEventListener.onInterceptKeyEvent(keyEvent)) {
            return super.dispatchKeyEvent(keyEvent);
        }
        return true;
    }
}
