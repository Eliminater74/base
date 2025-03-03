.class public Landroidx/leanback/widget/ShadowOverlayContainer;
.super Landroid/widget/FrameLayout;
.source "ShadowOverlayContainer.java"


# static fields
.field public static final SHADOW_DYNAMIC:I = 0x3

.field public static final SHADOW_NONE:I = 0x1

.field public static final SHADOW_STATIC:I = 0x2

.field private static final sTempRect:Landroid/graphics/Rect;


# instance fields
.field private mFocusedZ:F

.field private mInitialized:Z

.field mOverlayColor:I

.field private mOverlayPaint:Landroid/graphics/Paint;

.field private mRoundedCornerRadius:I

.field private mRoundedCorners:Z

.field private mShadowImpl:Ljava/lang/Object;

.field private mShadowType:I

.field private mUnfocusedZ:F

.field private mWrappedView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Landroidx/leanback/widget/ShadowOverlayContainer;->sTempRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/leanback/widget/ShadowOverlayContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;IZFFI)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    iput p4, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mUnfocusedZ:F

    iput p5, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mFocusedZ:F

    invoke-virtual {p0, p2, p3, p6}, Landroidx/leanback/widget/ShadowOverlayContainer;->initialize(IZI)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/leanback/widget/ShadowOverlayContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->useStaticShadow()V

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->useDynamicShadow()V

    return-void
.end method

.method public static prepareParentForShadow(Landroid/view/ViewGroup;)V
    .locals 0

    invoke-static {p0}, Landroidx/leanback/widget/StaticShadowHelper;->prepareParent(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static supportsDynamicShadow()Z
    .locals 1

    invoke-static {}, Landroidx/leanback/widget/ShadowHelper;->supportsDynamicShadow()Z

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
.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayColor:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v2, v0

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v3, v0

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v4, v0

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v5, v0

    iget-object v6, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public getShadowType()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    return v0
.end method

.method public getWrappedView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    return-object v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method initialize(IZI)V
    .locals 3

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mInitialized:Z

    if-nez v0, :cond_4

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mInitialized:Z

    iput p3, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mRoundedCornerRadius:I

    const/4 v1, 0x0

    if-lez p3, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    iput-boolean v2, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mRoundedCorners:Z

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    const/4 v2, 0x2

    if-eq p1, v2, :cond_2

    const/4 v2, 0x3

    if-eq p1, v2, :cond_1

    goto :goto_1

    :cond_1
    iget p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mUnfocusedZ:F

    iget v2, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mFocusedZ:F

    invoke-static {p0, p1, v2, p3}, Landroidx/leanback/widget/ShadowHelper;->addDynamicShadow(Landroid/view/View;FFI)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowImpl:Ljava/lang/Object;

    goto :goto_1

    :cond_2
    invoke-static {p0}, Landroidx/leanback/widget/StaticShadowHelper;->addStaticShadow(Landroid/view/ViewGroup;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowImpl:Ljava/lang/Object;

    :goto_1
    if-eqz p2, :cond_3

    invoke-virtual {p0, v1}, Landroidx/leanback/widget/ShadowOverlayContainer;->setWillNotDraw(Z)V

    iput v1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayColor:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    iget p2, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayColor:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_2

    :cond_3
    invoke-virtual {p0, v0}, Landroidx/leanback/widget/ShadowOverlayContainer;->setWillNotDraw(Z)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    :goto_2
    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public initialize(ZZ)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroidx/leanback/widget/ShadowOverlayContainer;->initialize(ZZZ)V

    return-void
.end method

.method public initialize(ZZZ)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    iget p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Landroidx/leanback/R$dimen;->lb_rounded_rect_corner_radius:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    goto :goto_1

    :cond_1
    const/4 p3, 0x0

    :goto_1
    invoke-virtual {p0, p1, p2, p3}, Landroidx/leanback/widget/ShadowOverlayContainer;->initialize(IZI)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    if-eqz p1, :cond_0

    sget-object p2, Landroidx/leanback/widget/ShadowOverlayContainer;->sTempRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/View;->getPivotX()F

    move-result p1

    float-to-int p1, p1

    iput p1, p2, Landroid/graphics/Rect;->left:I

    iget-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPivotY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p2, Landroid/graphics/Rect;->top:I

    iget-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Landroidx/leanback/widget/ShadowOverlayContainer;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget p1, p2, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/ShadowOverlayContainer;->setPivotX(F)V

    iget p1, p2, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/ShadowOverlayContainer;->setPivotY(F)V

    :cond_0
    return-void
.end method

.method public setOverlayColor(I)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    iget v1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayColor:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mOverlayColor:I

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->invalidate()V

    :cond_0
    return-void
.end method

.method public setShadowFocusLevel(F)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowImpl:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget v1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    invoke-static {v0, v1, p1}, Landroidx/leanback/widget/ShadowOverlayHelper;->setShadowFocusLevel(Ljava/lang/Object;IF)V

    :cond_0
    return-void
.end method

.method public useDynamicShadow()V
    .locals 3

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_material_shadow_normal_z:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0}, Landroidx/leanback/widget/ShadowOverlayContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Landroidx/leanback/R$dimen;->lb_material_shadow_focused_z:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroidx/leanback/widget/ShadowOverlayContainer;->useDynamicShadow(FF)V

    return-void
.end method

.method public useDynamicShadow(FF)V
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mInitialized:Z

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/leanback/widget/ShadowOverlayContainer;->supportsDynamicShadow()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    iput v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    iput p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mUnfocusedZ:F

    iput p2, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mFocusedZ:F

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already initialized"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public useStaticShadow()V
    .locals 2

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mInitialized:Z

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/leanback/widget/ShadowOverlayContainer;->supportsShadow()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public wrap(Landroid/view/View;)V
    .locals 5

    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mInitialized:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v3, -0x2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v2, v4, :cond_1

    move v3, v4

    :cond_1
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/ShadowOverlayContainer;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p1, v1}, Landroidx/leanback/widget/ShadowOverlayContainer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0, p1}, Landroidx/leanback/widget/ShadowOverlayContainer;->addView(Landroid/view/View;)V

    :goto_1
    iget-boolean v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mRoundedCorners:Z

    if-eqz v0, :cond_3

    iget v0, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mShadowType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    const/4 v0, 0x1

    invoke-static {p0, v0}, Landroidx/leanback/widget/RoundedRectHelper;->setClipToRoundedOutline(Landroid/view/View;Z)V

    :cond_3
    iput-object p1, p0, Landroidx/leanback/widget/ShadowOverlayContainer;->mWrappedView:Landroid/view/View;

    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method
