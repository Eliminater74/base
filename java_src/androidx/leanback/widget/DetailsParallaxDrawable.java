package androidx.leanback.widget;

import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.Property;
import android.util.TypedValue;
import androidx.leanback.C0393R;
import androidx.leanback.graphics.CompositeDrawable;
import androidx.leanback.graphics.FitWidthBitmapDrawable;
import androidx.leanback.widget.Parallax;
import androidx.leanback.widget.ParallaxTarget;
/* loaded from: classes.dex */
public class DetailsParallaxDrawable extends CompositeDrawable {
    private Drawable mBottomDrawable;

    public DetailsParallaxDrawable(Context context, DetailsParallax detailsParallax, Drawable drawable, ParallaxTarget parallaxTarget) {
        init(context, detailsParallax, drawable, new ColorDrawable(), parallaxTarget);
    }

    public DetailsParallaxDrawable(Context context, DetailsParallax detailsParallax, Drawable drawable, Drawable drawable2, ParallaxTarget parallaxTarget) {
        init(context, detailsParallax, drawable, drawable2, parallaxTarget);
    }

    public DetailsParallaxDrawable(Context context, DetailsParallax detailsParallax) {
        FitWidthBitmapDrawable fitWidthBitmapDrawable = new FitWidthBitmapDrawable();
        init(context, detailsParallax, fitWidthBitmapDrawable, new ColorDrawable(), new ParallaxTarget.PropertyValuesHolderTarget(fitWidthBitmapDrawable, PropertyValuesHolder.ofInt("verticalOffset", 0, -context.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_cover_drawable_parallax_movement))));
    }

    void init(Context context, DetailsParallax detailsParallax, Drawable drawable, Drawable drawable2, ParallaxTarget parallaxTarget) {
        if (drawable2 instanceof ColorDrawable) {
            ColorDrawable colorDrawable = (ColorDrawable) drawable2;
            if (colorDrawable.getColor() == 0) {
                colorDrawable.setColor(getDefaultBackgroundColor(context));
            }
        }
        addChildDrawable(drawable);
        this.mBottomDrawable = drawable2;
        addChildDrawable(drawable2);
        connect(context, detailsParallax, parallaxTarget);
    }

    private static int getDefaultBackgroundColor(Context context) {
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(C0393R.attr.defaultBrandColorDark, typedValue, true)) {
            return context.getResources().getColor(typedValue.resourceId);
        }
        return context.getResources().getColor(C0393R.C0394color.lb_default_brand_color_dark);
    }

    public Drawable getCoverDrawable() {
        return getChildAt(0).getDrawable();
    }

    public Drawable getBottomDrawable() {
        return this.mBottomDrawable;
    }

    public void setSolidColor(int i) {
        ((ColorDrawable) this.mBottomDrawable).setColor(i);
    }

    public int getSolidColor() {
        return ((ColorDrawable) this.mBottomDrawable).getColor();
    }

    void connect(Context context, DetailsParallax detailsParallax, ParallaxTarget parallaxTarget) {
        Parallax.IntProperty overviewRowTop = detailsParallax.getOverviewRowTop();
        Parallax.IntProperty overviewRowBottom = detailsParallax.getOverviewRowBottom();
        detailsParallax.addEffect(overviewRowTop.atAbsolute(context.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_align_pos_for_actions)), overviewRowTop.atAbsolute(context.getResources().getDimensionPixelSize(C0393R.dimen.lb_details_v2_align_pos_for_description))).target(parallaxTarget);
        detailsParallax.addEffect(overviewRowBottom.atMax(), overviewRowBottom.atMin()).target((ParallaxEffect) getChildAt(1), (Property<ParallaxEffect, V>) CompositeDrawable.ChildDrawable.TOP_ABSOLUTE);
        detailsParallax.addEffect(overviewRowTop.atMax(), overviewRowTop.atMin()).target((ParallaxEffect) getChildAt(0), (Property<ParallaxEffect, V>) CompositeDrawable.ChildDrawable.BOTTOM_ABSOLUTE);
    }
}
