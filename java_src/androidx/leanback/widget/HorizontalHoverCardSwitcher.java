package androidx.leanback.widget;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.view.ViewCompat;
/* loaded from: classes.dex */
public final class HorizontalHoverCardSwitcher extends PresenterSwitcher {
    int mCardLeft;
    int mCardRight;
    private int[] mTmpOffsets = new int[2];
    private Rect mTmpRect = new Rect();

    @Override // androidx.leanback.widget.PresenterSwitcher
    protected void insertView(View view) {
        getParentViewGroup().addView(view);
    }

    @Override // androidx.leanback.widget.PresenterSwitcher
    protected void onViewSelected(View view) {
        int width = getParentViewGroup().getWidth() - getParentViewGroup().getPaddingRight();
        int paddingLeft = getParentViewGroup().getPaddingLeft();
        view.measure(0, 0);
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        boolean z = ViewCompat.getLayoutDirection(view) == 1;
        if (!z && this.mCardLeft + view.getMeasuredWidth() > width) {
            marginLayoutParams.leftMargin = width - view.getMeasuredWidth();
        } else if (z && this.mCardLeft < paddingLeft) {
            marginLayoutParams.leftMargin = paddingLeft;
        } else if (z) {
            marginLayoutParams.leftMargin = this.mCardRight - view.getMeasuredWidth();
        } else {
            marginLayoutParams.leftMargin = this.mCardLeft;
        }
        view.requestLayout();
    }

    public void select(HorizontalGridView horizontalGridView, View view, Object obj) {
        ViewGroup parentViewGroup = getParentViewGroup();
        horizontalGridView.getViewSelectedOffsets(view, this.mTmpOffsets);
        this.mTmpRect.set(0, 0, view.getWidth(), view.getHeight());
        parentViewGroup.offsetDescendantRectToMyCoords(view, this.mTmpRect);
        this.mCardLeft = this.mTmpRect.left - this.mTmpOffsets[0];
        this.mCardRight = this.mTmpRect.right - this.mTmpOffsets[0];
        select(obj);
    }
}
