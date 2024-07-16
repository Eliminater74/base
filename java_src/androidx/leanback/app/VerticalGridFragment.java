package androidx.leanback.app;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.leanback.C0393R;
import androidx.leanback.transition.TransitionHelper;
import androidx.leanback.util.StateMachine;
import androidx.leanback.widget.BrowseFrameLayout;
import androidx.leanback.widget.ObjectAdapter;
import androidx.leanback.widget.OnChildLaidOutListener;
import androidx.leanback.widget.OnItemViewClickedListener;
import androidx.leanback.widget.OnItemViewSelectedListener;
import androidx.leanback.widget.Presenter;
import androidx.leanback.widget.Row;
import androidx.leanback.widget.RowPresenter;
import androidx.leanback.widget.VerticalGridPresenter;
@Deprecated
/* loaded from: classes.dex */
public class VerticalGridFragment extends BaseFragment {
    static final boolean DEBUG = false;
    static final String TAG = "VerticalGF";
    private ObjectAdapter mAdapter;
    private VerticalGridPresenter mGridPresenter;
    VerticalGridPresenter.ViewHolder mGridViewHolder;
    private OnItemViewClickedListener mOnItemViewClickedListener;
    OnItemViewSelectedListener mOnItemViewSelectedListener;
    private Object mSceneAfterEntranceTransition;
    private int mSelectedPosition = -1;
    final StateMachine.State STATE_SET_ENTRANCE_START_STATE = new StateMachine.State("SET_ENTRANCE_START_STATE") { // from class: androidx.leanback.app.VerticalGridFragment.1
        @Override // androidx.leanback.util.StateMachine.State
        public void run() {
            VerticalGridFragment.this.setEntranceTransitionState(false);
        }
    };
    private final OnItemViewSelectedListener mViewSelectedListener = new OnItemViewSelectedListener() { // from class: androidx.leanback.app.VerticalGridFragment.2
        @Override // androidx.leanback.widget.BaseOnItemViewSelectedListener
        public void onItemSelected(Presenter.ViewHolder viewHolder, Object obj, RowPresenter.ViewHolder viewHolder2, Row row) {
            VerticalGridFragment.this.gridOnItemSelected(VerticalGridFragment.this.mGridViewHolder.getGridView().getSelectedPosition());
            if (VerticalGridFragment.this.mOnItemViewSelectedListener != null) {
                VerticalGridFragment.this.mOnItemViewSelectedListener.onItemSelected(viewHolder, obj, viewHolder2, row);
            }
        }
    };
    private final OnChildLaidOutListener mChildLaidOutListener = new OnChildLaidOutListener() { // from class: androidx.leanback.app.VerticalGridFragment.3
        @Override // androidx.leanback.widget.OnChildLaidOutListener
        public void onChildLaidOut(ViewGroup viewGroup, View view, int i, long j) {
            if (i == 0) {
                VerticalGridFragment.this.showOrHideTitle();
            }
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.leanback.app.BaseFragment
    public void createStateMachineStates() {
        super.createStateMachineStates();
        this.mStateMachine.addState(this.STATE_SET_ENTRANCE_START_STATE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.leanback.app.BaseFragment
    public void createStateMachineTransitions() {
        super.createStateMachineTransitions();
        this.mStateMachine.addTransition(this.STATE_ENTRANCE_ON_PREPARED, this.STATE_SET_ENTRANCE_START_STATE, this.EVT_ON_CREATEVIEW);
    }

    public void setGridPresenter(VerticalGridPresenter verticalGridPresenter) {
        if (verticalGridPresenter == null) {
            throw new IllegalArgumentException("Grid presenter may not be null");
        }
        this.mGridPresenter = verticalGridPresenter;
        verticalGridPresenter.setOnItemViewSelectedListener(this.mViewSelectedListener);
        OnItemViewClickedListener onItemViewClickedListener = this.mOnItemViewClickedListener;
        if (onItemViewClickedListener != null) {
            this.mGridPresenter.setOnItemViewClickedListener(onItemViewClickedListener);
        }
    }

    public VerticalGridPresenter getGridPresenter() {
        return this.mGridPresenter;
    }

    public void setAdapter(ObjectAdapter objectAdapter) {
        this.mAdapter = objectAdapter;
        updateAdapter();
    }

    public ObjectAdapter getAdapter() {
        return this.mAdapter;
    }

    public void setOnItemViewSelectedListener(OnItemViewSelectedListener onItemViewSelectedListener) {
        this.mOnItemViewSelectedListener = onItemViewSelectedListener;
    }

    void gridOnItemSelected(int i) {
        if (i != this.mSelectedPosition) {
            this.mSelectedPosition = i;
            showOrHideTitle();
        }
    }

    void showOrHideTitle() {
        if (this.mGridViewHolder.getGridView().findViewHolderForAdapterPosition(this.mSelectedPosition) == null) {
            return;
        }
        if (!this.mGridViewHolder.getGridView().hasPreviousViewInSameRow(this.mSelectedPosition)) {
            showTitle(true);
        } else {
            showTitle(false);
        }
    }

    public void setOnItemViewClickedListener(OnItemViewClickedListener onItemViewClickedListener) {
        this.mOnItemViewClickedListener = onItemViewClickedListener;
        VerticalGridPresenter verticalGridPresenter = this.mGridPresenter;
        if (verticalGridPresenter != null) {
            verticalGridPresenter.setOnItemViewClickedListener(onItemViewClickedListener);
        }
    }

    public OnItemViewClickedListener getOnItemViewClickedListener() {
        return this.mOnItemViewClickedListener;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(C0393R.layout.lb_vertical_grid_fragment, viewGroup, false);
        installTitleView(layoutInflater, (ViewGroup) viewGroup2.findViewById(C0393R.C0396id.grid_frame), bundle);
        getProgressBarManager().setRootView(viewGroup2);
        ViewGroup viewGroup3 = (ViewGroup) viewGroup2.findViewById(C0393R.C0396id.browse_grid_dock);
        VerticalGridPresenter.ViewHolder onCreateViewHolder = this.mGridPresenter.onCreateViewHolder(viewGroup3);
        this.mGridViewHolder = onCreateViewHolder;
        viewGroup3.addView(onCreateViewHolder.view);
        this.mGridViewHolder.getGridView().setOnChildLaidOutListener(this.mChildLaidOutListener);
        this.mSceneAfterEntranceTransition = TransitionHelper.createScene(viewGroup3, new Runnable() { // from class: androidx.leanback.app.VerticalGridFragment.4
            @Override // java.lang.Runnable
            public void run() {
                VerticalGridFragment.this.setEntranceTransitionState(true);
            }
        });
        updateAdapter();
        return viewGroup2;
    }

    private void setupFocusSearchListener() {
        ((BrowseFrameLayout) getView().findViewById(C0393R.C0396id.grid_frame)).setOnFocusSearchListener(getTitleHelper().getOnFocusSearchListener());
    }

    @Override // androidx.leanback.app.BrandedFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        setupFocusSearchListener();
    }

    @Override // androidx.leanback.app.BaseFragment, androidx.leanback.app.BrandedFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mGridViewHolder.getGridView().swapAdapter(null, true);
        this.mGridViewHolder = null;
        this.mSceneAfterEntranceTransition = null;
    }

    public void setSelectedPosition(int i) {
        this.mSelectedPosition = i;
        VerticalGridPresenter.ViewHolder viewHolder = this.mGridViewHolder;
        if (viewHolder == null || viewHolder.getGridView().getAdapter() == null) {
            return;
        }
        this.mGridViewHolder.getGridView().setSelectedPositionSmooth(i);
    }

    private void updateAdapter() {
        VerticalGridPresenter.ViewHolder viewHolder = this.mGridViewHolder;
        if (viewHolder != null) {
            this.mGridPresenter.onBindViewHolder(viewHolder, this.mAdapter);
            if (this.mSelectedPosition != -1) {
                this.mGridViewHolder.getGridView().setSelectedPosition(this.mSelectedPosition);
            }
        }
    }

    @Override // androidx.leanback.app.BaseFragment
    protected Object createEntranceTransition() {
        return TransitionHelper.loadTransition(FragmentUtil.getContext(this), C0393R.C0397transition.lb_vertical_grid_entrance_transition);
    }

    @Override // androidx.leanback.app.BaseFragment
    protected void runEntranceTransition(Object obj) {
        TransitionHelper.runTransition(this.mSceneAfterEntranceTransition, obj);
    }

    void setEntranceTransitionState(boolean z) {
        this.mGridPresenter.setEntranceTransitionState(this.mGridViewHolder, z);
    }
}
