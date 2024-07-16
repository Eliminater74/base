package androidx.leanback.widget;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import androidx.leanback.C0393R;
import androidx.leanback.widget.Presenter;
/* loaded from: classes.dex */
class ActionPresenterSelector extends PresenterSelector {
    private final Presenter mOneLineActionPresenter;
    private final Presenter[] mPresenters;
    private final Presenter mTwoLineActionPresenter;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActionPresenterSelector() {
        OneLineActionPresenter oneLineActionPresenter = new OneLineActionPresenter();
        this.mOneLineActionPresenter = oneLineActionPresenter;
        TwoLineActionPresenter twoLineActionPresenter = new TwoLineActionPresenter();
        this.mTwoLineActionPresenter = twoLineActionPresenter;
        this.mPresenters = new Presenter[]{oneLineActionPresenter, twoLineActionPresenter};
    }

    @Override // androidx.leanback.widget.PresenterSelector
    public Presenter getPresenter(Object obj) {
        if (TextUtils.isEmpty(((Action) obj).getLabel2())) {
            return this.mOneLineActionPresenter;
        }
        return this.mTwoLineActionPresenter;
    }

    @Override // androidx.leanback.widget.PresenterSelector
    public Presenter[] getPresenters() {
        return this.mPresenters;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class ActionViewHolder extends Presenter.ViewHolder {
        Action mAction;
        Button mButton;
        int mLayoutDirection;

        public ActionViewHolder(View view, int i) {
            super(view);
            this.mButton = (Button) view.findViewById(C0393R.C0396id.lb_action_button);
            this.mLayoutDirection = i;
        }
    }

    /* loaded from: classes.dex */
    static abstract class ActionPresenter extends Presenter {
        ActionPresenter() {
        }

        @Override // androidx.leanback.widget.Presenter
        public void onBindViewHolder(Presenter.ViewHolder viewHolder, Object obj) {
            Action action = (Action) obj;
            ActionViewHolder actionViewHolder = (ActionViewHolder) viewHolder;
            actionViewHolder.mAction = action;
            Drawable icon = action.getIcon();
            if (icon != null) {
                actionViewHolder.view.setPaddingRelative(actionViewHolder.view.getResources().getDimensionPixelSize(C0393R.dimen.lb_action_with_icon_padding_start), 0, actionViewHolder.view.getResources().getDimensionPixelSize(C0393R.dimen.lb_action_with_icon_padding_end), 0);
            } else {
                int dimensionPixelSize = actionViewHolder.view.getResources().getDimensionPixelSize(C0393R.dimen.lb_action_padding_horizontal);
                actionViewHolder.view.setPaddingRelative(dimensionPixelSize, 0, dimensionPixelSize, 0);
            }
            if (actionViewHolder.mLayoutDirection == 1) {
                actionViewHolder.mButton.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, icon, (Drawable) null);
            } else {
                actionViewHolder.mButton.setCompoundDrawablesWithIntrinsicBounds(icon, (Drawable) null, (Drawable) null, (Drawable) null);
            }
        }

        @Override // androidx.leanback.widget.Presenter
        public void onUnbindViewHolder(Presenter.ViewHolder viewHolder) {
            ActionViewHolder actionViewHolder = (ActionViewHolder) viewHolder;
            actionViewHolder.mButton.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, (Drawable) null, (Drawable) null);
            actionViewHolder.view.setPadding(0, 0, 0, 0);
            actionViewHolder.mAction = null;
        }
    }

    /* loaded from: classes.dex */
    static class OneLineActionPresenter extends ActionPresenter {
        OneLineActionPresenter() {
        }

        @Override // androidx.leanback.widget.Presenter
        public Presenter.ViewHolder onCreateViewHolder(ViewGroup viewGroup) {
            return new ActionViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(C0393R.layout.lb_action_1_line, viewGroup, false), viewGroup.getLayoutDirection());
        }

        @Override // androidx.leanback.widget.ActionPresenterSelector.ActionPresenter, androidx.leanback.widget.Presenter
        public void onBindViewHolder(Presenter.ViewHolder viewHolder, Object obj) {
            super.onBindViewHolder(viewHolder, obj);
            ((ActionViewHolder) viewHolder).mButton.setText(((Action) obj).getLabel1());
        }
    }

    /* loaded from: classes.dex */
    static class TwoLineActionPresenter extends ActionPresenter {
        TwoLineActionPresenter() {
        }

        @Override // androidx.leanback.widget.Presenter
        public Presenter.ViewHolder onCreateViewHolder(ViewGroup viewGroup) {
            return new ActionViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(C0393R.layout.lb_action_2_lines, viewGroup, false), viewGroup.getLayoutDirection());
        }

        @Override // androidx.leanback.widget.ActionPresenterSelector.ActionPresenter, androidx.leanback.widget.Presenter
        public void onBindViewHolder(Presenter.ViewHolder viewHolder, Object obj) {
            super.onBindViewHolder(viewHolder, obj);
            Action action = (Action) obj;
            ActionViewHolder actionViewHolder = (ActionViewHolder) viewHolder;
            CharSequence label1 = action.getLabel1();
            CharSequence label2 = action.getLabel2();
            if (TextUtils.isEmpty(label1)) {
                actionViewHolder.mButton.setText(label2);
            } else if (TextUtils.isEmpty(label2)) {
                actionViewHolder.mButton.setText(label1);
            } else {
                actionViewHolder.mButton.setText(((Object) label1) + "\n" + ((Object) label2));
            }
        }
    }
}
