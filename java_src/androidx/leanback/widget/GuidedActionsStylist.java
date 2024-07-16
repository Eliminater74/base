package androidx.leanback.widget;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Checkable;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.core.content.ContextCompat;
import androidx.core.location.LocationRequestCompat;
import androidx.leanback.C0393R;
import androidx.leanback.transition.TransitionEpicenterCallback;
import androidx.leanback.transition.TransitionHelper;
import androidx.leanback.transition.TransitionListener;
import androidx.leanback.widget.GuidedActionAdapter;
import androidx.leanback.widget.GuidedActionsRelativeLayout;
import androidx.leanback.widget.ItemAlignmentFacet;
import androidx.leanback.widget.picker.DatePicker;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class GuidedActionsStylist implements FragmentAnimationProvider {
    private static final String TAG = "GuidedActionsStylist";
    public static final int VIEW_TYPE_DATE_PICKER = 1;
    public static final int VIEW_TYPE_DEFAULT = 0;
    static final ItemAlignmentFacet sGuidedActionItemAlignFacet;
    private VerticalGridView mActionsGridView;
    private boolean mButtonActions;
    private View mContentView;
    private int mDescriptionMinLines;
    private float mDisabledChevronAlpha;
    private float mDisabledDescriptionAlpha;
    private float mDisabledTextAlpha;
    private int mDisplayHeight;
    private GuidedActionAdapter.EditListener mEditListener;
    private float mEnabledChevronAlpha;
    private float mEnabledDescriptionAlpha;
    private float mEnabledTextAlpha;
    Object mExpandTransition;
    private float mKeyLinePercent;
    ViewGroup mMainView;
    private View mSubActionsBackground;
    VerticalGridView mSubActionsGridView;
    private int mTitleMaxLines;
    private int mTitleMinLines;
    private int mVerticalPadding;
    GuidedAction mExpandedAction = null;
    private boolean mBackToCollapseSubActions = true;
    private boolean mBackToCollapseActivatorView = true;

    public void onAnimateItemFocused(ViewHolder viewHolder, boolean z) {
    }

    @Deprecated
    protected void onEditingModeChange(ViewHolder viewHolder, GuidedAction guidedAction, boolean z) {
    }

    @Override // androidx.leanback.widget.FragmentAnimationProvider
    public void onImeAppearing(List<Animator> list) {
    }

    @Override // androidx.leanback.widget.FragmentAnimationProvider
    public void onImeDisappearing(List<Animator> list) {
    }

    static {
        ItemAlignmentFacet itemAlignmentFacet = new ItemAlignmentFacet();
        sGuidedActionItemAlignFacet = itemAlignmentFacet;
        ItemAlignmentFacet.ItemAlignmentDef itemAlignmentDef = new ItemAlignmentFacet.ItemAlignmentDef();
        itemAlignmentDef.setItemAlignmentViewId(C0393R.C0396id.guidedactions_item_title);
        itemAlignmentDef.setAlignedToTextViewBaseline(true);
        itemAlignmentDef.setItemAlignmentOffset(0);
        itemAlignmentDef.setItemAlignmentOffsetWithPadding(true);
        itemAlignmentDef.setItemAlignmentOffsetPercent(0.0f);
        itemAlignmentFacet.setAlignmentDefs(new ItemAlignmentFacet.ItemAlignmentDef[]{itemAlignmentDef});
    }

    /* loaded from: classes.dex */
    public static class ViewHolder extends RecyclerView.ViewHolder implements FacetProvider {
        GuidedAction mAction;
        View mActivatorView;
        ImageView mCheckmarkView;
        ImageView mChevronView;
        private View mContentView;
        final View.AccessibilityDelegate mDelegate;
        TextView mDescriptionView;
        int mEditingMode;
        ImageView mIconView;
        private final boolean mIsSubAction;
        Animator mPressAnimator;
        TextView mTitleView;

        public ViewHolder(View view) {
            this(view, false);
        }

        public ViewHolder(View view, boolean z) {
            super(view);
            this.mEditingMode = 0;
            View.AccessibilityDelegate accessibilityDelegate = new View.AccessibilityDelegate() { // from class: androidx.leanback.widget.GuidedActionsStylist.ViewHolder.1
                @Override // android.view.View.AccessibilityDelegate
                public void onInitializeAccessibilityEvent(View view2, AccessibilityEvent accessibilityEvent) {
                    super.onInitializeAccessibilityEvent(view2, accessibilityEvent);
                    accessibilityEvent.setChecked(ViewHolder.this.mAction != null && ViewHolder.this.mAction.isChecked());
                }

                @Override // android.view.View.AccessibilityDelegate
                public void onInitializeAccessibilityNodeInfo(View view2, AccessibilityNodeInfo accessibilityNodeInfo) {
                    super.onInitializeAccessibilityNodeInfo(view2, accessibilityNodeInfo);
                    boolean z2 = true;
                    accessibilityNodeInfo.setCheckable((ViewHolder.this.mAction == null || ViewHolder.this.mAction.getCheckSetId() == 0) ? false : true);
                    if (ViewHolder.this.mAction == null || !ViewHolder.this.mAction.isChecked()) {
                        z2 = false;
                    }
                    accessibilityNodeInfo.setChecked(z2);
                }
            };
            this.mDelegate = accessibilityDelegate;
            this.mContentView = view.findViewById(C0393R.C0396id.guidedactions_item_content);
            this.mTitleView = (TextView) view.findViewById(C0393R.C0396id.guidedactions_item_title);
            this.mActivatorView = view.findViewById(C0393R.C0396id.guidedactions_activator_item);
            this.mDescriptionView = (TextView) view.findViewById(C0393R.C0396id.guidedactions_item_description);
            this.mIconView = (ImageView) view.findViewById(C0393R.C0396id.guidedactions_item_icon);
            this.mCheckmarkView = (ImageView) view.findViewById(C0393R.C0396id.guidedactions_item_checkmark);
            this.mChevronView = (ImageView) view.findViewById(C0393R.C0396id.guidedactions_item_chevron);
            this.mIsSubAction = z;
            view.setAccessibilityDelegate(accessibilityDelegate);
        }

        public View getContentView() {
            return this.mContentView;
        }

        public TextView getTitleView() {
            return this.mTitleView;
        }

        public EditText getEditableTitleView() {
            TextView textView = this.mTitleView;
            if (textView instanceof EditText) {
                return (EditText) textView;
            }
            return null;
        }

        public TextView getDescriptionView() {
            return this.mDescriptionView;
        }

        public EditText getEditableDescriptionView() {
            TextView textView = this.mDescriptionView;
            if (textView instanceof EditText) {
                return (EditText) textView;
            }
            return null;
        }

        public ImageView getIconView() {
            return this.mIconView;
        }

        public ImageView getCheckmarkView() {
            return this.mCheckmarkView;
        }

        public ImageView getChevronView() {
            return this.mChevronView;
        }

        public boolean isInEditing() {
            return this.mEditingMode != 0;
        }

        public boolean isInEditingText() {
            int i = this.mEditingMode;
            return i == 1 || i == 2;
        }

        public boolean isInEditingTitle() {
            return this.mEditingMode == 1;
        }

        public boolean isInEditingDescription() {
            return this.mEditingMode == 2;
        }

        public boolean isInEditingActivatorView() {
            return this.mEditingMode == 3;
        }

        public View getEditingView() {
            int i = this.mEditingMode;
            if (i != 1) {
                if (i != 2) {
                    if (i != 3) {
                        return null;
                    }
                    return this.mActivatorView;
                }
                return this.mDescriptionView;
            }
            return this.mTitleView;
        }

        public boolean isSubAction() {
            return this.mIsSubAction;
        }

        public GuidedAction getAction() {
            return this.mAction;
        }

        void setActivated(boolean z) {
            this.mActivatorView.setActivated(z);
            if (this.itemView instanceof GuidedActionItemContainer) {
                ((GuidedActionItemContainer) this.itemView).setFocusOutAllowed(!z);
            }
        }

        @Override // androidx.leanback.widget.FacetProvider
        public Object getFacet(Class<?> cls) {
            if (cls == ItemAlignmentFacet.class) {
                return GuidedActionsStylist.sGuidedActionItemAlignFacet;
            }
            return null;
        }

        void press(boolean z) {
            int i;
            Animator animator = this.mPressAnimator;
            if (animator != null) {
                animator.cancel();
                this.mPressAnimator = null;
            }
            if (z) {
                i = C0393R.attr.guidedActionPressedAnimation;
            } else {
                i = C0393R.attr.guidedActionUnpressedAnimation;
            }
            Context context = this.itemView.getContext();
            TypedValue typedValue = new TypedValue();
            if (context.getTheme().resolveAttribute(i, typedValue, true)) {
                Animator loadAnimator = AnimatorInflater.loadAnimator(context, typedValue.resourceId);
                this.mPressAnimator = loadAnimator;
                loadAnimator.setTarget(this.itemView);
                this.mPressAnimator.addListener(new AnimatorListenerAdapter() { // from class: androidx.leanback.widget.GuidedActionsStylist.ViewHolder.2
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animator2) {
                        ViewHolder.this.mPressAnimator = null;
                    }
                });
                this.mPressAnimator.start();
            }
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        float f = layoutInflater.getContext().getTheme().obtainStyledAttributes(C0393R.styleable.LeanbackGuidedStepTheme).getFloat(C0393R.styleable.LeanbackGuidedStepTheme_guidedStepKeyline, 40.0f);
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(onProvideLayoutId(), viewGroup, false);
        this.mMainView = viewGroup2;
        this.mContentView = viewGroup2.findViewById(this.mButtonActions ? C0393R.C0396id.guidedactions_content2 : C0393R.C0396id.guidedactions_content);
        ViewGroup viewGroup3 = this.mMainView;
        if (viewGroup3 instanceof VerticalGridView) {
            this.mActionsGridView = (VerticalGridView) viewGroup3;
        } else {
            VerticalGridView verticalGridView = (VerticalGridView) viewGroup3.findViewById(this.mButtonActions ? C0393R.C0396id.guidedactions_list2 : C0393R.C0396id.guidedactions_list);
            this.mActionsGridView = verticalGridView;
            if (verticalGridView == null) {
                throw new IllegalStateException("No ListView exists.");
            }
            verticalGridView.setWindowAlignmentOffsetPercent(f);
            this.mActionsGridView.setWindowAlignment(0);
            if (!this.mButtonActions) {
                this.mSubActionsGridView = (VerticalGridView) this.mMainView.findViewById(C0393R.C0396id.guidedactions_sub_list);
                this.mSubActionsBackground = this.mMainView.findViewById(C0393R.C0396id.guidedactions_sub_list_background);
            }
        }
        this.mActionsGridView.setFocusable(false);
        this.mActionsGridView.setFocusableInTouchMode(false);
        Context context = this.mMainView.getContext();
        TypedValue typedValue = new TypedValue();
        this.mEnabledChevronAlpha = getFloat(context, typedValue, C0393R.attr.guidedActionEnabledChevronAlpha);
        this.mDisabledChevronAlpha = getFloat(context, typedValue, C0393R.attr.guidedActionDisabledChevronAlpha);
        this.mTitleMinLines = getInteger(context, typedValue, C0393R.attr.guidedActionTitleMinLines);
        this.mTitleMaxLines = getInteger(context, typedValue, C0393R.attr.guidedActionTitleMaxLines);
        this.mDescriptionMinLines = getInteger(context, typedValue, C0393R.attr.guidedActionDescriptionMinLines);
        this.mVerticalPadding = getDimension(context, typedValue, C0393R.attr.guidedActionVerticalPadding);
        this.mDisplayHeight = ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getHeight();
        this.mEnabledTextAlpha = getFloatValue(context.getResources(), typedValue, C0393R.dimen.lb_guidedactions_item_unselected_text_alpha);
        this.mDisabledTextAlpha = getFloatValue(context.getResources(), typedValue, C0393R.dimen.lb_guidedactions_item_disabled_text_alpha);
        this.mEnabledDescriptionAlpha = getFloatValue(context.getResources(), typedValue, C0393R.dimen.lb_guidedactions_item_unselected_description_text_alpha);
        this.mDisabledDescriptionAlpha = getFloatValue(context.getResources(), typedValue, C0393R.dimen.lb_guidedactions_item_disabled_description_text_alpha);
        this.mKeyLinePercent = GuidanceStylingRelativeLayout.getKeyLinePercent(context);
        View view = this.mContentView;
        if (view instanceof GuidedActionsRelativeLayout) {
            ((GuidedActionsRelativeLayout) view).setInterceptKeyEventListener(new GuidedActionsRelativeLayout.InterceptKeyEventListener() { // from class: androidx.leanback.widget.GuidedActionsStylist.1
                @Override // androidx.leanback.widget.GuidedActionsRelativeLayout.InterceptKeyEventListener
                public boolean onInterceptKeyEvent(KeyEvent keyEvent) {
                    if (keyEvent.getKeyCode() == 4 && keyEvent.getAction() == 1 && GuidedActionsStylist.this.mExpandedAction != null) {
                        if ((GuidedActionsStylist.this.mExpandedAction.hasSubActions() && GuidedActionsStylist.this.isBackKeyToCollapseSubActions()) || (GuidedActionsStylist.this.mExpandedAction.hasEditableActivatorView() && GuidedActionsStylist.this.isBackKeyToCollapseActivatorView())) {
                            GuidedActionsStylist.this.collapseAction(true);
                            return true;
                        }
                        return false;
                    }
                    return false;
                }
            });
        }
        return this.mMainView;
    }

    public void setAsButtonActions() {
        if (this.mMainView != null) {
            throw new IllegalStateException("setAsButtonActions() must be called before creating views");
        }
        this.mButtonActions = true;
    }

    public boolean isButtonActions() {
        return this.mButtonActions;
    }

    public void onDestroyView() {
        this.mExpandedAction = null;
        this.mExpandTransition = null;
        this.mActionsGridView = null;
        this.mSubActionsGridView = null;
        this.mSubActionsBackground = null;
        this.mContentView = null;
        this.mMainView = null;
    }

    public VerticalGridView getActionsGridView() {
        return this.mActionsGridView;
    }

    public VerticalGridView getSubActionsGridView() {
        return this.mSubActionsGridView;
    }

    public int onProvideLayoutId() {
        return this.mButtonActions ? C0393R.layout.lb_guidedbuttonactions : C0393R.layout.lb_guidedactions;
    }

    public int getItemViewType(GuidedAction guidedAction) {
        return guidedAction instanceof GuidedDatePickerAction ? 1 : 0;
    }

    public int onProvideItemLayoutId() {
        return C0393R.layout.lb_guidedactions_item;
    }

    public int onProvideItemLayoutId(int i) {
        if (i == 0) {
            return onProvideItemLayoutId();
        }
        if (i == 1) {
            return C0393R.layout.lb_guidedactions_datepicker_item;
        }
        throw new RuntimeException("ViewType " + i + " not supported in GuidedActionsStylist");
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(onProvideItemLayoutId(), viewGroup, false), viewGroup == this.mSubActionsGridView);
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        if (i == 0) {
            return onCreateViewHolder(viewGroup);
        }
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(onProvideItemLayoutId(i), viewGroup, false), viewGroup == this.mSubActionsGridView);
    }

    public void onBindViewHolder(ViewHolder viewHolder, GuidedAction guidedAction) {
        viewHolder.mAction = guidedAction;
        if (viewHolder.mTitleView != null) {
            viewHolder.mTitleView.setInputType(guidedAction.getInputType());
            viewHolder.mTitleView.setText(guidedAction.getTitle());
            viewHolder.mTitleView.setAlpha(guidedAction.isEnabled() ? this.mEnabledTextAlpha : this.mDisabledTextAlpha);
            viewHolder.mTitleView.setFocusable(false);
            viewHolder.mTitleView.setClickable(false);
            viewHolder.mTitleView.setLongClickable(false);
            if (Build.VERSION.SDK_INT >= 28) {
                if (guidedAction.isEditable()) {
                    viewHolder.mTitleView.setAutofillHints(guidedAction.getAutofillHints());
                } else {
                    viewHolder.mTitleView.setAutofillHints(null);
                }
            } else if (Build.VERSION.SDK_INT >= 26) {
                viewHolder.mTitleView.setImportantForAutofill(2);
            }
        }
        if (viewHolder.mDescriptionView != null) {
            viewHolder.mDescriptionView.setInputType(guidedAction.getDescriptionInputType());
            viewHolder.mDescriptionView.setText(guidedAction.getDescription());
            viewHolder.mDescriptionView.setVisibility(TextUtils.isEmpty(guidedAction.getDescription()) ? 8 : 0);
            viewHolder.mDescriptionView.setAlpha(guidedAction.isEnabled() ? this.mEnabledDescriptionAlpha : this.mDisabledDescriptionAlpha);
            viewHolder.mDescriptionView.setFocusable(false);
            viewHolder.mDescriptionView.setClickable(false);
            viewHolder.mDescriptionView.setLongClickable(false);
            if (Build.VERSION.SDK_INT >= 28) {
                if (guidedAction.isDescriptionEditable()) {
                    viewHolder.mDescriptionView.setAutofillHints(guidedAction.getAutofillHints());
                } else {
                    viewHolder.mDescriptionView.setAutofillHints(null);
                }
            } else if (Build.VERSION.SDK_INT >= 26) {
                viewHolder.mTitleView.setImportantForAutofill(2);
            }
        }
        if (viewHolder.mCheckmarkView != null) {
            onBindCheckMarkView(viewHolder, guidedAction);
        }
        setIcon(viewHolder.mIconView, guidedAction);
        if (guidedAction.hasMultilineDescription()) {
            if (viewHolder.mTitleView != null) {
                setMaxLines(viewHolder.mTitleView, this.mTitleMaxLines);
                viewHolder.mTitleView.setInputType(viewHolder.mTitleView.getInputType() | 131072);
                if (viewHolder.mDescriptionView != null) {
                    viewHolder.mDescriptionView.setInputType(viewHolder.mDescriptionView.getInputType() | 131072);
                    viewHolder.mDescriptionView.setMaxHeight(getDescriptionMaxHeight(viewHolder.mTitleView));
                }
            }
        } else {
            if (viewHolder.mTitleView != null) {
                setMaxLines(viewHolder.mTitleView, this.mTitleMinLines);
            }
            if (viewHolder.mDescriptionView != null) {
                setMaxLines(viewHolder.mDescriptionView, this.mDescriptionMinLines);
            }
        }
        if (viewHolder.mActivatorView != null) {
            onBindActivatorView(viewHolder, guidedAction);
        }
        setEditingMode(viewHolder, false, false);
        if (guidedAction.isFocusable()) {
            viewHolder.itemView.setFocusable(true);
            ((ViewGroup) viewHolder.itemView).setDescendantFocusability(131072);
        } else {
            viewHolder.itemView.setFocusable(false);
            ((ViewGroup) viewHolder.itemView).setDescendantFocusability(393216);
        }
        setupImeOptions(viewHolder, guidedAction);
        updateChevronAndVisibility(viewHolder);
    }

    public void openInEditMode(GuidedAction guidedAction) {
        final GuidedActionAdapter guidedActionAdapter = (GuidedActionAdapter) getActionsGridView().getAdapter();
        int indexOf = guidedActionAdapter.getActions().indexOf(guidedAction);
        if (indexOf < 0 || !guidedAction.isEditable()) {
            return;
        }
        getActionsGridView().setSelectedPosition(indexOf, new ViewHolderTask() { // from class: androidx.leanback.widget.GuidedActionsStylist.2
            @Override // androidx.leanback.widget.ViewHolderTask
            public void run(RecyclerView.ViewHolder viewHolder) {
                guidedActionAdapter.mGroup.openIme(guidedActionAdapter, (ViewHolder) viewHolder);
            }
        });
    }

    private static void setMaxLines(TextView textView, int i) {
        if (i == 1) {
            textView.setSingleLine(true);
            return;
        }
        textView.setSingleLine(false);
        textView.setMaxLines(i);
    }

    protected void setupImeOptions(ViewHolder viewHolder, GuidedAction guidedAction) {
        setupNextImeOptions(viewHolder.getEditableTitleView());
        setupNextImeOptions(viewHolder.getEditableDescriptionView());
    }

    private void setupNextImeOptions(EditText editText) {
        if (editText != null) {
            editText.setImeOptions(5);
        }
    }

    @Deprecated
    public void setEditingMode(ViewHolder viewHolder, GuidedAction guidedAction, boolean z) {
        if (z == viewHolder.isInEditing() || !isInExpandTransition()) {
            return;
        }
        onEditingModeChange(viewHolder, guidedAction, z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setEditingMode(ViewHolder viewHolder, boolean z) {
        setEditingMode(viewHolder, z, true);
    }

    void setEditingMode(ViewHolder viewHolder, boolean z, boolean z2) {
        if (z == viewHolder.isInEditing() || isInExpandTransition()) {
            return;
        }
        onEditingModeChange(viewHolder, z, z2);
    }

    protected void onEditingModeChange(ViewHolder viewHolder, boolean z, boolean z2) {
        GuidedAction action = viewHolder.getAction();
        TextView titleView = viewHolder.getTitleView();
        TextView descriptionView = viewHolder.getDescriptionView();
        if (z) {
            CharSequence editTitle = action.getEditTitle();
            if (titleView != null && editTitle != null) {
                titleView.setText(editTitle);
            }
            CharSequence editDescription = action.getEditDescription();
            if (descriptionView != null && editDescription != null) {
                descriptionView.setText(editDescription);
            }
            if (action.isDescriptionEditable()) {
                if (descriptionView != null) {
                    descriptionView.setVisibility(0);
                    descriptionView.setInputType(action.getDescriptionEditInputType());
                    descriptionView.requestFocusFromTouch();
                }
                viewHolder.mEditingMode = 2;
            } else if (action.isEditable()) {
                if (titleView != null) {
                    titleView.setInputType(action.getEditInputType());
                    titleView.requestFocusFromTouch();
                }
                viewHolder.mEditingMode = 1;
            } else if (viewHolder.mActivatorView != null) {
                onEditActivatorView(viewHolder, z, z2);
                viewHolder.mEditingMode = 3;
            }
        } else {
            if (titleView != null) {
                titleView.setText(action.getTitle());
            }
            if (descriptionView != null) {
                descriptionView.setText(action.getDescription());
            }
            if (viewHolder.mEditingMode == 2) {
                if (descriptionView != null) {
                    descriptionView.setVisibility(TextUtils.isEmpty(action.getDescription()) ? 8 : 0);
                    descriptionView.setInputType(action.getDescriptionInputType());
                }
            } else if (viewHolder.mEditingMode == 1) {
                if (titleView != null) {
                    titleView.setInputType(action.getInputType());
                }
            } else if (viewHolder.mEditingMode == 3 && viewHolder.mActivatorView != null) {
                onEditActivatorView(viewHolder, z, z2);
            }
            viewHolder.mEditingMode = 0;
        }
        onEditingModeChange(viewHolder, action, z);
    }

    public void onAnimateItemPressed(ViewHolder viewHolder, boolean z) {
        viewHolder.press(z);
    }

    public void onAnimateItemPressedCancelled(ViewHolder viewHolder) {
        viewHolder.press(false);
    }

    public void onAnimateItemChecked(ViewHolder viewHolder, boolean z) {
        if (viewHolder.mCheckmarkView instanceof Checkable) {
            ((Checkable) viewHolder.mCheckmarkView).setChecked(z);
        }
    }

    public void onBindCheckMarkView(ViewHolder viewHolder, GuidedAction guidedAction) {
        if (guidedAction.getCheckSetId() != 0) {
            viewHolder.mCheckmarkView.setVisibility(0);
            int i = guidedAction.getCheckSetId() == -1 ? 16843290 : 16843289;
            Context context = viewHolder.mCheckmarkView.getContext();
            TypedValue typedValue = new TypedValue();
            viewHolder.mCheckmarkView.setImageDrawable(context.getTheme().resolveAttribute(i, typedValue, true) ? ContextCompat.getDrawable(context, typedValue.resourceId) : null);
            if (viewHolder.mCheckmarkView instanceof Checkable) {
                ((Checkable) viewHolder.mCheckmarkView).setChecked(guidedAction.isChecked());
                return;
            }
            return;
        }
        viewHolder.mCheckmarkView.setVisibility(8);
    }

    public void onBindActivatorView(ViewHolder viewHolder, GuidedAction guidedAction) {
        if (guidedAction instanceof GuidedDatePickerAction) {
            GuidedDatePickerAction guidedDatePickerAction = (GuidedDatePickerAction) guidedAction;
            DatePicker datePicker = (DatePicker) viewHolder.mActivatorView;
            datePicker.setDatePickerFormat(guidedDatePickerAction.getDatePickerFormat());
            if (guidedDatePickerAction.getMinDate() != Long.MIN_VALUE) {
                datePicker.setMinDate(guidedDatePickerAction.getMinDate());
            }
            if (guidedDatePickerAction.getMaxDate() != LocationRequestCompat.PASSIVE_INTERVAL) {
                datePicker.setMaxDate(guidedDatePickerAction.getMaxDate());
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(guidedDatePickerAction.getDate());
            datePicker.setDate(calendar.get(1), calendar.get(2), calendar.get(5), false);
        }
    }

    public boolean onUpdateActivatorView(ViewHolder viewHolder, GuidedAction guidedAction) {
        if (guidedAction instanceof GuidedDatePickerAction) {
            GuidedDatePickerAction guidedDatePickerAction = (GuidedDatePickerAction) guidedAction;
            DatePicker datePicker = (DatePicker) viewHolder.mActivatorView;
            if (guidedDatePickerAction.getDate() != datePicker.getDate()) {
                guidedDatePickerAction.setDate(datePicker.getDate());
                return true;
            }
            return false;
        }
        return false;
    }

    public void setEditListener(GuidedActionAdapter.EditListener editListener) {
        this.mEditListener = editListener;
    }

    void onEditActivatorView(final ViewHolder viewHolder, boolean z, boolean z2) {
        GuidedActionAdapter.EditListener editListener;
        if (z) {
            startExpanded(viewHolder, z2);
            viewHolder.itemView.setFocusable(false);
            viewHolder.mActivatorView.requestFocus();
            viewHolder.mActivatorView.setOnClickListener(new View.OnClickListener() { // from class: androidx.leanback.widget.GuidedActionsStylist.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (GuidedActionsStylist.this.isInExpandTransition()) {
                        return;
                    }
                    ((GuidedActionAdapter) GuidedActionsStylist.this.getActionsGridView().getAdapter()).performOnActionClick(viewHolder);
                }
            });
            return;
        }
        if (onUpdateActivatorView(viewHolder, viewHolder.getAction()) && (editListener = this.mEditListener) != null) {
            editListener.onGuidedActionEditedAndProceed(viewHolder.getAction());
        }
        viewHolder.itemView.setFocusable(true);
        viewHolder.itemView.requestFocus();
        startExpanded(null, z2);
        viewHolder.mActivatorView.setOnClickListener(null);
        viewHolder.mActivatorView.setClickable(false);
    }

    public void onBindChevronView(ViewHolder viewHolder, GuidedAction guidedAction) {
        boolean hasNext = guidedAction.hasNext();
        boolean hasSubActions = guidedAction.hasSubActions();
        if (hasNext || hasSubActions) {
            viewHolder.mChevronView.setVisibility(0);
            viewHolder.mChevronView.setAlpha(guidedAction.isEnabled() ? this.mEnabledChevronAlpha : this.mDisabledChevronAlpha);
            if (hasNext) {
                ViewGroup viewGroup = this.mMainView;
                viewHolder.mChevronView.setRotation((viewGroup == null || viewGroup.getLayoutDirection() != 1) ? 0.0f : 180.0f);
                return;
            } else if (guidedAction == this.mExpandedAction) {
                viewHolder.mChevronView.setRotation(270.0f);
                return;
            } else {
                viewHolder.mChevronView.setRotation(90.0f);
                return;
            }
        }
        viewHolder.mChevronView.setVisibility(8);
    }

    @Deprecated
    public void setExpandedViewHolder(ViewHolder viewHolder) {
        expandAction(viewHolder == null ? null : viewHolder.getAction(), isExpandTransitionSupported());
    }

    public boolean isInExpandTransition() {
        return this.mExpandTransition != null;
    }

    public boolean isExpandTransitionSupported() {
        return Build.VERSION.SDK_INT >= 21;
    }

    @Deprecated
    public void startExpandedTransition(ViewHolder viewHolder) {
        expandAction(viewHolder == null ? null : viewHolder.getAction(), isExpandTransitionSupported());
    }

    public final void setBackKeyToCollapseSubActions(boolean z) {
        this.mBackToCollapseSubActions = z;
    }

    public final boolean isBackKeyToCollapseSubActions() {
        return this.mBackToCollapseSubActions;
    }

    public final void setBackKeyToCollapseActivatorView(boolean z) {
        this.mBackToCollapseActivatorView = z;
    }

    public final boolean isBackKeyToCollapseActivatorView() {
        return this.mBackToCollapseActivatorView;
    }

    public void expandAction(GuidedAction guidedAction, boolean z) {
        int indexOf;
        if (isInExpandTransition() || this.mExpandedAction != null || (indexOf = ((GuidedActionAdapter) getActionsGridView().getAdapter()).indexOf(guidedAction)) < 0) {
            return;
        }
        if (!(isExpandTransitionSupported() && z)) {
            getActionsGridView().setSelectedPosition(indexOf, new ViewHolderTask() { // from class: androidx.leanback.widget.GuidedActionsStylist.4
                @Override // androidx.leanback.widget.ViewHolderTask
                public void run(RecyclerView.ViewHolder viewHolder) {
                    ViewHolder viewHolder2 = (ViewHolder) viewHolder;
                    if (viewHolder2.getAction().hasEditableActivatorView()) {
                        GuidedActionsStylist.this.setEditingMode(viewHolder2, true, false);
                    } else {
                        GuidedActionsStylist.this.onUpdateExpandedViewHolder(viewHolder2);
                    }
                }
            });
            if (guidedAction.hasSubActions()) {
                onUpdateSubActionsGridView(guidedAction, true);
                return;
            }
            return;
        }
        getActionsGridView().setSelectedPosition(indexOf, new ViewHolderTask() { // from class: androidx.leanback.widget.GuidedActionsStylist.5
            @Override // androidx.leanback.widget.ViewHolderTask
            public void run(RecyclerView.ViewHolder viewHolder) {
                ViewHolder viewHolder2 = (ViewHolder) viewHolder;
                if (viewHolder2.getAction().hasEditableActivatorView()) {
                    GuidedActionsStylist.this.setEditingMode(viewHolder2, true, true);
                } else {
                    GuidedActionsStylist.this.startExpanded(viewHolder2, true);
                }
            }
        });
    }

    public void collapseAction(boolean z) {
        if (isInExpandTransition() || this.mExpandedAction == null) {
            return;
        }
        boolean z2 = isExpandTransitionSupported() && z;
        int indexOf = ((GuidedActionAdapter) getActionsGridView().getAdapter()).indexOf(this.mExpandedAction);
        if (indexOf < 0) {
            return;
        }
        if (this.mExpandedAction.hasEditableActivatorView()) {
            setEditingMode((ViewHolder) getActionsGridView().findViewHolderForPosition(indexOf), false, z2);
        } else {
            startExpanded(null, z2);
        }
    }

    int getKeyLine() {
        return (int) ((this.mKeyLinePercent * this.mActionsGridView.getHeight()) / 100.0f);
    }

    void startExpanded(ViewHolder viewHolder, boolean z) {
        ViewHolder viewHolder2;
        float height;
        int childCount = this.mActionsGridView.getChildCount();
        int i = 0;
        while (true) {
            if (i >= childCount) {
                viewHolder2 = null;
                break;
            }
            VerticalGridView verticalGridView = this.mActionsGridView;
            viewHolder2 = (ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i));
            if ((viewHolder == null && viewHolder2.itemView.getVisibility() == 0) || (viewHolder != null && viewHolder2.getAction() == viewHolder.getAction())) {
                break;
            }
            i++;
        }
        if (viewHolder2 == null) {
            return;
        }
        boolean z2 = viewHolder != null;
        boolean hasSubActions = viewHolder2.getAction().hasSubActions();
        if (z) {
            Object createTransitionSet = TransitionHelper.createTransitionSet(false);
            if (hasSubActions) {
                height = viewHolder2.itemView.getHeight();
            } else {
                height = viewHolder2.itemView.getHeight() * 0.5f;
            }
            Object createFadeAndShortSlide = TransitionHelper.createFadeAndShortSlide(112, height);
            TransitionHelper.setEpicenterCallback(createFadeAndShortSlide, new TransitionEpicenterCallback() { // from class: androidx.leanback.widget.GuidedActionsStylist.6
                Rect mRect = new Rect();

                @Override // androidx.leanback.transition.TransitionEpicenterCallback
                public Rect onGetEpicenter(Object obj) {
                    int keyLine = GuidedActionsStylist.this.getKeyLine();
                    this.mRect.set(0, keyLine, 0, keyLine);
                    return this.mRect;
                }
            });
            Object createChangeTransform = TransitionHelper.createChangeTransform();
            Object createChangeBounds = TransitionHelper.createChangeBounds(false);
            Object createFadeTransition = TransitionHelper.createFadeTransition(3);
            Object createChangeBounds2 = TransitionHelper.createChangeBounds(false);
            if (viewHolder == null) {
                TransitionHelper.setStartDelay(createFadeAndShortSlide, 150L);
                TransitionHelper.setStartDelay(createChangeTransform, 100L);
                TransitionHelper.setStartDelay(createChangeBounds, 100L);
                TransitionHelper.setStartDelay(createChangeBounds2, 100L);
            } else {
                TransitionHelper.setStartDelay(createFadeTransition, 100L);
                TransitionHelper.setStartDelay(createChangeBounds2, 50L);
                TransitionHelper.setStartDelay(createChangeTransform, 50L);
                TransitionHelper.setStartDelay(createChangeBounds, 50L);
            }
            for (int i2 = 0; i2 < childCount; i2++) {
                VerticalGridView verticalGridView2 = this.mActionsGridView;
                ViewHolder viewHolder3 = (ViewHolder) verticalGridView2.getChildViewHolder(verticalGridView2.getChildAt(i2));
                if (viewHolder3 != viewHolder2) {
                    TransitionHelper.include(createFadeAndShortSlide, viewHolder3.itemView);
                    TransitionHelper.exclude(createFadeTransition, viewHolder3.itemView, true);
                } else if (hasSubActions) {
                    TransitionHelper.include(createChangeTransform, viewHolder3.itemView);
                    TransitionHelper.include(createChangeBounds, viewHolder3.itemView);
                }
            }
            TransitionHelper.include(createChangeBounds2, this.mSubActionsGridView);
            TransitionHelper.include(createChangeBounds2, this.mSubActionsBackground);
            TransitionHelper.addTransition(createTransitionSet, createFadeAndShortSlide);
            if (hasSubActions) {
                TransitionHelper.addTransition(createTransitionSet, createChangeTransform);
                TransitionHelper.addTransition(createTransitionSet, createChangeBounds);
            }
            TransitionHelper.addTransition(createTransitionSet, createFadeTransition);
            TransitionHelper.addTransition(createTransitionSet, createChangeBounds2);
            this.mExpandTransition = createTransitionSet;
            TransitionHelper.addTransitionListener(createTransitionSet, new TransitionListener() { // from class: androidx.leanback.widget.GuidedActionsStylist.7
                @Override // androidx.leanback.transition.TransitionListener
                public void onTransitionEnd(Object obj) {
                    GuidedActionsStylist.this.mExpandTransition = null;
                }
            });
            if (z2 && hasSubActions) {
                int bottom = viewHolder.itemView.getBottom();
                VerticalGridView verticalGridView3 = this.mSubActionsGridView;
                verticalGridView3.offsetTopAndBottom(bottom - verticalGridView3.getTop());
                View view = this.mSubActionsBackground;
                view.offsetTopAndBottom(bottom - view.getTop());
            }
            TransitionHelper.beginDelayedTransition(this.mMainView, this.mExpandTransition);
        }
        onUpdateExpandedViewHolder(viewHolder);
        if (hasSubActions) {
            onUpdateSubActionsGridView(viewHolder2.getAction(), z2);
        }
    }

    public boolean isSubActionsExpanded() {
        GuidedAction guidedAction = this.mExpandedAction;
        return guidedAction != null && guidedAction.hasSubActions();
    }

    public boolean isExpanded() {
        return this.mExpandedAction != null;
    }

    public GuidedAction getExpandedAction() {
        return this.mExpandedAction;
    }

    public void onUpdateExpandedViewHolder(ViewHolder viewHolder) {
        if (viewHolder == null) {
            this.mExpandedAction = null;
            this.mActionsGridView.setPruneChild(true);
        } else if (viewHolder.getAction() != this.mExpandedAction) {
            this.mExpandedAction = viewHolder.getAction();
            this.mActionsGridView.setPruneChild(false);
        }
        this.mActionsGridView.setAnimateChildLayout(false);
        int childCount = this.mActionsGridView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            VerticalGridView verticalGridView = this.mActionsGridView;
            updateChevronAndVisibility((ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i)));
        }
    }

    void onUpdateSubActionsGridView(GuidedAction guidedAction, boolean z) {
        VerticalGridView verticalGridView = this.mSubActionsGridView;
        if (verticalGridView != null) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) verticalGridView.getLayoutParams();
            GuidedActionAdapter guidedActionAdapter = (GuidedActionAdapter) this.mSubActionsGridView.getAdapter();
            if (z) {
                marginLayoutParams.topMargin = -2;
                marginLayoutParams.height = -1;
                this.mSubActionsGridView.setLayoutParams(marginLayoutParams);
                this.mSubActionsGridView.setVisibility(0);
                this.mSubActionsBackground.setVisibility(0);
                this.mSubActionsGridView.requestFocus();
                guidedActionAdapter.setActions(guidedAction.getSubActions());
                return;
            }
            marginLayoutParams.topMargin = this.mActionsGridView.getLayoutManager().findViewByPosition(((GuidedActionAdapter) this.mActionsGridView.getAdapter()).indexOf(guidedAction)).getBottom();
            marginLayoutParams.height = 0;
            this.mSubActionsGridView.setVisibility(4);
            this.mSubActionsBackground.setVisibility(4);
            this.mSubActionsGridView.setLayoutParams(marginLayoutParams);
            guidedActionAdapter.setActions(Collections.emptyList());
            this.mActionsGridView.requestFocus();
        }
    }

    private void updateChevronAndVisibility(ViewHolder viewHolder) {
        if (!viewHolder.isSubAction()) {
            if (this.mExpandedAction == null) {
                viewHolder.itemView.setVisibility(0);
                viewHolder.itemView.setTranslationY(0.0f);
                if (viewHolder.mActivatorView != null) {
                    viewHolder.setActivated(false);
                }
            } else if (viewHolder.getAction() == this.mExpandedAction) {
                viewHolder.itemView.setVisibility(0);
                if (viewHolder.getAction().hasSubActions()) {
                    viewHolder.itemView.setTranslationY(getKeyLine() - viewHolder.itemView.getBottom());
                } else if (viewHolder.mActivatorView != null) {
                    viewHolder.itemView.setTranslationY(0.0f);
                    viewHolder.setActivated(true);
                }
            } else {
                viewHolder.itemView.setVisibility(4);
                viewHolder.itemView.setTranslationY(0.0f);
            }
        }
        if (viewHolder.mChevronView != null) {
            onBindChevronView(viewHolder, viewHolder.getAction());
        }
    }

    private static float getFloat(Context context, TypedValue typedValue, int i) {
        context.getTheme().resolveAttribute(i, typedValue, true);
        return typedValue.getFloat();
    }

    private static float getFloatValue(Resources resources, TypedValue typedValue, int i) {
        resources.getValue(i, typedValue, true);
        return typedValue.getFloat();
    }

    private static int getInteger(Context context, TypedValue typedValue, int i) {
        context.getTheme().resolveAttribute(i, typedValue, true);
        return context.getResources().getInteger(typedValue.resourceId);
    }

    private static int getDimension(Context context, TypedValue typedValue, int i) {
        context.getTheme().resolveAttribute(i, typedValue, true);
        return context.getResources().getDimensionPixelSize(typedValue.resourceId);
    }

    private boolean setIcon(ImageView imageView, GuidedAction guidedAction) {
        Drawable drawable;
        if (imageView != null) {
            drawable = guidedAction.getIcon();
            if (drawable != null) {
                imageView.setImageLevel(drawable.getLevel());
                imageView.setImageDrawable(drawable);
                imageView.setVisibility(0);
            } else {
                imageView.setVisibility(8);
            }
        } else {
            drawable = null;
        }
        return drawable != null;
    }

    private int getDescriptionMaxHeight(TextView textView) {
        return (this.mDisplayHeight - (this.mVerticalPadding * 2)) - ((this.mTitleMaxLines * 2) * textView.getLineHeight());
    }
}
