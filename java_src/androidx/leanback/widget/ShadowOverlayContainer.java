package androidx.leanback.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
public class ShadowOverlayContainer extends FrameLayout {
    public static final int SHADOW_DYNAMIC = 3;
    public static final int SHADOW_NONE = 1;
    public static final int SHADOW_STATIC = 2;
    private static final Rect sTempRect = new Rect();
    private float mFocusedZ;
    private boolean mInitialized;
    int mOverlayColor;
    private Paint mOverlayPaint;
    private int mRoundedCornerRadius;
    private boolean mRoundedCorners;
    private Object mShadowImpl;
    private int mShadowType;
    private float mUnfocusedZ;
    private View mWrappedView;

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    public ShadowOverlayContainer(Context context) {
        this(context, null, 0);
    }

    public ShadowOverlayContainer(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ShadowOverlayContainer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mShadowType = 1;
        useStaticShadow();
        useDynamicShadow();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ShadowOverlayContainer(Context context, int i, boolean z, float f, float f2, int i2) {
        super(context);
        this.mShadowType = 1;
        this.mUnfocusedZ = f;
        this.mFocusedZ = f2;
        initialize(i, z, i2);
    }

    public static boolean supportsShadow() {
        return StaticShadowHelper.supportsShadow();
    }

    public static boolean supportsDynamicShadow() {
        return ShadowHelper.supportsDynamicShadow();
    }

    public static void prepareParentForShadow(ViewGroup viewGroup) {
        StaticShadowHelper.prepareParent(viewGroup);
    }

    public void useDynamicShadow() {
        useDynamicShadow(getResources().getDimension(C0393R.dimen.lb_material_shadow_normal_z), getResources().getDimension(C0393R.dimen.lb_material_shadow_focused_z));
    }

    public void useDynamicShadow(float f, float f2) {
        if (this.mInitialized) {
            throw new IllegalStateException("Already initialized");
        }
        if (supportsDynamicShadow()) {
            this.mShadowType = 3;
            this.mUnfocusedZ = f;
            this.mFocusedZ = f2;
        }
    }

    public void useStaticShadow() {
        if (this.mInitialized) {
            throw new IllegalStateException("Already initialized");
        }
        if (supportsShadow()) {
            this.mShadowType = 2;
        }
    }

    public int getShadowType() {
        return this.mShadowType;
    }

    @Deprecated
    public void initialize(boolean z, boolean z2) {
        initialize(z, z2, true);
    }

    @Deprecated
    public void initialize(boolean z, boolean z2, boolean z3) {
        initialize(!z ? 1 : this.mShadowType, z2, z3 ? getContext().getResources().getDimensionPixelSize(C0393R.dimen.lb_rounded_rect_corner_radius) : 0);
    }

    void initialize(int i, boolean z, int i2) {
        if (this.mInitialized) {
            throw new IllegalStateException();
        }
        this.mInitialized = true;
        this.mRoundedCornerRadius = i2;
        this.mRoundedCorners = i2 > 0;
        this.mShadowType = i;
        if (i == 2) {
            this.mShadowImpl = StaticShadowHelper.addStaticShadow(this);
        } else if (i == 3) {
            this.mShadowImpl = ShadowHelper.addDynamicShadow(this, this.mUnfocusedZ, this.mFocusedZ, i2);
        }
        if (z) {
            setWillNotDraw(false);
            this.mOverlayColor = 0;
            Paint paint = new Paint();
            this.mOverlayPaint = paint;
            paint.setColor(this.mOverlayColor);
            this.mOverlayPaint.setStyle(Paint.Style.FILL);
            return;
        }
        setWillNotDraw(true);
        this.mOverlayPaint = null;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.mOverlayPaint == null || this.mOverlayColor == 0) {
            return;
        }
        canvas.drawRect(this.mWrappedView.getLeft(), this.mWrappedView.getTop(), this.mWrappedView.getRight(), this.mWrappedView.getBottom(), this.mOverlayPaint);
    }

    public void setShadowFocusLevel(float f) {
        Object obj = this.mShadowImpl;
        if (obj != null) {
            ShadowOverlayHelper.setShadowFocusLevel(obj, this.mShadowType, f);
        }
    }

    public void setOverlayColor(int i) {
        Paint paint = this.mOverlayPaint;
        if (paint == null || i == this.mOverlayColor) {
            return;
        }
        this.mOverlayColor = i;
        paint.setColor(i);
        invalidate();
    }

    public void wrap(View view) {
        if (!this.mInitialized || this.mWrappedView != null) {
            throw new IllegalStateException();
        }
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams != null) {
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(layoutParams.width, layoutParams.height);
            layoutParams.width = layoutParams.width == -1 ? -1 : -2;
            layoutParams.height = layoutParams.height == -1 ? -1 : -2;
            setLayoutParams(layoutParams);
            addView(view, layoutParams2);
        } else {
            addView(view);
        }
        if (this.mRoundedCorners && this.mShadowType != 3) {
            RoundedRectHelper.setClipToRoundedOutline(this, true);
        }
        this.mWrappedView = view;
    }

    public View getWrappedView() {
        return this.mWrappedView;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        View view;
        super.onLayout(z, i, i2, i3, i4);
        if (!z || (view = this.mWrappedView) == null) {
            return;
        }
        Rect rect = sTempRect;
        rect.left = (int) view.getPivotX();
        rect.top = (int) this.mWrappedView.getPivotY();
        offsetDescendantRectToMyCoords(this.mWrappedView, rect);
        setPivotX(rect.left);
        setPivotY(rect.top);
    }
}
