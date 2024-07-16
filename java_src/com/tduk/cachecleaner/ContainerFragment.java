package com.tduk.cachecleaner;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.leanback.preference.LeanbackSettingsFragmentCompat;
import androidx.preference.Preference;
import androidx.preference.PreferenceDialogFragmentCompat;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceScreen;
/* loaded from: classes.dex */
public class ContainerFragment extends LeanbackSettingsFragmentCompat {
    @Override // androidx.leanback.preference.LeanbackSettingsFragmentCompat
    public void onPreferenceStartInitialScreen() {
        startPreferenceFragment(new AppsWhitelistFragment());
    }

    @Override // androidx.preference.PreferenceFragmentCompat.OnPreferenceStartFragmentCallback
    public boolean onPreferenceStartFragment(PreferenceFragmentCompat preferenceFragmentCompat, Preference preference) {
        Bundle extras = preference.getExtras();
        Fragment instantiate = getChildFragmentManager().getFragmentFactory().instantiate(requireActivity().getClassLoader(), preference.getFragment());
        instantiate.setArguments(extras);
        instantiate.setTargetFragment(preferenceFragmentCompat, 0);
        if ((instantiate instanceof PreferenceFragmentCompat) || (instantiate instanceof PreferenceDialogFragmentCompat)) {
            startPreferenceFragment(instantiate);
            return true;
        }
        startImmersiveFragment(instantiate);
        return true;
    }

    @Override // androidx.preference.PreferenceFragmentCompat.OnPreferenceStartScreenCallback
    public boolean onPreferenceStartScreen(PreferenceFragmentCompat preferenceFragmentCompat, PreferenceScreen preferenceScreen) {
        AppsWhitelistFragment appsWhitelistFragment = new AppsWhitelistFragment();
        Bundle bundle = new Bundle(1);
        bundle.putString("androidx.preference.PreferenceFragmentCompat.PREFERENCE_ROOT", preferenceScreen.getKey());
        appsWhitelistFragment.setArguments(bundle);
        startPreferenceFragment(appsWhitelistFragment);
        return true;
    }
}
