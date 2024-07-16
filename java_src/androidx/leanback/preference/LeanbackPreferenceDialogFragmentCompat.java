package androidx.leanback.preference;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.preference.DialogPreference;
/* loaded from: classes.dex */
public class LeanbackPreferenceDialogFragmentCompat extends Fragment {
    public static final String ARG_KEY = "key";
    private DialogPreference mPreference;

    public LeanbackPreferenceDialogFragmentCompat() {
        LeanbackPreferenceFragmentTransitionHelperApi21.addTransitions(this);
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Fragment targetFragment = getTargetFragment();
        if (!(targetFragment instanceof DialogPreference.TargetFragment)) {
            throw new IllegalStateException("Target fragment " + targetFragment + " must implement TargetFragment interface");
        }
    }

    public DialogPreference getPreference() {
        if (this.mPreference == null) {
            this.mPreference = (DialogPreference) ((DialogPreference.TargetFragment) getTargetFragment()).findPreference(getArguments().getString("key"));
        }
        return this.mPreference;
    }
}
