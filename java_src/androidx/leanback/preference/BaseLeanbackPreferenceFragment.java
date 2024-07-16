package androidx.leanback.preference;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.leanback.widget.VerticalGridView;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceRecyclerViewAccessibilityDelegate;
import androidx.recyclerview.widget.RecyclerView;
@Deprecated
/* loaded from: classes.dex */
public abstract class BaseLeanbackPreferenceFragment extends PreferenceFragment {
    @Override // androidx.preference.PreferenceFragment
    public RecyclerView onCreateRecyclerView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        VerticalGridView verticalGridView = (VerticalGridView) layoutInflater.inflate(C0598R.layout.leanback_preferences_list, viewGroup, false);
        verticalGridView.setWindowAlignment(3);
        verticalGridView.setFocusScrollStrategy(0);
        verticalGridView.setAccessibilityDelegateCompat(new PreferenceRecyclerViewAccessibilityDelegate(verticalGridView));
        return verticalGridView;
    }

    @Override // androidx.preference.PreferenceFragment
    public Fragment getCallbackFragment() {
        return getParentFragment();
    }
}
