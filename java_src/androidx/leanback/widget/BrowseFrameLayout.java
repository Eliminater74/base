package androidx.leanback.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes.dex */
public class BrowseFrameLayout extends FrameLayout {
    private OnFocusSearchListener mListener;
    private OnChildFocusListener mOnChildFocusListener;
    private View.OnKeyListener mOnDispatchKeyListener;

    /* loaded from: classes.dex */
    public interface OnChildFocusListener {
        void onRequestChildFocus(View view, View view2);

        boolean onRequestFocusInDescendants(int i, Rect rect);
    }

    /* loaded from: classes.dex */
    public interface OnFocusSearchListener {
        View onFocusSearch(View view, int i);
    }

    public BrowseFrameLayout(Context context) {
        this(context, null, 0);
    }

    public BrowseFrameLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public BrowseFrameLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setOnFocusSearchListener(OnFocusSearchListener onFocusSearchListener) {
        this.mListener = onFocusSearchListener;
    }

    public OnFocusSearchListener getOnFocusSearchListener() {
        return this.mListener;
    }

    public void setOnChildFocusListener(OnChildFocusListener onChildFocusListener) {
        this.mOnChildFocusListener = onChildFocusListener;
    }

    public OnChildFocusListener getOnChildFocusListener() {
        return this.mOnChildFocusListener;
    }

    @Override // android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        OnChildFocusListener onChildFocusListener = this.mOnChildFocusListener;
        if (onChildFocusListener == null || !onChildFocusListener.onRequestFocusInDescendants(i, rect)) {
            return super.onRequestFocusInDescendants(i, rect);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public View focusSearch(View view, int i) {
        View onFocusSearch;
        OnFocusSearchListener onFocusSearchListener = this.mListener;
        return (onFocusSearchListener == null || (onFocusSearch = onFocusSearchListener.onFocusSearch(view, i)) == null) ? super.focusSearch(view, i) : onFocusSearch;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestChildFocus(View view, View view2) {
        OnChildFocusListener onChildFocusListener = this.mOnChildFocusListener;
        if (onChildFocusListener != null) {
            onChildFocusListener.onRequestChildFocus(view, view2);
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean dispatchKeyEvent = super.dispatchKeyEvent(keyEvent);
        View.OnKeyListener onKeyListener = this.mOnDispatchKeyListener;
        return (onKeyListener == null || dispatchKeyEvent) ? dispatchKeyEvent : onKeyListener.onKey(getRootView(), keyEvent.getKeyCode(), keyEvent);
    }

    public void setOnDispatchKeyListener(View.OnKeyListener onKeyListener) {
        this.mOnDispatchKeyListener = onKeyListener;
    }
}
