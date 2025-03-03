package androidx.leanback.widget;

import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.leanback.C0393R;
import androidx.leanback.widget.BaseGridView;
import androidx.leanback.widget.DetailsOverviewLogoPresenter;
import androidx.leanback.widget.DetailsOverviewRow;
import androidx.leanback.widget.ItemBridgeAdapter;
import androidx.leanback.widget.Presenter;
import androidx.leanback.widget.RowPresenter;
import androidx.recyclerview.widget.RecyclerView;
/* loaded from: classes.dex */
public class FullWidthDetailsOverviewRowPresenter extends RowPresenter {
    public static final int ALIGN_MODE_MIDDLE = 1;
    public static final int ALIGN_MODE_START = 0;
    static final boolean DEBUG = false;
    public static final int STATE_FULL = 1;
    public static final int STATE_HALF = 0;
    public static final int STATE_SMALL = 2;
    static final String TAG = "FullWidthDetailsRP";
    static final Handler sHandler = new Handler();
    OnActionClickedListener mActionClickedListener;
    private int mActionsBackgroundColor;
    private boolean mActionsBackgroundColorSet;
    private int mAlignmentMode;
    private int mBackgroundColor;
    private boolean mBackgroundColorSet;
    final DetailsOverviewLogoPresenter mDetailsOverviewLogoPresenter;
    final Presenter mDetailsPresenter;
    protected int mInitialState;
    private Listener mListener;
    private boolean mParticipatingEntranceTransition;

    /* loaded from: classes.dex */
    public static abstract class Listener {
        public void onBindLogo(ViewHolder viewHolder) {
        }
    }

    @Override // androidx.leanback.widget.RowPresenter
    protected boolean isClippingChildren() {
        return true;
    }

    @Override // androidx.leanback.widget.RowPresenter
    public final boolean isUsingDefaultSelectEffect() {
        return false;
    }

    /* loaded from: classes.dex */
    class ActionsItemBridgeAdapter extends ItemBridgeAdapter {
        ViewHolder mViewHolder;

        ActionsItemBridgeAdapter(ViewHolder viewHolder) {
            this.mViewHolder = viewHolder;
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter
        public void onBind(final ItemBridgeAdapter.ViewHolder viewHolder) {
            if (this.mViewHolder.getOnItemViewClickedListener() == null && FullWidthDetailsOverviewRowPresenter.this.mActionClickedListener == null) {
                return;
            }
            viewHolder.getPresenter().setOnClickListener(viewHolder.getViewHolder(), new View.OnClickListener() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.ActionsItemBridgeAdapter.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (ActionsItemBridgeAdapter.this.mViewHolder.getOnItemViewClickedListener() != null) {
                        ActionsItemBridgeAdapter.this.mViewHolder.getOnItemViewClickedListener().onItemClicked(viewHolder.getViewHolder(), viewHolder.getItem(), ActionsItemBridgeAdapter.this.mViewHolder, ActionsItemBridgeAdapter.this.mViewHolder.getRow());
                    }
                    if (FullWidthDetailsOverviewRowPresenter.this.mActionClickedListener != null) {
                        FullWidthDetailsOverviewRowPresenter.this.mActionClickedListener.onActionClicked((Action) viewHolder.getItem());
                    }
                }
            });
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter
        public void onUnbind(ItemBridgeAdapter.ViewHolder viewHolder) {
            if (this.mViewHolder.getOnItemViewClickedListener() == null && FullWidthDetailsOverviewRowPresenter.this.mActionClickedListener == null) {
                return;
            }
            viewHolder.getPresenter().setOnClickListener(viewHolder.getViewHolder(), null);
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter
        public void onAttachedToWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            viewHolder.itemView.removeOnLayoutChangeListener(this.mViewHolder.mLayoutChangeListener);
            viewHolder.itemView.addOnLayoutChangeListener(this.mViewHolder.mLayoutChangeListener);
        }

