package androidx.leanback.widget;

import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
final class StaticShadowHelper {
    private StaticShadowHelper() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean supportsShadow() {
        return Build.VERSION.SDK_INT >= 21;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void prepareParent(ViewGroup viewGroup) {
        if (Build.VERSION.SDK_INT >= 21) {
            viewGroup.setLayoutMode(1);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Object addStaticShadow(ViewGroup viewGroup) {
        if (Build.VERSION.SDK_INT >= 21) {
            viewGroup.setLayoutMode(1);
            LayoutInflater.from(viewGroup.getContext()).inflate(C0393R.layout.lb_shadow, viewGroup, true);
            ShadowImpl shadowImpl = new ShadowImpl();
            shadowImpl.mNormalShadow = viewGroup.findViewById(C0393R.C0396id.lb_shadow_normal);
            shadowImpl.mFocusShadow = viewGroup.findViewById(C0393R.C0396id.lb_shadow_focused);
            return shadowImpl;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setShadowFocusLevel(Object obj, float f) {
        if (Build.VERSION.SDK_INT >= 21) {
            ShadowImpl shadowImpl = (ShadowImpl) obj;
            shadowImpl.mNormalShadow.setAlpha(1.0f - f);
            shadowImpl.mFocusShadow.setAlpha(f);
        }
    }

    /* loaded from: classes.dex */
    static class ShadowImpl {
        View mFocusShadow;
        View mNormalShadow;

        ShadowImpl() {
        }
    }
}
