package androidx.leanback.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import androidx.core.view.ViewCompat;
/* loaded from: classes.dex */
public class VerticalGridView extends BaseGridView {
    public VerticalGridView(Context context) {
        this(context, null);
    }

    public VerticalGridView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public VerticalGridView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mLayoutManager.setOrientation(1);
        initAttributes(context, attributeSet);
    }

    protected void initAttributes(Context context, AttributeSet attributeSet) {
        initBaseGridViewAttributes(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0695R.styleable.lbVerticalGridView);
        ViewCompat.saveAttributeDataForStyleable(this, context, C0695R.styleable.lbVerticalGridView, attributeSet, obtainStyledAttributes, 0, 0);
        setColumnWidth(obtainStyledAttributes);
        setNumColumns(obtainStyledAttributes.getInt(C0695R.styleable.lbVerticalGridView_numberOfColumns, 1));
        obtainStyledAttributes.recycle();
    }

    void setColumnWidth(TypedArray typedArray) {
        if (typedArray.peekValue(C0695R.styleable.lbVerticalGridView_columnWidth) != null) {
            setColumnWidth(typedArray.getLayoutDimension(C0695R.styleable.lbVerticalGridView_columnWidth, 0));
        }
    }

    public void setNumColumns(int i) {
        this.mLayoutManager.setNumRows(i);
        requestLayout();
    }

    public void setColumnWidth(int i) {
        this.mLayoutManager.setRowHeight(i);
        requestLayout();
    }
}
