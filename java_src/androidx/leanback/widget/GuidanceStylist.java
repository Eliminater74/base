package androidx.leanback.widget;

import android.animation.Animator;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.leanback.C0393R;
import java.util.List;
/* loaded from: classes.dex */
public class GuidanceStylist implements FragmentAnimationProvider {
    private TextView mBreadcrumbView;
    private TextView mDescriptionView;
    private View mGuidanceContainer;
    private ImageView mIconView;
    private TextView mTitleView;

    @Override // androidx.leanback.widget.FragmentAnimationProvider
    public void onImeAppearing(List<Animator> list) {
    }

    @Override // androidx.leanback.widget.FragmentAnimationProvider
    public void onImeDisappearing(List<Animator> list) {
    }

    /* loaded from: classes.dex */
    public static class Guidance {
        private final String mBreadcrumb;
        private final String mDescription;
        private final Drawable mIconDrawable;
        private final String mTitle;

        public Guidance(String str, String str2, String str3, Drawable drawable) {
            this.mBreadcrumb = str3;
            this.mTitle = str;
            this.mDescription = str2;
            this.mIconDrawable = drawable;
        }

        public String getTitle() {
            return this.mTitle;
        }

        public String getDescription() {
            return this.mDescription;
        }

        public String getBreadcrumb() {
            return this.mBreadcrumb;
        }

        public Drawable getIconDrawable() {
            return this.mIconDrawable;
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Guidance guidance) {
        View inflate = layoutInflater.inflate(onProvideLayoutId(), viewGroup, false);
        this.mTitleView = (TextView) inflate.findViewById(C0393R.C0396id.guidance_title);
        this.mBreadcrumbView = (TextView) inflate.findViewById(C0393R.C0396id.guidance_breadcrumb);
        this.mDescriptionView = (TextView) inflate.findViewById(C0393R.C0396id.guidance_description);
        this.mIconView = (ImageView) inflate.findViewById(C0393R.C0396id.guidance_icon);
        this.mGuidanceContainer = inflate.findViewById(C0393R.C0396id.guidance_container);
        TextView textView = this.mTitleView;
        if (textView != null) {
            textView.setText(guidance.getTitle());
        }
        TextView textView2 = this.mBreadcrumbView;
        if (textView2 != null) {
            textView2.setText(guidance.getBreadcrumb());
        }
        TextView textView3 = this.mDescriptionView;
        if (textView3 != null) {
            textView3.setText(guidance.getDescription());
        }
        if (this.mIconView != null) {
            if (guidance.getIconDrawable() != null) {
                this.mIconView.setImageDrawable(guidance.getIconDrawable());
            } else {
                this.mIconView.setVisibility(8);
            }
        }
        View view = this.mGuidanceContainer;
        if (view != null && TextUtils.isEmpty(view.getContentDescription())) {
            StringBuilder sb = new StringBuilder();
            if (!TextUtils.isEmpty(guidance.getBreadcrumb())) {
                sb.append(guidance.getBreadcrumb()).append('\n');
            }
            if (!TextUtils.isEmpty(guidance.getTitle())) {
                sb.append(guidance.getTitle()).append('\n');
            }
            if (!TextUtils.isEmpty(guidance.getDescription())) {
                sb.append(guidance.getDescription()).append('\n');
            }
            this.mGuidanceContainer.setContentDescription(sb);
        }
        return inflate;
    }

    public void onDestroyView() {
        this.mBreadcrumbView = null;
        this.mDescriptionView = null;
        this.mIconView = null;
        this.mTitleView = null;
        this.mGuidanceContainer = null;
    }

    public int onProvideLayoutId() {
        return C0393R.layout.lb_guidance;
    }

    public TextView getTitleView() {
        return this.mTitleView;
    }

    public TextView getDescriptionView() {
        return this.mDescriptionView;
    }

    public TextView getBreadcrumbView() {
        return this.mBreadcrumbView;
    }

    public ImageView getIconView() {
        return this.mIconView;
    }
}
