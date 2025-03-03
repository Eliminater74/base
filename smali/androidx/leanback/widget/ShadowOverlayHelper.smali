.class public final Landroidx/leanback/widget/ShadowOverlayHelper;
.super Ljava/lang/Object;
.source "ShadowOverlayHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/ShadowOverlayHelper$Options;,
        Landroidx/leanback/widget/ShadowOverlayHelper$Builder;
    }
.end annotation


# static fields
.field public static final SHADOW_DYNAMIC:I = 0x3

.field public static final SHADOW_NONE:I = 0x1

.field public static final SHADOW_STATIC:I = 0x2


# instance fields
.field mFocusedZ:F

.field mNeedsOverlay:Z

.field mNeedsRoundedCorner:Z

.field mNeedsShadow:Z

.field mNeedsWrapper:Z

.field mRoundedCornerRadius:I

.field mShadowType:I

.field mUnfocusedZ:F


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mShadowType:I

    return-void
.end method

.method static getNoneWrapperDynamicShadowImpl(Landroid/view/View;)Ljava/lang/Object;
    .locals 1

    sget v0, Landroidx/leanback/R$id;->lb_shadow_impl:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static setNoneWrapperOverlayColor(Landroid/view/View;I)V
    .locals 2

    invoke-static {p0}, Landroidx/leanback/widget/ForegroundHelper;->getForeground(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-static {p0, v0}, Landroidx/leanback/widget/ForegroundHelper;->setForeground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public static setNoneWrapperShadowFocusLevel(Landroid/view/View;F)V
    .locals 1

    invoke-static {p0}, Landroidx/leanback/widget/ShadowOverlayHelper;->getNoneWrapperDynamicShadowImpl(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    const/4 v0, 0x3

    invoke-static {p0, v0, p1}, Landroidx/leanback/widget/ShadowOverlayHelper;->setShadowFocusLevel(Ljava/lang/Object;IF)V

    return-void
.end method

.method static setShadowFocusLevel(Ljava/lang/Object;IF)V
    .locals 3

    if-eqz p0, :cond_4

    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    const/high16 v2, 0x3f800000    # 1.0f

    if-gez v1, :cond_0

    move p2, v0

    goto :goto_0

    :cond_0
    cmpl-float v0, p2, v2

    if-lez v0, :cond_1

    move p2, v2

    :cond_1
    :goto_0
    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {p0, p2}, Landroidx/leanback/widget/ShadowHelper;->setShadowFocusLevel(Ljava/lang/Object;F)V

    goto :goto_1

    :cond_3
    invoke-static {p0, p2}, Landroidx/leanback/widget/StaticShadowHelper;->setShadowFocusLevel(Ljava/lang/Object;F)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static supportsDynamicShadow()Z
    .locals 1

    invoke-static {}, Landroidx/leanback/widget/ShadowHelper;->supportsDynamicShadow()Z

    move-result v0

    return v0
.end method

.method public static supportsForeground()Z
    .locals 1

    invoke-static {}, Landroidx/leanback/widget/ForegroundHelper;->supportsForeground()Z

    move-result v0

    return v0
.end method

.method public static supportsRoundedCorner()Z
    .locals 1

    invoke-static {}, Landroidx/leanback/widget/RoundedRectHelper;->supportsRoundedCorner()Z

    move-result v0

    return v0
.end method

.method public static supportsShadow()Z
    .locals 1

    invoke-static {}, Landroidx/leanback/widget/StaticShadowHelper;->supportsShadow()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public createShadowOverlayContainer(Landroid/content/Context;)Landroidx/leanback/widget/ShadowOverlayContainer;
    .locals 8

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayHelper;->needsWrapper()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroidx/leanback/widget/ShadowOverlayContainer;

    iget v3, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mShadowType:I

    iget-boolean v4, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsOverlay:Z

    iget v5, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mUnfocusedZ:F

    iget v6, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mFocusedZ:F

    iget v7, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    move-object v1, v0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Landroidx/leanback/widget/ShadowOverlayContainer;-><init>(Landroid/content/Context;IZFFI)V

    return-object v0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public getShadowType()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mShadowType:I

    return v0
.end method

.method public needsOverlay()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsOverlay:Z

    return v0
.end method

.method public needsRoundedCorner()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsRoundedCorner:Z

    return v0
.end method

.method public needsWrapper()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsWrapper:Z

    return v0
.end method

.method public onViewCreated(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayHelper;->needsWrapper()Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsShadow:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsRoundedCorner:Z

    if-eqz v0, :cond_2

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    invoke-static {p1, v1, v0}, Landroidx/leanback/widget/RoundedRectHelper;->setClipToRoundedOutline(Landroid/view/View;ZI)V

    goto :goto_0

    :cond_0
    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mShadowType:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mUnfocusedZ:F

    iget v1, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mFocusedZ:F

    iget v2, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    invoke-static {p1, v0, v1, v2}, Landroidx/leanback/widget/ShadowHelper;->addDynamicShadow(Landroid/view/View;FFI)Ljava/lang/Object;

    move-result-object v0

    sget v1, Landroidx/leanback/R$id;->lb_shadow_impl:I

    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mNeedsRoundedCorner:Z

    if-eqz v0, :cond_2

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    invoke-static {p1, v1, v0}, Landroidx/leanback/widget/RoundedRectHelper;->setClipToRoundedOutline(Landroid/view/View;ZI)V

    :cond_2
    :goto_0
    return-void
.end method

.method public prepareParentForShadow(Landroid/view/ViewGroup;)V
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mShadowType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Landroidx/leanback/widget/StaticShadowHelper;->prepareParent(Landroid/view/ViewGroup;)V

    :cond_0
    return-void
.end method

.method public setOverlayColor(Landroid/view/View;I)V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayHelper;->needsWrapper()Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/leanback/widget/ShadowOverlayContainer;

    invoke-virtual {p1, p2}, Landroidx/leanback/widget/ShadowOverlayContainer;->setOverlayColor(I)V

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Landroidx/leanback/widget/ShadowOverlayHelper;->setNoneWrapperOverlayColor(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method public setShadowFocusLevel(Landroid/view/View;F)V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayHelper;->needsWrapper()Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/leanback/widget/ShadowOverlayContainer;

    invoke-virtual {p1, p2}, Landroidx/leanback/widget/ShadowOverlayContainer;->setShadowFocusLevel(F)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Landroidx/leanback/widget/ShadowOverlayHelper;->getNoneWrapperDynamicShadowImpl(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x3

    invoke-static {p1, v0, p2}, Landroidx/leanback/widget/ShadowOverlayHelper;->setShadowFocusLevel(Ljava/lang/Object;IF)V

    :goto_0
    return-void
.end method

.method setupDynamicShadowZ(Landroidx/leanback/widget/ShadowOverlayHelper$Options;Landroid/content/Context;)V
    .locals 2

    invoke-virtual {p1}, Landroidx/leanback/widget/ShadowOverlayHelper$Options;->getDynamicShadowUnfocusedZ()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Landroidx/leanback/R$dimen;->lb_material_shadow_focused_z:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mFocusedZ:F

    sget p2, Landroidx/leanback/R$dimen;->lb_material_shadow_normal_z:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mUnfocusedZ:F

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/leanback/widget/ShadowOverlayHelper$Options;->getDynamicShadowFocusedZ()F

    move-result p2

    iput p2, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mFocusedZ:F

    invoke-virtual {p1}, Landroidx/leanback/widget/ShadowOverlayHelper$Options;->getDynamicShadowUnfocusedZ()F

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mUnfocusedZ:F

    :goto_0
    return-void
.end method

.method setupRoundedCornerRadius(Landroidx/leanback/widget/ShadowOverlayHelper$Options;Landroid/content/Context;)V
    .locals 1

    invoke-virtual {p1}, Landroidx/leanback/widget/ShadowOverlayHelper$Options;->getRoundedCornerRadius()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Landroidx/leanback/R$dimen;->lb_rounded_rect_corner_radius:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/leanback/widget/ShadowOverlayHelper$Options;->getRoundedCornerRadius()I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayHelper;->mRoundedCornerRadius:I

    :goto_0
    return-void
.end method
