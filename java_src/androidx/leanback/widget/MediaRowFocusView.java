package androidx.leanback.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import androidx.leanback.C0393R;
/* loaded from: classes.dex */
class MediaRowFocusView extends View {
    private final Paint mPaint;
    private final RectF mRoundRectF;
    private int mRoundRectRadius;

    public MediaRowFocusView(Context context) {
        super(context);
        this.mRoundRectF = new RectF();
        this.mPaint = createPaint(context);
    }

    public MediaRowFocusView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mRoundRectF = new RectF();
        this.mPaint = createPaint(context);
    }

    public MediaRowFocusView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mRoundRectF = new RectF();
        this.mPaint = createPaint(context);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int height = getHeight() / 2;
        this.mRoundRectRadius = height;
        int height2 = ((height * 2) - getHeight()) / 2;
        this.mRoundRectF.set(0.0f, -height2, getWidth(), getHeight() + height2);
        RectF rectF = this.mRoundRectF;
        int i = this.mRoundRectRadius;
        canvas.drawRoundRect(rectF, i, i, this.mPaint);
    }

    private Paint createPaint(Context context) {
        Paint paint = new Paint();
        paint.setColor(context.getResources().getColor(C0393R.C0394color.lb_playback_media_row_highlight_color));
        return paint;
    }

    public int getRoundRectRadius() {
        return this.mRoundRectRadius;
    }
}
