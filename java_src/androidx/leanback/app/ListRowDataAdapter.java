package androidx.leanback.app;

import androidx.leanback.widget.ObjectAdapter;
import androidx.leanback.widget.Row;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ListRowDataAdapter extends ObjectAdapter {
    public static final int ON_CHANGED = 16;
    public static final int ON_ITEM_RANGE_CHANGED = 2;
    public static final int ON_ITEM_RANGE_INSERTED = 4;
    public static final int ON_ITEM_RANGE_REMOVED = 8;
    private final ObjectAdapter mAdapter;
    final ObjectAdapter.DataObserver mDataObserver;
    int mLastVisibleRowIndex;

    public ListRowDataAdapter(ObjectAdapter objectAdapter) {
        super(objectAdapter.getPresenterSelector());
        this.mAdapter = objectAdapter;
        initialize();
        if (objectAdapter.isImmediateNotifySupported()) {
            this.mDataObserver = new SimpleDataObserver();
        } else {
            this.mDataObserver = new QueueBasedDataObserver();
        }
        attach();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void detach() {
        this.mAdapter.unregisterObserver(this.mDataObserver);
    }

    void attach() {
        initialize();
        this.mAdapter.registerObserver(this.mDataObserver);
    }

    void initialize() {
        this.mLastVisibleRowIndex = -1;
        for (int size = this.mAdapter.size() - 1; size >= 0; size--) {
            if (((Row) this.mAdapter.get(size)).isRenderedAsRowView()) {
                this.mLastVisibleRowIndex = size;
                return;
            }
        }
    }

    @Override // androidx.leanback.widget.ObjectAdapter
    public int size() {
        return this.mLastVisibleRowIndex + 1;
    }

    @Override // androidx.leanback.widget.ObjectAdapter
    public Object get(int i) {
        return this.mAdapter.get(i);
    }

    void doNotify(int i, int i2, int i3) {
        if (i == 2) {
            notifyItemRangeChanged(i2, i3);
        } else if (i == 4) {
            notifyItemRangeInserted(i2, i3);
        } else if (i == 8) {
            notifyItemRangeRemoved(i2, i3);
        } else if (i == 16) {
            notifyChanged();
        } else {
            throw new IllegalArgumentException("Invalid event type " + i);
        }
    }

    /* loaded from: classes.dex */
    private class SimpleDataObserver extends ObjectAdapter.DataObserver {
        SimpleDataObserver() {
        }

        @Override // androidx.leanback.widget.ObjectAdapter.DataObserver
        public void onItemRangeChanged(int i, int i2) {
            if (i <= ListRowDataAdapter.this.mLastVisibleRowIndex) {
                onEventFired(2, i, Math.min(i2, (ListRowDataAdapter.this.mLastVisibleRowIndex - i) + 1));
            }
        }

        @Override // androidx.leanback.widget.ObjectAdapter.DataObserver
        public void onItemRangeInserted(int i, int i2) {
            if (i <= ListRowDataAdapter.this.mLastVisibleRowIndex) {
                ListRowDataAdapter.this.mLastVisibleRowIndex += i2;
                onEventFired(4, i, i2);
                return;
            }
            int i3 = ListRowDataAdapter.this.mLastVisibleRowIndex;
            ListRowDataAdapter.this.initialize();
            if (ListRowDataAdapter.this.mLastVisibleRowIndex > i3) {
                onEventFired(4, i3 + 1, ListRowDataAdapter.this.mLastVisibleRowIndex - i3);
            }
        }

        @Override // androidx.leanback.widget.ObjectAdapter.DataObserver
        public void onItemRangeRemoved(int i, int i2) {
            if ((i + i2) - 1 < ListRowDataAdapter.this.mLastVisibleRowIndex) {
                ListRowDataAdapter.this.mLastVisibleRowIndex -= i2;
                onEventFired(8, i, i2);
                return;
            }
            int i3 = ListRowDataAdapter.this.mLastVisibleRowIndex;
            ListRowDataAdapter.this.initialize();
            int i4 = i3 - ListRowDataAdapter.this.mLastVisibleRowIndex;
            if (i4 > 0) {
                onEventFired(8, Math.min(ListRowDataAdapter.this.mLastVisibleRowIndex + 1, i), i4);
            }
        }

        @Override // androidx.leanback.widget.ObjectAdapter.DataObserver
        public void onChanged() {
            ListRowDataAdapter.this.initialize();
            onEventFired(16, -1, -1);
        }

        protected void onEventFired(int i, int i2, int i3) {
            ListRowDataAdapter.this.doNotify(i, i2, i3);
        }
    }

    /* loaded from: classes.dex */
    private class QueueBasedDataObserver extends ObjectAdapter.DataObserver {
        QueueBasedDataObserver() {
        }

        @Override // androidx.leanback.widget.ObjectAdapter.DataObserver
        public void onChanged() {
            ListRowDataAdapter.this.initialize();
            ListRowDataAdapter.this.notifyChanged();
        }
    }
}
