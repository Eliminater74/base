package androidx.leanback.app;

import android.app.Fragment;
import android.content.Context;
import android.os.Build;
/* loaded from: classes.dex */
class FragmentUtil {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static Context getContext(Fragment fragment) {
        if (Build.VERSION.SDK_INT >= 23) {
            return fragment.getContext();
        }
        return fragment.getActivity();
    }

    private FragmentUtil() {
    }
}
