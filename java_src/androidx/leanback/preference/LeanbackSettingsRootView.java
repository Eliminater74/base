package androidx.leanback.preference;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes.dex */
public class LeanbackSettingsRootView extends FrameLayout {
    private View.OnKeyListener mOnBackKeyListener;

    public LeanbackSettingsRootView(Context context) {
        super(context);
    }

    public LeanbackSettingsRootView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public LeanbackSettingsRootView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setOnBackKeyListener(View.OnKeyListener onKeyListener) {
        this.mOnBackKeyListener = onKeyListener;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        View.OnKeyListener onKeyListener;
        return ((keyEvent.getAction() != 1 || keyEvent.getKeyCode() != 4 || (onKeyListener = this.mOnBackKeyListener) == null) ? false : onKeyListener.onKey(this, keyEvent.getKeyCode(), keyEvent)) || super.dispatchKeyEvent(keyEvent);
    }
}
