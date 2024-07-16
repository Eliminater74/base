package androidx.leanback.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import java.util.ArrayList;
/* loaded from: classes.dex */
class ControlBar extends LinearLayout {
    private int mChildMarginFromCenter;
    boolean mDefaultFocusToMiddle;
    int mLastFocusIndex;
    private OnChildFocusedListener mOnChildFocusedListener;

    /* loaded from: classes.dex */
    public interface OnChildFocusedListener {
        void onChildFocusedListener(View view, View view2);
    }

    public ControlBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mLastFocusIndex = -1;
        this.mDefaultFocusToMiddle = true;
    }

    public ControlBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mLastFocusIndex = -1;
        this.mDefaultFocusToMiddle = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setDefaultFocusToMiddle(boolean z) {
        this.mDefaultFocusToMiddle = z;
    }

    int getDefaultFocusIndex() {
        if (this.mDefaultFocusToMiddle) {
            return getChildCount() / 2;
        }
        return 0;
    }

    @Override // android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        if (getChildCount() > 0) {
            int i2 = this.mLastFocusIndex;
            if (getChildAt((i2 < 0 || i2 >= getChildCount()) ? getDefaultFocusIndex() : this.mLastFocusIndex).requestFocus(i, rect)) {
                return true;
            }
        }
        return super.onRequestFocusInDescendants(i, rect);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        if (i == 33 || i == 130) {
            int i3 = this.mLastFocusIndex;
            if (i3 >= 0 && i3 < getChildCount()) {
                arrayList.add(getChildAt(this.mLastFocusIndex));
                return;
            } else if (getChildCount() > 0) {
                arrayList.add(getChildAt(getDefaultFocusIndex()));
                return;
            } else {
                return;
            }
        }
        super.addFocusables(arrayList, i, i2);
    }

    public void setOnChildFocusedListener(OnChildFocusedListener onChildFocusedListener) {
        this.mOnChildFocusedListener = onChildFocusedListener;
    }

    public void setChildMarginFromCenter(int i) {
        this.mChildMarginFromCenter = i;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        this.mLastFocusIndex = indexOfChild(view);
        OnChildFocusedListener onChildFocusedListener = this.mOnChildFocusedListener;
        if (onChildFocusedListener != null) {
            onChildFocusedListener.onChildFocusedListener(view, view2);
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (this.mChildMarginFromCenter <= 0) {
            return;
        }
        int i3 = 0;
        int i4 = 0;
        while (i3 < getChildCount() - 1) {
            View childAt = getChildAt(i3);
            i3++;
            View childAt2 = getChildAt(i3);
            int measuredWidth = this.mChildMarginFromCenter - ((childAt.getMeasuredWidth() + childAt2.getMeasuredWidth()) / 2);
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt2.getLayoutParams();
            layoutParams.setMarginStart(measuredWidth);
            childAt2.setLayoutParams(layoutParams);
            i4 += measuredWidth - layoutParams.getMarginStart();
        }
        setMeasuredDimension(getMeasuredWidth() + i4, getMeasuredHeight());
    }
}
