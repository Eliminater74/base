package com.tduk.cachecleaner;

import android.os.Bundle;
import android.view.ViewGroup;
import androidx.core.view.GravityCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragmentCompat;
import androidx.transition.Scene;
import androidx.transition.Slide;
import androidx.transition.Transition;
import androidx.transition.TransitionManager;
/* loaded from: classes.dex */
public class AppsWhitelistActivity extends FragmentActivity implements PreferenceFragmentCompat.OnPreferenceStartFragmentCallback {
    String SETTINGS_FRAGMENT_TAG = "settings_fragment_tag";

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(com.tduk.appklr.R.layout.activity_apps_whitelist);
    }

    @Override // androidx.preference.PreferenceFragmentCompat.OnPreferenceStartFragmentCallback
    public boolean onPreferenceStartFragment(PreferenceFragmentCompat preferenceFragmentCompat, Preference preference) {
        Bundle extras = preference.getExtras();
        Fragment instantiate = getSupportFragmentManager().getFragmentFactory().instantiate(getClassLoader(), preference.getFragment());
        instantiate.setArguments(extras);
        instantiate.setTargetFragment(preferenceFragmentCompat, 0);
        getSupportFragmentManager().beginTransaction().replace(com.tduk.appklr.R.id.settings_fragment, instantiate).addToBackStack(null).commit();
        return true;
    }

    @Override // android.app.Activity
    public void finish() {
        final Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(this.SETTINGS_FRAGMENT_TAG);
        if (findFragmentByTag != null) {
            Scene scene = new Scene((ViewGroup) findViewById(com.tduk.appklr.R.id.settings_fragment));
            scene.setEnterAction(new Runnable() { // from class: com.tduk.cachecleaner.AppsWhitelistActivity.1
                @Override // java.lang.Runnable
                public void run() {
                    AppsWhitelistActivity.this.getSupportFragmentManager().beginTransaction().remove(findFragmentByTag).commitNow();
                }
            });
            Slide slide = new Slide(GravityCompat.END);
            slide.addListener(new Transition.TransitionListener() { // from class: com.tduk.cachecleaner.AppsWhitelistActivity.2
                @Override // androidx.transition.Transition.TransitionListener
                public void onTransitionCancel(Transition transition) {
                }

                @Override // androidx.transition.Transition.TransitionListener
                public void onTransitionPause(Transition transition) {
                }

                @Override // androidx.transition.Transition.TransitionListener
                public void onTransitionResume(Transition transition) {
                }

                @Override // androidx.transition.Transition.TransitionListener
                public void onTransitionStart(Transition transition) {
                    AppsWhitelistActivity.this.getWindow().setDimAmount(0.0f);
                }

                @Override // androidx.transition.Transition.TransitionListener
                public void onTransitionEnd(Transition transition) {
                    transition.removeListener(this);
                    AppsWhitelistActivity.this.finish();
                }
            });
            TransitionManager.m0go(scene, slide);
            return;
        }
        super.finish();
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        finishAfterTransition();
    }
}
