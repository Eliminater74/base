package androidx.leanback.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
public class ThumbsBar extends LinearLayout {
    final SparseArray<Bitmap> mBitmaps;
    int mHeroThumbHeightInPixel;
    int mHeroThumbWidthInPixel;
    private boolean mIsUserSets;
    int mMeasuredMarginInPixel;
    int mNumOfThumbs;
    int mThumbHeightInPixel;
    int mThumbWidthInPixel;

    public ThumbsBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ThumbsBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mNumOfThumbs = -1;
        this.mBitmaps = new SparseArray<>();
        this.mIsUserSets = false;
        this.mThumbWidthInPixel = context.getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_transport_thumbs_width);
        this.mThumbHeightInPixel = context.getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_transport_thumbs_height);
        this.mHeroThumbHeightInPixel = context.getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_transport_hero_thumbs_width);
        this.mHeroThumbWidthInPixel = context.getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_transport_hero_thumbs_height);
        this.mMeasuredMarginInPixel = context.getResources().getDimensionPixelSize(C0393R.dimen.lb_playback_transport_thumbs_margin);
    }

    public int getHeroIndex() {
        return getChildCount() / 2;
    }

    public void setThumbSize(int i, int i2) {
        boolean z;
        this.mThumbHeightInPixel = i2;
        this.mThumbWidthInPixel = i;
        int heroIndex = getHeroIndex();
        for (int i3 = 0; i3 < getChildCount(); i3++) {
            if (heroIndex != i3) {
                View childAt = getChildAt(i3);
                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt.getLayoutParams();
                boolean z2 = true;
                if (layoutParams.height != i2) {
                    layoutParams.height = i2;
                    z = true;
                } else {
                    z = false;
                }
                if (layoutParams.width != i) {
                    layoutParams.width = i;
                } else {
                    z2 = z;
                }
                if (z2) {
                    childAt.setLayoutParams(layoutParams);
                }
            }
        }
    }

    public void setHeroThumbSize(int i, int i2) {
        boolean z;
        this.mHeroThumbHeightInPixel = i2;
        this.mHeroThumbWidthInPixel = i;
        int heroIndex = getHeroIndex();
        for (int i3 = 0; i3 < getChildCount(); i3++) {
            if (heroIndex == i3) {
                View childAt = getChildAt(i3);
                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt.getLayoutParams();
                boolean z2 = true;
                if (layoutParams.height != i2) {
                    layoutParams.height = i2;
                    z = true;
                } else {
                    z = false;
                }
                if (layoutParams.width != i) {
                    layoutParams.width = i;
                } else {
                    z2 = z;
                }
                if (z2) {
                    childAt.setLayoutParams(layoutParams);
                }
            }
        }
    }

    public void setThumbSpace(int i) {
        this.mMeasuredMarginInPixel = i;
        requestLayout();
    }

    public void setNumberOfThumbs(int i) {
        this.mIsUserSets = true;
        this.mNumOfThumbs = i;
        setNumberOfThumbsInternal();
    }

    private void setNumberOfThumbsInternal() {
        while (getChildCount() > this.mNumOfThumbs) {
            removeView(getChildAt(getChildCount() - 1));
        }
        while (getChildCount() < this.mNumOfThumbs) {
            addView(createThumbView(this), new LinearLayout.LayoutParams(this.mThumbWidthInPixel, this.mThumbHeightInPixel));
        }
        int heroIndex = getHeroIndex();
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt.getLayoutParams();
            if (heroIndex == i) {
                layoutParams.width = this.mHeroThumbWidthInPixel;
                layoutParams.height = this.mHeroThumbHeightInPixel;
            } else {
                layoutParams.width = this.mThumbWidthInPixel;
                layoutParams.height = this.mThumbHeightInPixel;
            }
            childAt.setLayoutParams(layoutParams);
        }
    }

    private static int roundUp(int i, int i2) {
        return ((i + i2) - 1) / i2;
    }

    private int calculateNumOfThumbs(int i) {
        int roundUp = roundUp(i - this.mHeroThumbWidthInPixel, this.mThumbWidthInPixel + this.mMeasuredMarginInPixel);
        if (roundUp < 2) {
            roundUp = 2;
        } else if ((roundUp & 1) != 0) {
            roundUp++;
        }
        return roundUp + 1;
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int calculateNumOfThumbs;
        super.onMeasure(i, i2);
        int measuredWidth = getMeasuredWidth();
        if (this.mIsUserSets || this.mNumOfThumbs == (calculateNumOfThumbs = calculateNumOfThumbs(measuredWidth))) {
            return;
        }
        this.mNumOfThumbs = calculateNumOfThumbs;
        setNumberOfThumbsInternal();
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        int heroIndex = getHeroIndex();
        View childAt = getChildAt(heroIndex);
        int width = (getWidth() / 2) - (childAt.getMeasuredWidth() / 2);
        int width2 = (getWidth() / 2) + (childAt.getMeasuredWidth() / 2);
        childAt.layout(width, getPaddingTop(), width2, getPaddingTop() + childAt.getMeasuredHeight());
        int paddingTop = getPaddingTop() + (childAt.getMeasuredHeight() / 2);
        for (int i5 = heroIndex - 1; i5 >= 0; i5--) {
            int i6 = width - this.mMeasuredMarginInPixel;
            View childAt2 = getChildAt(i5);
            childAt2.layout(i6 - childAt2.getMeasuredWidth(), paddingTop - (childAt2.getMeasuredHeight() / 2), i6, (childAt2.getMeasuredHeight() / 2) + paddingTop);
            width = i6 - childAt2.getMeasuredWidth();
        }
        while (true) {
            heroIndex++;
            if (heroIndex >= this.mNumOfThumbs) {
                return;
            }
            int i7 = width2 + this.mMeasuredMarginInPixel;
            View childAt3 = getChildAt(heroIndex);
            childAt3.layout(i7, paddingTop - (childAt3.getMeasuredHeight() / 2), childAt3.getMeasuredWidth() + i7, (childAt3.getMeasuredHeight() / 2) + paddingTop);
            width2 = i7 + childAt3.getMeasuredWidth();
        }
    }

    protected View createThumbView(ViewGroup viewGroup) {
        return new ImageView(viewGroup.getContext());
    }

    public void clearThumbBitmaps() {
        for (int i = 0; i < getChildCount(); i++) {
            setThumbBitmap(i, null);
        }
        this.mBitmaps.clear();
    }

    public Bitmap getThumbBitmap(int i) {
        return this.mBitmaps.get(i);
    }

    public void setThumbBitmap(int i, Bitmap bitmap) {
        this.mBitmaps.put(i, bitmap);
        ((ImageView) getChildAt(i)).setImageBitmap(bitmap);
    }
}