        @Override // androidx.leanback.widget.ItemBridgeAdapter
        public void onDetachedFromWindow(ItemBridgeAdapter.ViewHolder viewHolder) {
            viewHolder.itemView.removeOnLayoutChangeListener(this.mViewHolder.mLayoutChangeListener);
            this.mViewHolder.checkFirstAndLastPosition(false);
        }
    }

    /* loaded from: classes.dex */
    public class ViewHolder extends RowPresenter.ViewHolder {
        ItemBridgeAdapter mActionBridgeAdapter;
        final HorizontalGridView mActionsRow;
        final OnChildSelectedListener mChildSelectedListener;
        final ViewGroup mDetailsDescriptionFrame;
        final Presenter.ViewHolder mDetailsDescriptionViewHolder;
        final DetailsOverviewLogoPresenter.ViewHolder mDetailsLogoViewHolder;
        final View.OnLayoutChangeListener mLayoutChangeListener;
        int mNumItems;
        final FrameLayout mOverviewFrame;
        final ViewGroup mOverviewRoot;
        protected final DetailsOverviewRow.Listener mRowListener;
        final RecyclerView.OnScrollListener mScrollListener;
        int mState;
        final Runnable mUpdateDrawableCallback;

        protected DetailsOverviewRow.Listener createRowListener() {
            return new DetailsOverviewRowListener();
        }

        /* loaded from: classes.dex */
        public class DetailsOverviewRowListener extends DetailsOverviewRow.Listener {
            public DetailsOverviewRowListener() {
            }

            @Override // androidx.leanback.widget.DetailsOverviewRow.Listener
            public void onImageDrawableChanged(DetailsOverviewRow detailsOverviewRow) {
                FullWidthDetailsOverviewRowPresenter.sHandler.removeCallbacks(ViewHolder.this.mUpdateDrawableCallback);
                FullWidthDetailsOverviewRowPresenter.sHandler.post(ViewHolder.this.mUpdateDrawableCallback);
            }

            @Override // androidx.leanback.widget.DetailsOverviewRow.Listener
            public void onItemChanged(DetailsOverviewRow detailsOverviewRow) {
                if (ViewHolder.this.mDetailsDescriptionViewHolder != null) {
                    FullWidthDetailsOverviewRowPresenter.this.mDetailsPresenter.onUnbindViewHolder(ViewHolder.this.mDetailsDescriptionViewHolder);
                }
                FullWidthDetailsOverviewRowPresenter.this.mDetailsPresenter.onBindViewHolder(ViewHolder.this.mDetailsDescriptionViewHolder, detailsOverviewRow.getItem());
            }

            @Override // androidx.leanback.widget.DetailsOverviewRow.Listener
            public void onActionsAdapterChanged(DetailsOverviewRow detailsOverviewRow) {
                ViewHolder.this.bindActions(detailsOverviewRow.getActionsAdapter());
            }
        }

        void bindActions(ObjectAdapter objectAdapter) {
            this.mActionBridgeAdapter.setAdapter(objectAdapter);
            this.mActionsRow.setAdapter(this.mActionBridgeAdapter);
            this.mNumItems = this.mActionBridgeAdapter.getItemCount();
        }

        void unbindActions() {
            this.mActionBridgeAdapter.setAdapter(null);
            this.mActionsRow.setAdapter(null);
            this.mNumItems = 0;
        }

        void onBind() {
            DetailsOverviewRow detailsOverviewRow = (DetailsOverviewRow) getRow();
            bindActions(detailsOverviewRow.getActionsAdapter());
            detailsOverviewRow.addListener(this.mRowListener);
        }

        void onUnbind() {
            unbindActions();
            ((DetailsOverviewRow) getRow()).removeListener(this.mRowListener);
            FullWidthDetailsOverviewRowPresenter.sHandler.removeCallbacks(this.mUpdateDrawableCallback);
        }

