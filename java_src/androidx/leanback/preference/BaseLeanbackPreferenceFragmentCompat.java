package androidx.leanback.preference;

import android.content.Context;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.fragment.app.Fragment;
import androidx.leanback.widget.VerticalGridView;
import androidx.preference.C0809R;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceRecyclerViewAccessibilityDelegate;
import androidx.recyclerview.widget.RecyclerView;
/* loaded from: classes.dex */
public abstract class BaseLeanbackPreferenceFragmentCompat extends PreferenceFragmentCompat {
    private Context mThemedContext;

    @Override // androidx.fragment.app.Fragment
    public Context getContext() {
        if (this.mThemedContext == null && getActivity() != null) {
            TypedValue typedValue = new TypedValue();
            getActivity().getTheme().resolveAttribute(C0809R.attr.preferenceTheme, typedValue, true);
            int i = typedValue.resourceId;
            if (i == 0) {
                i = C0598R.style.PreferenceThemeOverlayLeanback;
            }
            this.mThemedContext = new ContextThemeWrapper(super.getContext(), i);
        }
        return this.mThemedContext;
    }

    @Override // androidx.preference.PreferenceFragmentCompat
    public RecyclerView onCreateRecyclerView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        VerticalGridView verticalGridView = (VerticalGridView) layoutInflater.inflate(C0598R.layout.leanback_preferences_list, viewGroup, false);
        verticalGridView.setWindowAlignment(3);
        verticalGridView.setFocusScrollStrategy(0);
        verticalGridView.setAccessibilityDelegateCompat(new PreferenceRecyclerViewAccessibilityDelegate(verticalGridView));
        return verticalGridView;
    }

    @Override // androidx.preference.PreferenceFragmentCompat
    public Fragment getCallbackFragment() {
        return getParentFragment();
    }
}
