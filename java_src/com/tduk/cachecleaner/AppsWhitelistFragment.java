package com.tduk.cachecleaner;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import androidx.leanback.preference.LeanbackPreferenceFragmentCompat;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes.dex */
public class AppsWhitelistFragment extends LeanbackPreferenceFragmentCompat {
    ArrayList<String> appsWhitelist;

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        this.appsWhitelist = AppsWhitelistUtils.getWhitelist(requireContext());
        super.onCreate(bundle);
    }

    @Override // androidx.preference.PreferenceFragmentCompat
    public void onCreatePreferences(Bundle bundle, String str) {
        PreferenceScreen createPreferenceScreen = getPreferenceManager().createPreferenceScreen(getPreferenceManager().getContext());
        createPreferenceScreen.setTitle("Apps Whitelist");
        setPreferenceScreen(createPreferenceScreen);
        final PackageManager packageManager = requireContext().getPackageManager();
        List<PackageInfo> installedPackages = packageManager.getInstalledPackages(0);
        installedPackages.sort(new Comparator<PackageInfo>() { // from class: com.tduk.cachecleaner.AppsWhitelistFragment.1
            @Override // java.util.Comparator
            public int compare(PackageInfo packageInfo, PackageInfo packageInfo2) {
                return ((String) packageInfo.applicationInfo.loadLabel(packageManager)).compareToIgnoreCase((String) packageInfo2.applicationInfo.loadLabel(packageManager));
            }
        });
        for (final PackageInfo packageInfo : installedPackages) {
            if ((packageInfo.applicationInfo.flags & 1) == 0) {
                final SwitchPreference switchPreference = new SwitchPreference(requireContext());
                switchPreference.setKey(packageInfo.packageName);
                switchPreference.setTitle(packageInfo.applicationInfo.loadLabel(packageManager));
                switchPreference.setChecked(this.appsWhitelist.contains(packageInfo.packageName));
                try {
                    Drawable drawable = packageManager.getResourcesForApplication(packageInfo.packageName).getDrawable(packageInfo.applicationInfo.icon);
                    drawable.setFilterBitmap(true);
                    switchPreference.setIcon(drawable);
                } catch (Exception unused) {
                    switchPreference.setIcon(com.tduk.appklr.R.drawable.ic_android_black_24dp);
                }
                switchPreference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: com.tduk.cachecleaner.AppsWhitelistFragment.2
                    @Override // androidx.preference.Preference.OnPreferenceChangeListener
                    public boolean onPreferenceChange(Preference preference, Object obj) {
                        final boolean booleanValue = ((Boolean) obj).booleanValue();
                        switchPreference.setChecked(booleanValue);
                        if (booleanValue) {
                            AppsWhitelistFragment.this.appsWhitelist.add(packageInfo.packageName);
                        } else {
                            AppsWhitelistFragment.this.appsWhitelist.remove(packageInfo.packageName);
                        }
                        AsyncTask.execute(new Runnable() { // from class: com.tduk.cachecleaner.AppsWhitelistFragment.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (booleanValue) {
                                    AppsWhitelistUtils.addAppToWhitelist(AppsWhitelistFragment.this.requireContext(), packageInfo.packageName);
                                } else {
                                    AppsWhitelistUtils.removeAppFromWhitelist(AppsWhitelistFragment.this.requireContext(), packageInfo.packageName);
                                }
                            }
                        });
                        return false;
                    }
                });
                createPreferenceScreen.addPreference(switchPreference);
            }
        }
    }
}
