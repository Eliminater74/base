package androidx.leanback.preference;

import android.os.Bundle;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.TextView;
import androidx.collection.ArraySet;
import androidx.leanback.widget.VerticalGridView;
import androidx.preference.C0809R;
import androidx.preference.DialogPreference;
import androidx.preference.ListPreference;
import androidx.preference.MultiSelectListPreference;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class LeanbackListPreferenceDialogFragmentCompat extends LeanbackPreferenceDialogFragmentCompat {
    private static final String SAVE_STATE_ENTRIES = "LeanbackListPreferenceDialogFragment.entries";
    private static final String SAVE_STATE_ENTRY_VALUES = "LeanbackListPreferenceDialogFragment.entryValues";
    private static final String SAVE_STATE_INITIAL_SELECTION = "LeanbackListPreferenceDialogFragment.initialSelection";
    private static final String SAVE_STATE_INITIAL_SELECTIONS = "LeanbackListPreferenceDialogFragment.initialSelections";
    private static final String SAVE_STATE_IS_MULTI = "LeanbackListPreferenceDialogFragment.isMulti";
    private static final String SAVE_STATE_MESSAGE = "LeanbackListPreferenceDialogFragment.message";
    private static final String SAVE_STATE_TITLE = "LeanbackListPreferenceDialogFragment.title";
    private CharSequence mDialogMessage;
    private CharSequence mDialogTitle;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private String mInitialSelection;
    Set<String> mInitialSelections;
    private boolean mMulti;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public interface OnItemClickListener {
        void onItemClick(ViewHolder viewHolder);
    }

    public static LeanbackListPreferenceDialogFragmentCompat newInstanceSingle(String str) {
        Bundle bundle = new Bundle(1);
        bundle.putString("key", str);
        LeanbackListPreferenceDialogFragmentCompat leanbackListPreferenceDialogFragmentCompat = new LeanbackListPreferenceDialogFragmentCompat();
        leanbackListPreferenceDialogFragmentCompat.setArguments(bundle);
        return leanbackListPreferenceDialogFragmentCompat;
    }

    public static LeanbackListPreferenceDialogFragmentCompat newInstanceMulti(String str) {
        Bundle bundle = new Bundle(1);
        bundle.putString("key", str);
        LeanbackListPreferenceDialogFragmentCompat leanbackListPreferenceDialogFragmentCompat = new LeanbackListPreferenceDialogFragmentCompat();
        leanbackListPreferenceDialogFragmentCompat.setArguments(bundle);
        return leanbackListPreferenceDialogFragmentCompat;
    }

    @Override // androidx.leanback.preference.LeanbackPreferenceDialogFragmentCompat, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            DialogPreference preference = getPreference();
            this.mDialogTitle = preference.getDialogTitle();
            this.mDialogMessage = preference.getDialogMessage();
            if (preference instanceof ListPreference) {
                this.mMulti = false;
                ListPreference listPreference = (ListPreference) preference;
                this.mEntries = listPreference.getEntries();
                this.mEntryValues = listPreference.getEntryValues();
                this.mInitialSelection = listPreference.getValue();
                return;
            } else if (preference instanceof MultiSelectListPreference) {
                this.mMulti = true;
                MultiSelectListPreference multiSelectListPreference = (MultiSelectListPreference) preference;
                this.mEntries = multiSelectListPreference.getEntries();
                this.mEntryValues = multiSelectListPreference.getEntryValues();
                this.mInitialSelections = multiSelectListPreference.getValues();
                return;
            } else {
                throw new IllegalArgumentException("Preference must be a ListPreference or MultiSelectListPreference");
            }
        }
        this.mDialogTitle = bundle.getCharSequence(SAVE_STATE_TITLE);
        this.mDialogMessage = bundle.getCharSequence(SAVE_STATE_MESSAGE);
        this.mMulti = bundle.getBoolean(SAVE_STATE_IS_MULTI);
        this.mEntries = bundle.getCharSequenceArray(SAVE_STATE_ENTRIES);
        this.mEntryValues = bundle.getCharSequenceArray(SAVE_STATE_ENTRY_VALUES);
        if (this.mMulti) {
            String[] stringArray = bundle.getStringArray(SAVE_STATE_INITIAL_SELECTIONS);
            ArraySet arraySet = new ArraySet(stringArray != null ? stringArray.length : 0);
            this.mInitialSelections = arraySet;
            if (stringArray != null) {
                Collections.addAll(arraySet, stringArray);
                return;
            }
            return;
        }
        this.mInitialSelection = bundle.getString(SAVE_STATE_INITIAL_SELECTION);
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence(SAVE_STATE_TITLE, this.mDialogTitle);
        bundle.putCharSequence(SAVE_STATE_MESSAGE, this.mDialogMessage);
        bundle.putBoolean(SAVE_STATE_IS_MULTI, this.mMulti);
        bundle.putCharSequenceArray(SAVE_STATE_ENTRIES, this.mEntries);
        bundle.putCharSequenceArray(SAVE_STATE_ENTRY_VALUES, this.mEntryValues);
        if (this.mMulti) {
            Set<String> set = this.mInitialSelections;
            bundle.putStringArray(SAVE_STATE_INITIAL_SELECTIONS, (String[]) set.toArray(new String[set.size()]));
            return;
        }
        bundle.putString(SAVE_STATE_INITIAL_SELECTION, this.mInitialSelection);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        TypedValue typedValue = new TypedValue();
        getActivity().getTheme().resolveAttribute(C0809R.attr.preferenceTheme, typedValue, true);
        int i = typedValue.resourceId;
        if (i == 0) {
            i = C0598R.style.PreferenceThemeOverlayLeanback;
        }
        View inflate = layoutInflater.cloneInContext(new ContextThemeWrapper(getActivity(), i)).inflate(C0598R.layout.leanback_list_preference_fragment, viewGroup, false);
        VerticalGridView verticalGridView = (VerticalGridView) inflate.findViewById(16908298);
        verticalGridView.setWindowAlignment(3);
        verticalGridView.setFocusScrollStrategy(0);
        verticalGridView.setAdapter(onCreateAdapter());
        verticalGridView.requestFocus();
        CharSequence charSequence = this.mDialogTitle;
        if (!TextUtils.isEmpty(charSequence)) {
            ((TextView) inflate.findViewById(C0598R.C0600id.decor_title)).setText(charSequence);
        }
        CharSequence charSequence2 = this.mDialogMessage;
        if (!TextUtils.isEmpty(charSequence2)) {
            TextView textView = (TextView) inflate.findViewById(16908299);
            textView.setVisibility(0);
            textView.setText(charSequence2);
        }
        return inflate;
    }

    RecyclerView.Adapter onCreateAdapter() {
        if (this.mMulti) {
            return new AdapterMulti(this.mEntries, this.mEntryValues, this.mInitialSelections);
        }
        return new AdapterSingle(this.mEntries, this.mEntryValues, this.mInitialSelection);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class AdapterSingle extends RecyclerView.Adapter<ViewHolder> implements OnItemClickListener {
        private final CharSequence[] mEntries;
        private final CharSequence[] mEntryValues;
        private CharSequence mSelectedValue;

        AdapterSingle(CharSequence[] charSequenceArr, CharSequence[] charSequenceArr2, CharSequence charSequence) {
            this.mEntries = charSequenceArr;
            this.mEntryValues = charSequenceArr2;
            this.mSelectedValue = charSequence;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(C0598R.layout.leanback_list_preference_item_single, viewGroup, false), this);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            viewHolder.getWidgetView().setChecked(TextUtils.equals(this.mEntryValues[i].toString(), this.mSelectedValue));
            viewHolder.getTitleView().setText(this.mEntries[i]);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mEntries.length;
        }

        @Override // androidx.leanback.preference.LeanbackListPreferenceDialogFragmentCompat.OnItemClickListener
        public void onItemClick(ViewHolder viewHolder) {
            int absoluteAdapterPosition = viewHolder.getAbsoluteAdapterPosition();
            if (absoluteAdapterPosition == -1) {
                return;
            }
            CharSequence charSequence = this.mEntryValues[absoluteAdapterPosition];
            ListPreference listPreference = (ListPreference) LeanbackListPreferenceDialogFragmentCompat.this.getPreference();
            if (absoluteAdapterPosition >= 0) {
                String charSequence2 = this.mEntryValues[absoluteAdapterPosition].toString();
                if (listPreference.callChangeListener(charSequence2)) {
                    listPreference.setValue(charSequence2);
                    this.mSelectedValue = charSequence;
                }
            }
            LeanbackListPreferenceDialogFragmentCompat.this.getFragmentManager().popBackStack();
            notifyDataSetChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class AdapterMulti extends RecyclerView.Adapter<ViewHolder> implements OnItemClickListener {
        private final CharSequence[] mEntries;
        private final CharSequence[] mEntryValues;
        private final Set<String> mSelections;

        AdapterMulti(CharSequence[] charSequenceArr, CharSequence[] charSequenceArr2, Set<String> set) {
            this.mEntries = charSequenceArr;
            this.mEntryValues = charSequenceArr2;
            this.mSelections = new HashSet(set);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(C0598R.layout.leanback_list_preference_item_multi, viewGroup, false), this);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            viewHolder.getWidgetView().setChecked(this.mSelections.contains(this.mEntryValues[i].toString()));
            viewHolder.getTitleView().setText(this.mEntries[i]);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mEntries.length;
        }

        @Override // androidx.leanback.preference.LeanbackListPreferenceDialogFragmentCompat.OnItemClickListener
        public void onItemClick(ViewHolder viewHolder) {
            int absoluteAdapterPosition = viewHolder.getAbsoluteAdapterPosition();
            if (absoluteAdapterPosition == -1) {
                return;
            }
            String charSequence = this.mEntryValues[absoluteAdapterPosition].toString();
            if (this.mSelections.contains(charSequence)) {
                this.mSelections.remove(charSequence);
            } else {
                this.mSelections.add(charSequence);
            }
            MultiSelectListPreference multiSelectListPreference = (MultiSelectListPreference) LeanbackListPreferenceDialogFragmentCompat.this.getPreference();
            if (multiSelectListPreference.callChangeListener(new HashSet(this.mSelections))) {
                multiSelectListPreference.setValues(new HashSet(this.mSelections));
                LeanbackListPreferenceDialogFragmentCompat.this.mInitialSelections = this.mSelections;
            } else if (this.mSelections.contains(charSequence)) {
                this.mSelections.remove(charSequence);
            } else {
                this.mSelections.add(charSequence);
            }
            notifyDataSetChanged();
        }
    }

    /* loaded from: classes.dex */
    public static final class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        private final ViewGroup mContainer;
        private final OnItemClickListener mListener;
        private final TextView mTitleView;
        private final Checkable mWidgetView;

        ViewHolder(View view, OnItemClickListener onItemClickListener) {
            super(view);
            this.mWidgetView = (Checkable) view.findViewById(C0598R.C0600id.button);
            ViewGroup viewGroup = (ViewGroup) view.findViewById(C0598R.C0600id.container);
            this.mContainer = viewGroup;
            this.mTitleView = (TextView) view.findViewById(16908310);
            viewGroup.setOnClickListener(this);
            this.mListener = onItemClickListener;
        }

        public Checkable getWidgetView() {
            return this.mWidgetView;
        }

        public TextView getTitleView() {
            return this.mTitleView;
        }

        public ViewGroup getContainer() {
            return this.mContainer;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            this.mListener.onItemClick(this);
        }
    }
}
