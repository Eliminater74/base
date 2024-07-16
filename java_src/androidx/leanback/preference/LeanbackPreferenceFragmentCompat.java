package androidx.leanback.preference;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
/* loaded from: classes.dex */
public abstract class LeanbackPreferenceFragmentCompat extends BaseLeanbackPreferenceFragmentCompat {
    public LeanbackPreferenceFragmentCompat() {
        LeanbackPreferenceFragmentTransitionHelperApi21.addTransitions(this);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = LayoutInflater.from(onCreateView.getContext()).inflate(C0598R.layout.leanback_preference_fragment, viewGroup, false);
        ViewGroup viewGroup2 = (ViewGroup) inflate.findViewById(C0598R.C0600id.main_frame);
        if (onCreateView != null) {
            viewGroup2.addView(onCreateView);
        }
        return inflate;
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        setTitle(getPreferenceScreen().getTitle());
    }

    public void setTitle(CharSequence charSequence) {
        View view = getView();
        TextView textView = view == null ? null : (TextView) view.findViewById(C0598R.C0600id.decor_title);
        if (textView != null) {
            textView.setText(charSequence);
        }
    }
}
