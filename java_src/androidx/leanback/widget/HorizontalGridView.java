package androidx.leanback.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.util.AttributeSet;
import androidx.core.view.ViewCompat;
/* loaded from: classes.dex */
public class HorizontalGridView extends BaseGridView {
    private boolean mFadingHighEdge;
    private boolean mFadingLowEdge;
    private LinearGradient mHighFadeShader;
    private int mHighFadeShaderLength;
    private int mHighFadeShaderOffset;
    private LinearGradient mLowFadeShader;
    private int mLowFadeShaderLength;
    private int mLowFadeShaderOffset;
    private Bitmap mTempBitmapHigh;
    private Bitmap mTempBitmapLow;
    private Paint mTempPaint;
    private final Rect mTempRect;

    public HorizontalGridView(Context context) {
        this(context, null);
    }

    public HorizontalGridView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public HorizontalGridView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mTempPaint = new Paint();
        this.mTempRect = new Rect();
        this.mLayoutManager.setOrientation(0);
        initAttributes(context, attributeSet);
    }

    protected void initAttributes(Context context, AttributeSet attributeSet) {
        initBaseGridViewAttributes(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0695R.styleable.lbHorizontalGridView);
        ViewCompat.saveAttributeDataForStyleable(this, context, C0695R.styleable.lbHorizontalGridView, attributeSet, obtainStyledAttributes, 0, 0);
        setRowHeight(obtainStyledAttributes);
        setNumRows(obtainStyledAttributes.getInt(C0695R.styleable.lbHorizontalGridView_numberOfRows, 1));
        obtainStyledAttributes.recycle();
        updateLayerType();
        Paint paint = new Paint();
        this.mTempPaint = paint;
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
    }

    void setRowHeight(TypedArray typedArray) {
        if (typedArray.peekValue(C0695R.styleable.lbHorizontalGridView_rowHeight) != null) {
            setRowHeight(typedArray.getLayoutDimension(C0695R.styleable.lbHorizontalGridView_rowHeight, 0));
        }
    }

    public void setNumRows(int i) {
        this.mLayoutManager.setNumRows(i);
        requestLayout();
    }

    public void setRowHeight(int i) {
        this.mLayoutManager.setRowHeight(i);
        requestLayout();
    }

    public final void setFadingLeftEdge(boolean z) {
        if (this.mFadingLowEdge != z) {
            this.mFadingLowEdge = z;
            if (!z) {
                this.mTempBitmapLow = null;
            }
            invalidate();
            updateLayerType();
        }
    }

    public final boolean getFadingLeftEdge() {
        return this.mFadingLowEdge;
    }

    public final void setFadingLeftEdgeLength(int i) {
        if (this.mLowFadeShaderLength != i) {
            this.mLowFadeShaderLength = i;
            if (i != 0) {
                this.mLowFadeShader = new LinearGradient(0.0f, 0.0f, this.mLowFadeShaderLength, 0.0f, 0, (int) ViewCompat.MEASURED_STATE_MASK, Shader.TileMode.CLAMP);
            } else {
                this.mLowFadeShader = null;
            }
            invalidate();
        }
    }

    public final int getFadingLeftEdgeLength() {
        return this.mLowFadeShaderLength;
    }

    public final void setFadingLeftEdgeOffset(int i) {
        if (this.mLowFadeShaderOffset != i) {
            this.mLowFadeShaderOffset = i;
            invalidate();
        }
    }

    public final int getFadingLeftEdgeOffset() {
        return this.mLowFadeShaderOffset;
    }

    public final void setFadingRightEdge(boolean z) {
        if (this.mFadingHighEdge != z) {
            this.mFadingHighEdge = z;
            if (!z) {
                this.mTempBitmapHigh = null;
            }
            invalidate();
            updateLayerType();
        }
    }

    public final boolean getFadingRightEdge() {
        return this.mFadingHighEdge;
    }

    public final void setFadingRightEdgeLength(int i) {
        if (this.mHighFadeShaderLength != i) {
            this.mHighFadeShaderLength = i;
            if (i != 0) {
                this.mHighFadeShader = new LinearGradient(0.0f, 0.0f, this.mHighFadeShaderLength, 0.0f, (int) ViewCompat.MEASURED_STATE_MASK, 0, Shader.TileMode.CLAMP);
            } else {
                this.mHighFadeShader = null;
            }
            invalidate();
        }
    }

    public final int getFadingRightEdgeLength() {
        return this.mHighFadeShaderLength;
    }

    public final void setFadingRightEdgeOffset(int i) {
        if (this.mHighFadeShaderOffset != i) {
            this.mHighFadeShaderOffset = i;
            invalidate();
        }
    }

    public final int getFadingRightEdgeOffset() {
        return this.mHighFadeShaderOffset;
    }

    private boolean needsFadingLowEdge() {
        if (this.mFadingLowEdge) {
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                if (this.mLayoutManager.getOpticalLeft(getChildAt(i)) < getPaddingLeft() - this.mLowFadeShaderOffset) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    private boolean needsFadingHighEdge() {
        if (this.mFadingHighEdge) {
            for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
                if (this.mLayoutManager.getOpticalRight(getChildAt(childCount)) > (getWidth() - getPaddingRight()) + this.mHighFadeShaderOffset) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    private Bitmap getTempBitmapLow() {
        Bitmap bitmap = this.mTempBitmapLow;
        if (bitmap == null || bitmap.getWidth() != this.mLowFadeShaderLength || this.mTempBitmapLow.getHeight() != getHeight()) {
            this.mTempBitmapLow = Bitmap.createBitmap(this.mLowFadeShaderLength, getHeight(), Bitmap.Config.ARGB_8888);
        }
        return this.mTempBitmapLow;
    }

    private Bitmap getTempBitmapHigh() {
        Bitmap bitmap = this.mTempBitmapHigh;
        if (bitmap == null || bitmap.getWidth() != this.mHighFadeShaderLength || this.mTempBitmapHigh.getHeight() != getHeight()) {
            this.mTempBitmapHigh = Bitmap.createBitmap(this.mHighFadeShaderLength, getHeight(), Bitmap.Config.ARGB_8888);
        }
        return this.mTempBitmapHigh;
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public void draw(Canvas canvas) {
        boolean needsFadingLowEdge = needsFadingLowEdge();
        boolean needsFadingHighEdge = needsFadingHighEdge();
        if (!needsFadingLowEdge) {
            this.mTempBitmapLow = null;
        }
        if (!needsFadingHighEdge) {
            this.mTempBitmapHigh = null;
        }
        if (!needsFadingLowEdge && !needsFadingHighEdge) {
            super.draw(canvas);
            return;
        }
        int paddingLeft = this.mFadingLowEdge ? (getPaddingLeft() - this.mLowFadeShaderOffset) - this.mLowFadeShaderLength : 0;
        int width = this.mFadingHighEdge ? (getWidth() - getPaddingRight()) + this.mHighFadeShaderOffset + this.mHighFadeShaderLength : getWidth();
        int save = canvas.save();
        canvas.clipRect((this.mFadingLowEdge ? this.mLowFadeShaderLength : 0) + paddingLeft, 0, width - (this.mFadingHighEdge ? this.mHighFadeShaderLength : 0), getHeight());
        super.draw(canvas);
        canvas.restoreToCount(save);
        Canvas canvas2 = new Canvas();
        this.mTempRect.top = 0;
        this.mTempRect.bottom = getHeight();
        if (needsFadingLowEdge && this.mLowFadeShaderLength > 0) {
            Bitmap tempBitmapLow = getTempBitmapLow();
            tempBitmapLow.eraseColor(0);
            canvas2.setBitmap(tempBitmapLow);
            int save2 = canvas2.save();
            canvas2.clipRect(0, 0, this.mLowFadeShaderLength, getHeight());
            float f = -paddingLeft;
            canvas2.translate(f, 0.0f);
            super.draw(canvas2);
            canvas2.restoreToCount(save2);
            this.mTempPaint.setShader(this.mLowFadeShader);
            canvas2.drawRect(0.0f, 0.0f, this.mLowFadeShaderLength, getHeight(), this.mTempPaint);
            this.mTempRect.left = 0;
            this.mTempRect.right = this.mLowFadeShaderLength;
            canvas.translate(paddingLeft, 0.0f);
            Rect rect = this.mTempRect;
            canvas.drawBitmap(tempBitmapLow, rect, rect, (Paint) null);
            canvas.translate(f, 0.0f);
        }
        if (!needsFadingHighEdge || this.mHighFadeShaderLength <= 0) {
            return;
        }
        Bitmap tempBitmapHigh = getTempBitmapHigh();
        tempBitmapHigh.eraseColor(0);
        canvas2.setBitmap(tempBitmapHigh);
        int save3 = canvas2.save();
        canvas2.clipRect(0, 0, this.mHighFadeShaderLength, getHeight());
        canvas2.translate(-(width - this.mHighFadeShaderLength), 0.0f);
        super.draw(canvas2);
        canvas2.restoreToCount(save3);
        this.mTempPaint.setShader(this.mHighFadeShader);
        canvas2.drawRect(0.0f, 0.0f, this.mHighFadeShaderLength, getHeight(), this.mTempPaint);
        this.mTempRect.left = 0;
        this.mTempRect.right = this.mHighFadeShaderLength;
        canvas.translate(width - this.mHighFadeShaderLength, 0.0f);
        Rect rect2 = this.mTempRect;
        canvas.drawBitmap(tempBitmapHigh, rect2, rect2, (Paint) null);
        canvas.translate(-(width - this.mHighFadeShaderLength), 0.0f);
    }

    private void updateLayerType() {
        if (this.mFadingLowEdge || this.mFadingHighEdge) {
            setLayerType(2, null);
            setWillNotDraw(false);
            return;
        }
        setLayerType(0, null);
        setWillNotDraw(true);
    }
}
