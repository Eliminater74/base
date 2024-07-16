package androidx.leanback.widget;

import androidx.leanback.C0393R;
import androidx.leanback.widget.Parallax;
/* loaded from: classes.dex */
public class DetailsParallax extends RecyclerViewParallax {
    final Parallax.IntProperty mFrameTop = addProperty("overviewRowTop").adapterPosition(0).viewId(C0393R.C0396id.details_frame);
    final Parallax.IntProperty mFrameBottom = addProperty("overviewRowBottom").adapterPosition(0).viewId(C0393R.C0396id.details_frame).fraction(1.0f);

    public Parallax.IntProperty getOverviewRowTop() {
        return this.mFrameTop;
    }

    public Parallax.IntProperty getOverviewRowBottom() {
        return this.mFrameBottom;
    }
}