        void dispatchItemSelection(View view) {
            RecyclerView.ViewHolder findViewHolderForPosition;
            if (isSelected()) {
                if (view != null) {
                    findViewHolderForPosition = this.mActionsRow.getChildViewHolder(view);
                } else {
                    HorizontalGridView horizontalGridView = this.mActionsRow;
                    findViewHolderForPosition = horizontalGridView.findViewHolderForPosition(horizontalGridView.getSelectedPosition());
                }
                ItemBridgeAdapter.ViewHolder viewHolder = (ItemBridgeAdapter.ViewHolder) findViewHolderForPosition;
                if (viewHolder == null) {
                    if (getOnItemViewSelectedListener() != null) {
                        getOnItemViewSelectedListener().onItemSelected(null, null, this, getRow());
                    }
                } else if (getOnItemViewSelectedListener() != null) {
                    getOnItemViewSelectedListener().onItemSelected(viewHolder.getViewHolder(), viewHolder.getItem(), this, getRow());
                }
            }
        }

        void checkFirstAndLastPosition(boolean z) {
            RecyclerView.ViewHolder findViewHolderForPosition = this.mActionsRow.findViewHolderForPosition(this.mNumItems - 1);
            if (findViewHolderForPosition != null) {
                findViewHolderForPosition.itemView.getRight();
                this.mActionsRow.getWidth();
            }
            RecyclerView.ViewHolder findViewHolderForPosition2 = this.mActionsRow.findViewHolderForPosition(0);
            if (findViewHolderForPosition2 != null) {
                findViewHolderForPosition2.itemView.getLeft();
            }
        }

