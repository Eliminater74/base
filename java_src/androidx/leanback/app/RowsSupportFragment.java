package androidx.leanback.app;

import android.animation.TimeAnimator;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import androidx.leanback.C0393R;
import androidx.leanback.app.BrowseSupportFragment;
import androidx.leanback.widget.BaseOnItemViewClickedListener;
import androidx.leanback.widget.BaseOnItemViewSelectedListener;
import androidx.leanback.widget.HorizontalGridView;
import androidx.leanback.widget.ItemBridgeAdapter;
import androidx.leanback.widget.ListRowPresenter;
import androidx.leanback.widget.ObjectAdapter;
import androidx.leanback.widget.OnItemViewClickedListener;
import androidx.leanback.widget.OnItemViewSelectedListener;
import androidx.leanback.widget.Presenter;
import androidx.leanback.widget.RowPresenter;
import androidx.leanback.widget.VerticalGridView;
import androidx.leanback.widget.ViewHolderTask;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class RowsSupportFragment extends BaseRowSupportFragment implements BrowseSupportFragment.MainFragmentRowsAdapterProvider, BrowseSupportFragment.MainFragmentAdapterProvider {
    static final int ALIGN_TOP_NOT_SET = Integer.MIN_VALUE;
    static final boolean DEBUG = false;
    static final String TAG = "RowsSupportFragment";
    ItemBridgeAdapter.AdapterListener mExternalAdapterListener;
    boolean mFreezeRows;
    private MainFragmentAdapter mMainFragmentAdapter;
    private MainFragmentRowsAdapter mMainFragmentRowsAdapter;
    BaseOnItemViewClickedListener mOnItemViewClickedListener;
    BaseOnItemViewSelectedListener mOnItemViewSelectedListener;
    private ArrayList<Presenter> mPresenterMapper;
    private RecyclerView.RecycledViewPool mRecycledViewPool;
    ItemBridgeAdapter.ViewHolder mSelectedViewHolder;
    private int mSubPosition;
    boolean mViewsCreated;
    boolean mExpand = true;
    private int mAlignedTop = Integer.MIN_VALUE;
    boolean mAfterEntranceTransition = true;
    private final ItemBridgeAdapter.AdapterListener mBridgeAdapterListener = new ItemBridgeAdapter.AdapterListener() { // from class: androidx.leanback.app.RowsSupportFragment.1
        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onAddPresenter(Presenter presenter, int i) {
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onAddPresenter(presenter, i);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onCreate(ItemBridgeAdapter.ViewHolder viewHolder) {
            VerticalGridView verticalGridView = RowsSupportFragment.this.getVerticalGridView();
            if (verticalGridView != null) {
                verticalGridView.setClipChildren(false);
            }
            RowsSupportFragment.this.setupSharedViewPool(viewHolder);
            RowsSupportFragment.this.mViewsCreated = true;
            viewHolder.setExtraObject(new RowViewHolderExtra(viewHolder));
            RowsSupportFragment.setRowViewSelected(viewHolder, false, true);
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onCreate(viewHolder);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onAttachedToWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            RowsSupportFragment.setRowViewExpanded(viewHolder, RowsSupportFragment.this.mExpand);
            RowPresenter rowPresenter = (RowPresenter) viewHolder.getPresenter();
            RowPresenter.ViewHolder rowViewHolder = rowPresenter.getRowViewHolder(viewHolder.getViewHolder());
            rowPresenter.setEntranceTransitionState(rowViewHolder, RowsSupportFragment.this.mAfterEntranceTransition);
            rowViewHolder.setOnItemViewSelectedListener(RowsSupportFragment.this.mOnItemViewSelectedListener);
            rowViewHolder.setOnItemViewClickedListener(RowsSupportFragment.this.mOnItemViewClickedListener);
            rowPresenter.freeze(rowViewHolder, RowsSupportFragment.this.mFreezeRows);
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onAttachedToWindow(viewHolder);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onDetachedFromWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            if (RowsSupportFragment.this.mSelectedViewHolder == viewHolder) {
                RowsSupportFragment.setRowViewSelected(RowsSupportFragment.this.mSelectedViewHolder, false, true);
                RowsSupportFragment.this.mSelectedViewHolder = null;
            }
            RowPresenter.ViewHolder rowViewHolder = ((RowPresenter) viewHolder.getPresenter()).getRowViewHolder(viewHolder.getViewHolder());
            rowViewHolder.setOnItemViewSelectedListener(null);
            rowViewHolder.setOnItemViewClickedListener(null);
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onDetachedFromWindow(viewHolder);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onBind(ItemBridgeAdapter.ViewHolder viewHolder) {
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onBind(viewHolder);
            }
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter.AdapterListener
        public void onUnbind(ItemBridgeAdapter.ViewHolder viewHolder) {
            RowsSupportFragment.setRowViewSelected(viewHolder, false, true);
            if (RowsSupportFragment.this.mExternalAdapterListener != null) {
                RowsSupportFragment.this.mExternalAdapterListener.onUnbind(viewHolder);
            }
        }
    };

    @Deprecated
    public void enableRowScaling(boolean z) {
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public /* bridge */ /* synthetic */ int getSelectedPosition() {
        return super.getSelectedPosition();
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment, androidx.fragment.app.Fragment
    public /* bridge */ /* synthetic */ View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return super.onCreateView(layoutInflater, viewGroup, bundle);
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment, androidx.fragment.app.Fragment
    public /* bridge */ /* synthetic */ void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public /* bridge */ /* synthetic */ void onTransitionStart() {
        super.onTransitionStart();
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public /* bridge */ /* synthetic */ void setSelectedPosition(int i) {
        super.setSelectedPosition(i);
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public /* bridge */ /* synthetic */ void setSelectedPosition(int i, boolean z) {
        super.setSelectedPosition(i, z);
    }

    @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapterProvider
    public BrowseSupportFragment.MainFragmentAdapter getMainFragmentAdapter() {
        if (this.mMainFragmentAdapter == null) {
            this.mMainFragmentAdapter = new MainFragmentAdapter(this);
        }
        return this.mMainFragmentAdapter;
    }

    @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapterProvider
    public BrowseSupportFragment.MainFragmentRowsAdapter getMainFragmentRowsAdapter() {
        if (this.mMainFragmentRowsAdapter == null) {
            this.mMainFragmentRowsAdapter = new MainFragmentRowsAdapter(this);
        }
        return this.mMainFragmentRowsAdapter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class RowViewHolderExtra implements TimeAnimator.TimeListener {
        static final Interpolator sSelectAnimatorInterpolator = new DecelerateInterpolator(2.0f);
        final RowPresenter mRowPresenter;
        final Presenter.ViewHolder mRowViewHolder;
        final TimeAnimator mSelectAnimator;
        final int mSelectAnimatorDurationInUse;
        final Interpolator mSelectAnimatorInterpolatorInUse;
        float mSelectLevelAnimDelta;
        float mSelectLevelAnimStart;

        RowViewHolderExtra(ItemBridgeAdapter.ViewHolder viewHolder) {
            TimeAnimator timeAnimator = new TimeAnimator();
            this.mSelectAnimator = timeAnimator;
            this.mRowPresenter = (RowPresenter) viewHolder.getPresenter();
            this.mRowViewHolder = viewHolder.getViewHolder();
            timeAnimator.setTimeListener(this);
            this.mSelectAnimatorDurationInUse = viewHolder.itemView.getResources().getInteger(C0393R.integer.lb_browse_rows_anim_duration);
            this.mSelectAnimatorInterpolatorInUse = sSelectAnimatorInterpolator;
        }

        @Override // android.animation.TimeAnimator.TimeListener
        public void onTimeUpdate(TimeAnimator timeAnimator, long j, long j2) {
            if (this.mSelectAnimator.isRunning()) {
                updateSelect(j, j2);
            }
        }

        void updateSelect(long j, long j2) {
            float f;
            int i = this.mSelectAnimatorDurationInUse;
            if (j >= i) {
                f = 1.0f;
                this.mSelectAnimator.end();
            } else {
                f = (float) (j / i);
            }
            Interpolator interpolator = this.mSelectAnimatorInterpolatorInUse;
            if (interpolator != null) {
                f = interpolator.getInterpolation(f);
            }
            this.mRowPresenter.setSelectLevel(this.mRowViewHolder, this.mSelectLevelAnimStart + (f * this.mSelectLevelAnimDelta));
        }

        void animateSelect(boolean z, boolean z2) {
            this.mSelectAnimator.end();
            float f = z ? 1.0f : 0.0f;
            if (z2) {
                this.mRowPresenter.setSelectLevel(this.mRowViewHolder, f);
            } else if (this.mRowPresenter.getSelectLevel(this.mRowViewHolder) != f) {
                float selectLevel = this.mRowPresenter.getSelectLevel(this.mRowViewHolder);
                this.mSelectLevelAnimStart = selectLevel;
                this.mSelectLevelAnimDelta = f - selectLevel;
                this.mSelectAnimator.start();
            }
        }
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    protected VerticalGridView findGridViewFromRoot(View view) {
        return (VerticalGridView) view.findViewById(C0393R.C0396id.container_list);
    }

    public void setOnItemViewClickedListener(BaseOnItemViewClickedListener baseOnItemViewClickedListener) {
        this.mOnItemViewClickedListener = baseOnItemViewClickedListener;
        if (this.mViewsCreated) {
            throw new IllegalStateException("Item clicked listener must be set before views are created");
        }
    }

    public BaseOnItemViewClickedListener getOnItemViewClickedListener() {
        return this.mOnItemViewClickedListener;
    }

    public void setExpand(boolean z) {
        this.mExpand = z;
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView != null) {
            int childCount = verticalGridView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                setRowViewExpanded((ItemBridgeAdapter.ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i)), this.mExpand);
            }
        }
    }

    public void setOnItemViewSelectedListener(BaseOnItemViewSelectedListener baseOnItemViewSelectedListener) {
        this.mOnItemViewSelectedListener = baseOnItemViewSelectedListener;
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView != null) {
            int childCount = verticalGridView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                getRowViewHolder((ItemBridgeAdapter.ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i))).setOnItemViewSelectedListener(this.mOnItemViewSelectedListener);
            }
        }
    }

    public BaseOnItemViewSelectedListener getOnItemViewSelectedListener() {
        return this.mOnItemViewSelectedListener;
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    void onRowSelected(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, int i, int i2) {
        ItemBridgeAdapter.ViewHolder viewHolder2 = this.mSelectedViewHolder;
        if (viewHolder2 != viewHolder || this.mSubPosition != i2) {
            this.mSubPosition = i2;
            if (viewHolder2 != null) {
                setRowViewSelected(viewHolder2, false, false);
            }
            ItemBridgeAdapter.ViewHolder viewHolder3 = (ItemBridgeAdapter.ViewHolder) viewHolder;
            this.mSelectedViewHolder = viewHolder3;
            if (viewHolder3 != null) {
                setRowViewSelected(viewHolder3, true, false);
            }
        }
        MainFragmentAdapter mainFragmentAdapter = this.mMainFragmentAdapter;
        if (mainFragmentAdapter != null) {
            mainFragmentAdapter.getFragmentHost().showTitleView(i <= 0);
        }
    }

    public RowPresenter.ViewHolder getRowViewHolder(int i) {
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView == null) {
            return null;
        }
        return getRowViewHolder((ItemBridgeAdapter.ViewHolder) verticalGridView.findViewHolderForAdapterPosition(i));
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    int getLayoutResourceId() {
        return C0393R.layout.lb_rows_fragment;
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        getVerticalGridView().setItemAlignmentViewId(C0393R.C0396id.row_content);
        getVerticalGridView().setSaveChildrenPolicy(2);
        setAlignment(this.mAlignedTop);
        this.mRecycledViewPool = null;
        this.mPresenterMapper = null;
        MainFragmentAdapter mainFragmentAdapter = this.mMainFragmentAdapter;
        if (mainFragmentAdapter != null) {
            mainFragmentAdapter.getFragmentHost().notifyViewCreated(this.mMainFragmentAdapter);
        }
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment, androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.mViewsCreated = false;
        this.mSelectedViewHolder = null;
        this.mRecycledViewPool = null;
        super.onDestroyView();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setExternalAdapterListener(ItemBridgeAdapter.AdapterListener adapterListener) {
        this.mExternalAdapterListener = adapterListener;
    }

    static void setRowViewExpanded(ItemBridgeAdapter.ViewHolder viewHolder, boolean z) {
        ((RowPresenter) viewHolder.getPresenter()).setRowViewExpanded(viewHolder.getViewHolder(), z);
    }

    static void setRowViewSelected(ItemBridgeAdapter.ViewHolder viewHolder, boolean z, boolean z2) {
        ((RowViewHolderExtra) viewHolder.getExtraObject()).animateSelect(z, z2);
        ((RowPresenter) viewHolder.getPresenter()).setRowViewSelected(viewHolder.getViewHolder(), z);
    }

    void setupSharedViewPool(ItemBridgeAdapter.ViewHolder viewHolder) {
        RowPresenter.ViewHolder rowViewHolder = ((RowPresenter) viewHolder.getPresenter()).getRowViewHolder(viewHolder.getViewHolder());
        if (rowViewHolder instanceof ListRowPresenter.ViewHolder) {
            ListRowPresenter.ViewHolder viewHolder2 = (ListRowPresenter.ViewHolder) rowViewHolder;
            HorizontalGridView gridView = viewHolder2.getGridView();
            RecyclerView.RecycledViewPool recycledViewPool = this.mRecycledViewPool;
            if (recycledViewPool == null) {
                this.mRecycledViewPool = gridView.getRecycledViewPool();
            } else {
                gridView.setRecycledViewPool(recycledViewPool);
            }
            ItemBridgeAdapter bridgeAdapter = viewHolder2.getBridgeAdapter();
            ArrayList<Presenter> arrayList = this.mPresenterMapper;
            if (arrayList == null) {
                this.mPresenterMapper = bridgeAdapter.getPresenterMapper();
            } else {
                bridgeAdapter.setPresenterMapper(arrayList);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.leanback.app.BaseRowSupportFragment
    public void updateAdapter() {
        super.updateAdapter();
        this.mSelectedViewHolder = null;
        this.mViewsCreated = false;
        ItemBridgeAdapter bridgeAdapter = getBridgeAdapter();
        if (bridgeAdapter != null) {
            bridgeAdapter.setAdapterListener(this.mBridgeAdapterListener);
        }
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public boolean onTransitionPrepare() {
        boolean onTransitionPrepare = super.onTransitionPrepare();
        if (onTransitionPrepare) {
            freezeRows(true);
        }
        return onTransitionPrepare;
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public void onTransitionEnd() {
        super.onTransitionEnd();
        freezeRows(false);
    }

    private void freezeRows(boolean z) {
        this.mFreezeRows = z;
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView != null) {
            int childCount = verticalGridView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                ItemBridgeAdapter.ViewHolder viewHolder = (ItemBridgeAdapter.ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i));
                RowPresenter rowPresenter = (RowPresenter) viewHolder.getPresenter();
                rowPresenter.freeze(rowPresenter.getRowViewHolder(viewHolder.getViewHolder()), z);
            }
        }
    }

    public void setEntranceTransitionState(boolean z) {
        this.mAfterEntranceTransition = z;
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView != null) {
            int childCount = verticalGridView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                ItemBridgeAdapter.ViewHolder viewHolder = (ItemBridgeAdapter.ViewHolder) verticalGridView.getChildViewHolder(verticalGridView.getChildAt(i));
                RowPresenter rowPresenter = (RowPresenter) viewHolder.getPresenter();
                rowPresenter.setEntranceTransitionState(rowPresenter.getRowViewHolder(viewHolder.getViewHolder()), this.mAfterEntranceTransition);
            }
        }
    }

    public void setSelectedPosition(int i, boolean z, final Presenter.ViewHolderTask viewHolderTask) {
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView == null) {
            return;
        }
        ViewHolderTask viewHolderTask2 = viewHolderTask != null ? new ViewHolderTask() { // from class: androidx.leanback.app.RowsSupportFragment.2
            @Override // androidx.leanback.widget.ViewHolderTask
            public void run(final RecyclerView.ViewHolder viewHolder) {
                viewHolder.itemView.post(new Runnable() { // from class: androidx.leanback.app.RowsSupportFragment.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        viewHolderTask.run(RowsSupportFragment.getRowViewHolder((ItemBridgeAdapter.ViewHolder) viewHolder));
                    }
                });
            }
        } : null;
        if (z) {
            verticalGridView.setSelectedPositionSmooth(i, viewHolderTask2);
        } else {
            verticalGridView.setSelectedPosition(i, viewHolderTask2);
        }
    }

    static RowPresenter.ViewHolder getRowViewHolder(ItemBridgeAdapter.ViewHolder viewHolder) {
        if (viewHolder == null) {
            return null;
        }
        return ((RowPresenter) viewHolder.getPresenter()).getRowViewHolder(viewHolder.getViewHolder());
    }

    public boolean isScrolling() {
        return (getVerticalGridView() == null || getVerticalGridView().getScrollState() == 0) ? false : true;
    }

    @Override // androidx.leanback.app.BaseRowSupportFragment
    public void setAlignment(int i) {
        if (i == Integer.MIN_VALUE) {
            return;
        }
        this.mAlignedTop = i;
        VerticalGridView verticalGridView = getVerticalGridView();
        if (verticalGridView != null) {
            verticalGridView.setItemAlignmentOffset(0);
            verticalGridView.setItemAlignmentOffsetPercent(-1.0f);
            verticalGridView.setItemAlignmentOffsetWithPadding(true);
            verticalGridView.setWindowAlignmentOffset(this.mAlignedTop);
            verticalGridView.setWindowAlignmentOffsetPercent(-1.0f);
            verticalGridView.setWindowAlignment(0);
        }
    }

    public RowPresenter.ViewHolder findRowViewHolderByPosition(int i) {
        if (this.mVerticalGridView == null) {
            return null;
        }
        return getRowViewHolder((ItemBridgeAdapter.ViewHolder) this.mVerticalGridView.findViewHolderForAdapterPosition(i));
    }

    /* loaded from: classes.dex */
    public static class MainFragmentAdapter extends BrowseSupportFragment.MainFragmentAdapter<RowsSupportFragment> {
        public MainFragmentAdapter(RowsSupportFragment rowsSupportFragment) {
            super(rowsSupportFragment);
            setScalingEnabled(true);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public boolean isScrolling() {
            return getFragment().isScrolling();
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public void setExpand(boolean z) {
            getFragment().setExpand(z);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public void setEntranceTransitionState(boolean z) {
            getFragment().setEntranceTransitionState(z);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public void setAlignment(int i) {
            getFragment().setAlignment(i);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public boolean onTransitionPrepare() {
            return getFragment().onTransitionPrepare();
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public void onTransitionStart() {
            getFragment().onTransitionStart();
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentAdapter
        public void onTransitionEnd() {
            getFragment().onTransitionEnd();
        }
    }

    /* loaded from: classes.dex */
    public static class MainFragmentRowsAdapter extends BrowseSupportFragment.MainFragmentRowsAdapter<RowsSupportFragment> {
        public MainFragmentRowsAdapter(RowsSupportFragment rowsSupportFragment) {
            super(rowsSupportFragment);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public void setAdapter(ObjectAdapter objectAdapter) {
            getFragment().setAdapter(objectAdapter);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public void setOnItemViewClickedListener(OnItemViewClickedListener onItemViewClickedListener) {
            getFragment().setOnItemViewClickedListener(onItemViewClickedListener);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public void setOnItemViewSelectedListener(OnItemViewSelectedListener onItemViewSelectedListener) {
            getFragment().setOnItemViewSelectedListener(onItemViewSelectedListener);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public void setSelectedPosition(int i, boolean z, Presenter.ViewHolderTask viewHolderTask) {
            getFragment().setSelectedPosition(i, z, viewHolderTask);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public void setSelectedPosition(int i, boolean z) {
            getFragment().setSelectedPosition(i, z);
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public int getSelectedPosition() {
            return getFragment().getSelectedPosition();
        }

        @Override // androidx.leanback.app.BrowseSupportFragment.MainFragmentRowsAdapter
        public RowPresenter.ViewHolder findRowViewHolderByPosition(int i) {
            return getFragment().findRowViewHolderByPosition(i);
        }
    }
}
