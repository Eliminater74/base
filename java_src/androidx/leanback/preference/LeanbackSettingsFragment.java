package androidx.leanback.preference;

import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Space;
import androidx.preference.ListPreference;
import androidx.preference.MultiSelectListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
@Deprecated
/* loaded from: classes.dex */
public abstract class LeanbackSettingsFragment extends Fragment implements PreferenceFragment.OnPreferenceStartFragmentCallback, PreferenceFragment.OnPreferenceStartScreenCallback, PreferenceFragment.OnPreferenceDisplayDialogCallback {
    private static final String PREFERENCE_FRAGMENT_TAG = "androidx.leanback.preference.LeanbackSettingsFragment.PREFERENCE_FRAGMENT";
    private final RootViewOnKeyListener mRootViewOnKeyListener = new RootViewOnKeyListener();

    public abstract void onPreferenceStartInitialScreen();

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(C0598R.layout.leanback_settings_fragment, viewGroup, false);
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (bundle == null) {
            onPreferenceStartInitialScreen();
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        LeanbackSettingsRootView leanbackSettingsRootView = (LeanbackSettingsRootView) getView();
        if (leanbackSettingsRootView != null) {
            leanbackSettingsRootView.setOnBackKeyListener(this.mRootViewOnKeyListener);
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        LeanbackSettingsRootView leanbackSettingsRootView = (LeanbackSettingsRootView) getView();
        if (leanbackSettingsRootView != null) {
            leanbackSettingsRootView.setOnBackKeyListener(null);
        }
    }

    @Override // androidx.preference.PreferenceFragment.OnPreferenceDisplayDialogCallback
    public boolean onPreferenceDisplayDialog(PreferenceFragment preferenceFragment, Preference preference) {
        if (preferenceFragment == null) {
            throw new IllegalArgumentException("Cannot display dialog for preference " + preference + ", Caller must not be null!");
        }
        if (preference instanceof ListPreference) {
            LeanbackListPreferenceDialogFragment newInstanceSingle = LeanbackListPreferenceDialogFragment.newInstanceSingle(((ListPreference) preference).getKey());
            newInstanceSingle.setTargetFragment(preferenceFragment, 0);
            startPreferenceFragment(newInstanceSingle);
            return true;
        } else if (preference instanceof MultiSelectListPreference) {
            LeanbackListPreferenceDialogFragment newInstanceMulti = LeanbackListPreferenceDialogFragment.newInstanceMulti(((MultiSelectListPreference) preference).getKey());
            newInstanceMulti.setTargetFragment(preferenceFragment, 0);
            startPreferenceFragment(newInstanceMulti);
            return true;
        } else {
            return false;
        }
    }

    public void startPreferenceFragment(Fragment fragment) {
        FragmentTransaction beginTransaction = getChildFragmentManager().beginTransaction();
        if (getChildFragmentManager().findFragmentByTag(PREFERENCE_FRAGMENT_TAG) != null) {
            beginTransaction.addToBackStack(null).replace(C0598R.C0600id.settings_preference_fragment_container, fragment, PREFERENCE_FRAGMENT_TAG);
        } else {
            beginTransaction.add(C0598R.C0600id.settings_preference_fragment_container, fragment, PREFERENCE_FRAGMENT_TAG);
        }
        beginTransaction.commit();
    }

    public void startImmersiveFragment(Fragment fragment) {
        FragmentTransaction beginTransaction = getChildFragmentManager().beginTransaction();
        Fragment findFragmentByTag = getChildFragmentManager().findFragmentByTag(PREFERENCE_FRAGMENT_TAG);
        if (findFragmentByTag != null && !findFragmentByTag.isHidden()) {
            if (Build.VERSION.SDK_INT < 23) {
                beginTransaction.add(C0598R.C0600id.settings_preference_fragment_container, new DummyFragment());
            }
            beginTransaction.remove(findFragmentByTag);
        }
        beginTransaction.add(C0598R.C0600id.settings_dialog_container, fragment).addToBackStack(null).commit();
    }

    /* loaded from: classes.dex */
    private class RootViewOnKeyListener implements View.OnKeyListener {
        RootViewOnKeyListener() {
        }

        @Override // android.view.View.OnKeyListener
        public boolean onKey(View view, int i, KeyEvent keyEvent) {
            if (i == 4) {
                return LeanbackSettingsFragment.this.getChildFragmentManager().popBackStackImmediate();
            }
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static class DummyFragment extends Fragment {
        @Override // android.app.Fragment
        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            Space space = new Space(layoutInflater.getContext());
            space.setVisibility(8);
            return space;
        }
    }
}
