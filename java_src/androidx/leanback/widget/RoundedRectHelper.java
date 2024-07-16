package androidx.leanback.widget;

import android.os.Build;
import android.view.View;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
final class RoundedRectHelper {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean supportsRoundedCorner() {
        return Build.VERSION.SDK_INT >= 21;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setClipToRoundedOutline(View view, boolean z, int i) {
        if (Build.VERSION.SDK_INT >= 21) {
            RoundedRectHelperApi21.setClipToRoundedOutline(view, z, i);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setClipToRoundedOutline(View view, boolean z) {
        if (Build.VERSION.SDK_INT >= 21) {
            RoundedRectHelperApi21.setClipToRoundedOutline(view, z, view.getResources().getDimensionPixelSize(C0393R.dimen.lb_rounded_rect_corner_radius));
        }
    }

    private RoundedRectHelper() {
    }
}
