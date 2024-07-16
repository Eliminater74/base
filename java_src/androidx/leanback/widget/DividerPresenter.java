package androidx.leanback.widget;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.leanback.C0393R;
import androidx.leanback.widget.Presenter;
/* loaded from: classes.dex */
public class DividerPresenter extends Presenter {
    private final int mLayoutResourceId;

    @Override // androidx.leanback.widget.Presenter
    public void onBindViewHolder(Presenter.ViewHolder viewHolder, Object obj) {
    }

    @Override // androidx.leanback.widget.Presenter
    public void onUnbindViewHolder(Presenter.ViewHolder viewHolder) {
    }

    public DividerPresenter() {
        this(C0393R.layout.lb_divider);
    }

    public DividerPresenter(int i) {
        this.mLayoutResourceId = i;
    }

    @Override // androidx.leanback.widget.Presenter
    public Presenter.ViewHolder onCreateViewHolder(ViewGroup viewGroup) {
        return new Presenter.ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(this.mLayoutResourceId, viewGroup, false));
    }
}