        public ViewHolder(View view, Presenter presenter, DetailsOverviewLogoPresenter detailsOverviewLogoPresenter) {
            super(view);
            this.mRowListener = createRowListener();
            this.mState = 0;
            this.mUpdateDrawableCallback = new Runnable() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.ViewHolder.1
                @Override // java.lang.Runnable
                public void run() {
                    Row row = ViewHolder.this.getRow();
                    if (row == null) {
                        return;
                    }
                    FullWidthDetailsOverviewRowPresenter.this.mDetailsOverviewLogoPresenter.onBindViewHolder(ViewHolder.this.mDetailsLogoViewHolder, row);
                }
            };
            this.mLayoutChangeListener = new View.OnLayoutChangeListener() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.ViewHolder.2
                @Override // android.view.View.OnLayoutChangeListener
                public void onLayoutChange(View view2, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                    ViewHolder.this.checkFirstAndLastPosition(false);
                }
            };
            OnChildSelectedListener onChildSelectedListener = new OnChildSelectedListener() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.ViewHolder.3
                @Override // androidx.leanback.widget.OnChildSelectedListener
                public void onChildSelected(ViewGroup viewGroup, View view2, int i, long j) {
                    ViewHolder.this.dispatchItemSelection(view2);
                }
            };
            this.mChildSelectedListener = onChildSelectedListener;
            RecyclerView.OnScrollListener onScrollListener = new RecyclerView.OnScrollListener() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.ViewHolder.4
                @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
                public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                }

                @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
                public void onScrolled(RecyclerView recyclerView, int i, int i2) {
                    ViewHolder.this.checkFirstAndLastPosition(true);
                }
            };
            this.mScrollListener = onScrollListener;
            ViewGroup viewGroup = (ViewGroup) view.findViewById(C0393R.C0396id.details_root);
            this.mOverviewRoot = viewGroup;
            FrameLayout frameLayout = (FrameLayout) view.findViewById(C0393R.C0396id.details_frame);
            this.mOverviewFrame = frameLayout;
            ViewGroup viewGroup2 = (ViewGroup) view.findViewById(C0393R.C0396id.details_overview_description);
            this.mDetailsDescriptionFrame = viewGroup2;
            HorizontalGridView horizontalGridView = (HorizontalGridView) frameLayout.findViewById(C0393R.C0396id.details_overview_actions);
            this.mActionsRow = horizontalGridView;
            horizontalGridView.setHasOverlappingRendering(false);
            horizontalGridView.setOnScrollListener(onScrollListener);
            horizontalGridView.setAdapter(this.mActionBridgeAdapter);
            horizontalGridView.setOnChildSelectedListener(onChildSelectedListener);
            int dimensionPixelSize = view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_overview_actions_fade_size);
            horizontalGridView.setFadingRightEdgeLength(dimensionPixelSize);
            horizontalGridView.setFadingLeftEdgeLength(dimensionPixelSize);
            Presenter.ViewHolder onCreateViewHolder = presenter.onCreateViewHolder(viewGroup2);
            this.mDetailsDescriptionViewHolder = onCreateViewHolder;
            viewGroup2.addView(onCreateViewHolder.view);
            DetailsOverviewLogoPresenter.ViewHolder viewHolder = (DetailsOverviewLogoPresenter.ViewHolder) detailsOverviewLogoPresenter.onCreateViewHolder(viewGroup);
            this.mDetailsLogoViewHolder = viewHolder;
            viewGroup.addView(viewHolder.view);
        }

        public final ViewGroup getOverviewView() {
            return this.mOverviewFrame;
        }

        public final DetailsOverviewLogoPresenter.ViewHolder getLogoViewHolder() {
            return this.mDetailsLogoViewHolder;
        }

        public final Presenter.ViewHolder getDetailsDescriptionViewHolder() {
            return this.mDetailsDescriptionViewHolder;
        }

        public final ViewGroup getDetailsDescriptionFrame() {
            return this.mDetailsDescriptionFrame;
        }

        public final ViewGroup getActionsRow() {
            return this.mActionsRow;
        }

        public final int getState() {
            return this.mState;
        }
    }

    public FullWidthDetailsOverviewRowPresenter(Presenter presenter) {
        this(presenter, new DetailsOverviewLogoPresenter());
    }

    public FullWidthDetailsOverviewRowPresenter(Presenter presenter, DetailsOverviewLogoPresenter detailsOverviewLogoPresenter) {
        this.mInitialState = 0;
        this.mBackgroundColor = 0;
        this.mActionsBackgroundColor = 0;
        setHeaderPresenter(null);
        setSelectEffectEnabled(false);
        this.mDetailsPresenter = presenter;
        this.mDetailsOverviewLogoPresenter = detailsOverviewLogoPresenter;
    }

    public void setOnActionClickedListener(OnActionClickedListener onActionClickedListener) {
        this.mActionClickedListener = onActionClickedListener;
    }

    public OnActionClickedListener getOnActionClickedListener() {
        return this.mActionClickedListener;
    }

    public final void setBackgroundColor(int i) {
        this.mBackgroundColor = i;
        this.mBackgroundColorSet = true;
    }

    public final int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public final void setActionsBackgroundColor(int i) {
        this.mActionsBackgroundColor = i;
        this.mActionsBackgroundColorSet = true;
    }

    public final int getActionsBackgroundColor() {
        return this.mActionsBackgroundColor;
    }

    public final boolean isParticipatingEntranceTransition() {
        return this.mParticipatingEntranceTransition;
    }

    public final void setParticipatingEntranceTransition(boolean z) {
        this.mParticipatingEntranceTransition = z;
    }

    public final void setInitialState(int i) {
        this.mInitialState = i;
    }

    public final int getInitialState() {
        return this.mInitialState;
    }

    public final void setAlignmentMode(int i) {
        this.mAlignmentMode = i;
    }

    public final int getAlignmentMode() {
        return this.mAlignmentMode;
    }

    public final void setListener(Listener listener) {
        this.mListener = listener;
    }

    protected int getLayoutResourceId() {
        return C0393R.layout.lb_fullwidth_details_overview;
    }

    @Override // androidx.leanback.widget.RowPresenter
    protected RowPresenter.ViewHolder createRowViewHolder(ViewGroup viewGroup) {
        final ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(getLayoutResourceId(), viewGroup, false), this.mDetailsPresenter, this.mDetailsOverviewLogoPresenter);
        this.mDetailsOverviewLogoPresenter.setContext(viewHolder.mDetailsLogoViewHolder, viewHolder, this);
        setState(viewHolder, this.mInitialState);
        viewHolder.mActionBridgeAdapter = new ActionsItemBridgeAdapter(viewHolder);
        FrameLayout frameLayout = viewHolder.mOverviewFrame;
        if (this.mBackgroundColorSet) {
            frameLayout.setBackgroundColor(this.mBackgroundColor);
        }
        if (this.mActionsBackgroundColorSet) {
            frameLayout.findViewById(C0393R.C0396id.details_overview_actions_background).setBackgroundColor(this.mActionsBackgroundColor);
        }
        RoundedRectHelper.setClipToRoundedOutline(frameLayout, true);
        if (!getSelectEffectEnabled()) {
            viewHolder.mOverviewFrame.setForeground(null);
        }
        viewHolder.mActionsRow.setOnUnhandledKeyListener(new BaseGridView.OnUnhandledKeyListener() { // from class: androidx.leanback.widget.FullWidthDetailsOverviewRowPresenter.1
            @Override // androidx.leanback.widget.BaseGridView.OnUnhandledKeyListener
            public boolean onUnhandledKey(KeyEvent keyEvent) {
                if (viewHolder.getOnKeyListener() != null) {
                    return viewHolder.getOnKeyListener().onKey(viewHolder.view, keyEvent.getKeyCode(), keyEvent);
                }
                return false;
            }
        });
        return viewHolder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.leanback.widget.RowPresenter
    public void onBindRowViewHolder(RowPresenter.ViewHolder viewHolder, Object obj) {
        super.onBindRowViewHolder(viewHolder, obj);
        DetailsOverviewRow detailsOverviewRow = (DetailsOverviewRow) obj;
        ViewHolder viewHolder2 = (ViewHolder) viewHolder;
        this.mDetailsOverviewLogoPresenter.onBindViewHolder(viewHolder2.mDetailsLogoViewHolder, detailsOverviewRow);
        this.mDetailsPresenter.onBindViewHolder(viewHolder2.mDetailsDescriptionViewHolder, detailsOverviewRow.getItem());
        viewHolder2.onBind();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.leanback.widget.RowPresenter
    public void onUnbindRowViewHolder(RowPresenter.ViewHolder viewHolder) {
        ViewHolder viewHolder2 = (ViewHolder) viewHolder;
        viewHolder2.onUnbind();
        this.mDetailsPresenter.onUnbindViewHolder(viewHolder2.mDetailsDescriptionViewHolder);
        this.mDetailsOverviewLogoPresenter.onUnbindViewHolder(viewHolder2.mDetailsLogoViewHolder);
        super.onUnbindRowViewHolder(viewHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.leanback.widget.RowPresenter
    public void onSelectLevelChanged(RowPresenter.ViewHolder viewHolder) {
        super.onSelectLevelChanged(viewHolder);
        if (getSelectEffectEnabled()) {
            ViewHolder viewHolder2 = (ViewHolder) viewHolder;
            ((ColorDrawable) viewHolder2.mOverviewFrame.getForeground().mutate()).setColor(viewHolder2.mColorDimmer.getPaint().getColor());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.leanback.widget.RowPresenter
    public void onRowViewAttachedToWindow(RowPresenter.ViewHolder viewHolder) {
        super.onRowViewAttachedToWindow(viewHolder);
        ViewHolder viewHolder2 = (ViewHolder) viewHolder;
        this.mDetailsPresenter.onViewAttachedToWindow(viewHolder2.mDetailsDescriptionViewHolder);
        this.mDetailsOverviewLogoPresenter.onViewAttachedToWindow(viewHolder2.mDetailsLogoViewHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.leanback.widget.RowPresenter
    public void onRowViewDetachedFromWindow(RowPresenter.ViewHolder viewHolder) {
        super.onRowViewDetachedFromWindow(viewHolder);
        ViewHolder viewHolder2 = (ViewHolder) viewHolder;
        this.mDetailsPresenter.onViewDetachedFromWindow(viewHolder2.mDetailsDescriptionViewHolder);
        this.mDetailsOverviewLogoPresenter.onViewDetachedFromWindow(viewHolder2.mDetailsLogoViewHolder);
    }

    public final void notifyOnBindLogo(ViewHolder viewHolder) {
        onLayoutOverviewFrame(viewHolder, viewHolder.getState(), true);
        onLayoutLogo(viewHolder, viewHolder.getState(), true);
        Listener listener = this.mListener;
        if (listener != null) {
            listener.onBindLogo(viewHolder);
        }
    }

    protected void onLayoutLogo(ViewHolder viewHolder, int i, boolean z) {
        View view = viewHolder.getLogoViewHolder().view;
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        if (this.mAlignmentMode != 1) {
            marginLayoutParams.setMarginStart(view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_logo_margin_start));
        } else {
            marginLayoutParams.setMarginStart(view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_left) - marginLayoutParams.width);
        }
        int state = viewHolder.getState();
        if (state == 0) {
            marginLayoutParams.topMargin = view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_blank_height) + view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_actions_height) + view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_description_margin_top);
        } else if (state != 2) {
            marginLayoutParams.topMargin = view.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_blank_height) - (marginLayoutParams.height / 2);
        } else {
            marginLayoutParams.topMargin = 0;
        }
        view.setLayoutParams(marginLayoutParams);
    }

    protected void onLayoutOverviewFrame(ViewHolder viewHolder, int i, boolean z) {
        int dimensionPixelSize;
        boolean z2 = i == 2;
        boolean z3 = viewHolder.getState() == 2;
        if (z2 != z3 || z) {
            Resources resources = viewHolder.view.getResources();
            int i2 = this.mDetailsOverviewLogoPresenter.isBoundToImage(viewHolder.getLogoViewHolder(), (DetailsOverviewRow) viewHolder.getRow()) ? viewHolder.getLogoViewHolder().view.getLayoutParams().width : 0;
            if (this.mAlignmentMode != 1) {
                if (z3) {
                    dimensionPixelSize = resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_logo_margin_start);
                } else {
                    i2 += resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_logo_margin_start);
                    dimensionPixelSize = 0;
                }
            } else if (z3) {
                dimensionPixelSize = resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_left) - i2;
            } else {
                i2 = resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_left);
                dimensionPixelSize = 0;
            }
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewHolder.getOverviewView().getLayoutParams();
            marginLayoutParams.topMargin = z3 ? 0 : resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_blank_height);
            marginLayoutParams.rightMargin = dimensionPixelSize;
            marginLayoutParams.leftMargin = dimensionPixelSize;
            viewHolder.getOverviewView().setLayoutParams(marginLayoutParams);
            ViewGroup detailsDescriptionFrame = viewHolder.getDetailsDescriptionFrame();
            ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) detailsDescriptionFrame.getLayoutParams();
            marginLayoutParams2.setMarginStart(i2);
            detailsDescriptionFrame.setLayoutParams(marginLayoutParams2);
            ViewGroup actionsRow = viewHolder.getActionsRow();
            ViewGroup.MarginLayoutParams marginLayoutParams3 = (ViewGroup.MarginLayoutParams) actionsRow.getLayoutParams();
            marginLayoutParams3.setMarginStart(i2);
            marginLayoutParams3.height = z3 ? 0 : resources.getDimensionPixelSize(C0393R.dimen.lb_details_v2_actions_height);
            actionsRow.setLayoutParams(marginLayoutParams3);
        }
    }

    public final void setState(ViewHolder viewHolder, int i) {
        if (viewHolder.getState() != i) {
            int state = viewHolder.getState();
            viewHolder.mState = i;
            onStateChanged(viewHolder, state);
        }
    }

    protected void onStateChanged(ViewHolder viewHolder, int i) {
        onLayoutOverviewFrame(viewHolder, i, false);
        onLayoutLogo(viewHolder, i, false);
    }

    @Override // androidx.leanback.widget.RowPresenter
    public void setEntranceTransitionState(RowPresenter.ViewHolder viewHolder, boolean z) {
        super.setEntranceTransitionState(viewHolder, z);
        if (this.mParticipatingEntranceTransition) {
            viewHolder.view.setVisibility(z ? 0 : 4);
        }
    }
}
