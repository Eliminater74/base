package androidx.leanback.widget;

import android.util.Pair;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.TextView;
import androidx.leanback.widget.GuidedActionAdapter;
import androidx.leanback.widget.GuidedActionsStylist;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class GuidedActionAdapterGroup {
    private static final boolean DEBUG_EDIT = false;
    private static final String TAG_EDIT = "EditableAction";
    ArrayList<Pair<GuidedActionAdapter, GuidedActionAdapter>> mAdapters = new ArrayList<>();
    private GuidedActionAdapter.EditListener mEditListener;
    private boolean mImeOpened;

    public void addAdpter(GuidedActionAdapter guidedActionAdapter, GuidedActionAdapter guidedActionAdapter2) {
        this.mAdapters.add(new Pair<>(guidedActionAdapter, guidedActionAdapter2));
        if (guidedActionAdapter != null) {
            guidedActionAdapter.mGroup = this;
        }
        if (guidedActionAdapter2 != null) {
            guidedActionAdapter2.mGroup = this;
        }
    }

    public GuidedActionAdapter getNextAdapter(GuidedActionAdapter guidedActionAdapter) {
        for (int i = 0; i < this.mAdapters.size(); i++) {
            Pair<GuidedActionAdapter, GuidedActionAdapter> pair = this.mAdapters.get(i);
            if (pair.first == guidedActionAdapter) {
                return (GuidedActionAdapter) pair.second;
            }
        }
        return null;
    }

    public void setEditListener(GuidedActionAdapter.EditListener editListener) {
        this.mEditListener = editListener;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0018 A[LOOP:0: B:11:0x0018->B:14:0x0024, LOOP_START, PHI: r8 
      PHI: (r8v8 int) = (r8v2 int), (r8v9 int) binds: [B:10:0x0016, B:14:0x0024] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0027 A[LOOP:1: B:15:0x0027->B:18:0x0035, LOOP_START, PHI: r8 
      PHI: (r8v3 int) = (r8v2 int), (r8v4 int) binds: [B:10:0x0016, B:18:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0064  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0011 -> B:9:0x0012). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    boolean focusToNextAction(androidx.leanback.widget.GuidedActionAdapter r7, androidx.leanback.widget.GuidedAction r8, long r9) {
        /*
            r6 = this;
            r0 = -2
            int r0 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
            r1 = 1
            r2 = 0
            if (r0 != 0) goto L11
            int r8 = r7.indexOf(r8)
            if (r8 >= 0) goto Lf
            return r2
        Lf:
            int r8 = r8 + r1
            goto L12
        L11:
            r8 = r2
        L12:
            int r3 = r7.getCount()
            if (r0 != 0) goto L27
        L18:
            if (r8 >= r3) goto L38
            androidx.leanback.widget.GuidedAction r4 = r7.getItem(r8)
            boolean r4 = r4.isFocusable()
            if (r4 != 0) goto L38
            int r8 = r8 + 1
            goto L18
        L27:
            if (r8 >= r3) goto L38
            androidx.leanback.widget.GuidedAction r4 = r7.getItem(r8)
            long r4 = r4.getId()
            int r4 = (r4 > r9 ? 1 : (r4 == r9 ? 0 : -1))
            if (r4 == 0) goto L38
            int r8 = r8 + 1
            goto L27
        L38:
            if (r8 >= r3) goto L64
            androidx.leanback.widget.GuidedActionsStylist r9 = r7.getGuidedActionsStylist()
            androidx.leanback.widget.VerticalGridView r9 = r9.getActionsGridView()
            androidx.recyclerview.widget.RecyclerView$ViewHolder r8 = r9.findViewHolderForPosition(r8)
            androidx.leanback.widget.GuidedActionsStylist$ViewHolder r8 = (androidx.leanback.widget.GuidedActionsStylist.ViewHolder) r8
            if (r8 == 0) goto L63
            androidx.leanback.widget.GuidedAction r9 = r8.getAction()
            boolean r9 = r9.hasTextEditable()
            if (r9 == 0) goto L58
            r6.openIme(r7, r8)
            goto L62
        L58:
            android.view.View r7 = r8.itemView
            r6.closeIme(r7)
            android.view.View r7 = r8.itemView
            r7.requestFocus()
        L62:
            return r1
        L63:
            return r2
        L64:
            androidx.leanback.widget.GuidedActionAdapter r7 = r6.getNextAdapter(r7)
            if (r7 != 0) goto L11
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.leanback.widget.GuidedActionAdapterGroup.focusToNextAction(androidx.leanback.widget.GuidedActionAdapter, androidx.leanback.widget.GuidedAction, long):boolean");
    }

    public void openIme(GuidedActionAdapter guidedActionAdapter, GuidedActionsStylist.ViewHolder viewHolder) {
        guidedActionAdapter.getGuidedActionsStylist().setEditingMode(viewHolder, true);
        View editingView = viewHolder.getEditingView();
        if (editingView == null || !viewHolder.isInEditingText()) {
            return;
        }
        editingView.setFocusable(true);
        editingView.requestFocus();
        ((InputMethodManager) editingView.getContext().getSystemService("input_method")).showSoftInput(editingView, 0);
        if (this.mImeOpened) {
            return;
        }
        this.mImeOpened = true;
        this.mEditListener.onImeOpen();
    }

    public void closeIme(View view) {
        if (this.mImeOpened) {
            this.mImeOpened = false;
            ((InputMethodManager) view.getContext().getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 0);
            this.mEditListener.onImeClose();
        }
    }

    public void fillAndStay(GuidedActionAdapter guidedActionAdapter, TextView textView) {
        GuidedActionsStylist.ViewHolder findSubChildViewHolder = guidedActionAdapter.findSubChildViewHolder(textView);
        updateTextIntoAction(findSubChildViewHolder, textView);
        this.mEditListener.onGuidedActionEditCanceled(findSubChildViewHolder.getAction());
        guidedActionAdapter.getGuidedActionsStylist().setEditingMode(findSubChildViewHolder, false);
        closeIme(textView);
        findSubChildViewHolder.itemView.requestFocus();
    }

    public void fillAndGoNext(GuidedActionAdapter guidedActionAdapter, TextView textView) {
        GuidedActionsStylist.ViewHolder findSubChildViewHolder = guidedActionAdapter.findSubChildViewHolder(textView);
        updateTextIntoAction(findSubChildViewHolder, textView);
        guidedActionAdapter.performOnActionClick(findSubChildViewHolder);
        long onGuidedActionEditedAndProceed = this.mEditListener.onGuidedActionEditedAndProceed(findSubChildViewHolder.getAction());
        boolean z = false;
        guidedActionAdapter.getGuidedActionsStylist().setEditingMode(findSubChildViewHolder, false);
        if (onGuidedActionEditedAndProceed != -3 && onGuidedActionEditedAndProceed != findSubChildViewHolder.getAction().getId()) {
            z = focusToNextAction(guidedActionAdapter, findSubChildViewHolder.getAction(), onGuidedActionEditedAndProceed);
        }
        if (z) {
            return;
        }
        closeIme(textView);
        findSubChildViewHolder.itemView.requestFocus();
    }

    private void updateTextIntoAction(GuidedActionsStylist.ViewHolder viewHolder, TextView textView) {
        GuidedAction action = viewHolder.getAction();
        if (textView == viewHolder.getDescriptionView()) {
            if (action.getEditDescription() != null) {
                action.setEditDescription(textView.getText());
            } else {
                action.setDescription(textView.getText());
            }
        } else if (textView == viewHolder.getTitleView()) {
            if (action.getEditTitle() != null) {
                action.setEditTitle(textView.getText());
            } else {
                action.setTitle(textView.getText());
            }
        }
    }
}
