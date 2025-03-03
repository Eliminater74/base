package androidx.leanback.animation;

import android.animation.TimeInterpolator;
/* loaded from: classes.dex */
public class LogDecelerateInterpolator implements TimeInterpolator {
    int mBase;
    int mDrift;
    final float mLogScale;

    public LogDecelerateInterpolator(int i, int i2) {
        this.mBase = i;
        this.mDrift = i2;
        this.mLogScale = 1.0f / computeLog(1.0f, i, i2);
    }

    static float computeLog(float f, int i, int i2) {
        return ((float) (-Math.pow(i, -f))) + 1.0f + (i2 * f);
    }

    @Override // android.animation.TimeInterpolator
    public float getInterpolation(float f) {
        return computeLog(f, this.mBase, this.mDrift) * this.mLogScale;
    }
}
