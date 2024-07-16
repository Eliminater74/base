package androidx.leanback.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
public final class ListRowView extends LinearLayout {
    private HorizontalGridView mGridView;

    public ListRowView(Context context) {
        this(context, null);
    }

    public ListRowView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ListRowView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        LayoutInflater.from(context).inflate(C0393R.layout.lb_list_row, this);
        HorizontalGridView horizontalGridView = (HorizontalGridView) findViewById(C0393R.C0396id.row_content);
        this.mGridView = horizontalGridView;
        horizontalGridView.setHasFixedSize(false);
        setOrientation(1);
        setDescendantFocusability(262144);
    }

    public HorizontalGridView getGridView() {
        return this.mGridView;
    }
}
