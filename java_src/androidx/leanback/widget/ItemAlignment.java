package androidx.leanback.widget;

import android.view.View;
import androidx.leanback.widget.ItemAlignmentFacet;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ItemAlignment {
    public final Axis horizontal;
    private Axis mMainAxis;
    private int mOrientation = 0;
    private Axis mSecondAxis;
    public final Axis vertical;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ItemAlignment() {
        Axis axis = new Axis(1);
        this.vertical = axis;
        Axis axis2 = new Axis(0);
        this.horizontal = axis2;
        this.mMainAxis = axis2;
        this.mSecondAxis = axis;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Axis extends ItemAlignmentFacet.ItemAlignmentDef {
        private final int mOrientation;

        Axis(int i) {
            this.mOrientation = i;
        }

        public int getAlignmentPosition(View view) {
            return ItemAlignmentFacetHelper.getAlignmentPosition(view, this, this.mOrientation);
        }
    }

    public final Axis mainAxis() {
        return this.mMainAxis;
    }

    public final Axis secondAxis() {
        return this.mSecondAxis;
    }

    public final void setOrientation(int i) {
        this.mOrientation = i;
        if (i == 0) {
            this.mMainAxis = this.horizontal;
            this.mSecondAxis = this.vertical;
            return;
        }
        this.mMainAxis = this.vertical;
        this.mSecondAxis = this.horizontal;
    }

    public final int getOrientation() {
        return this.mOrientation;
    }
}
