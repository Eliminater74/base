.class Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SlideKitkat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/transition/SlideKitkat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SlideAnimatorListener"
.end annotation


# instance fields
.field private mCanceled:Z

.field private final mEndValue:F

.field private final mFinalVisibility:I

.field private mPausedValue:F

.field private final mProp:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final mTerminalValue:F

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/util/Property;FFI)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;FFI)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mCanceled:Z

    iput-object p2, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iput-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iput p3, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mTerminalValue:F

    iput p4, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mEndValue:F

    iput p5, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mFinalVisibility:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3

    const/4 p1, 0x2

    new-array p1, p1, [F

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    const/4 v1, 0x0

    aput v0, p1, v1

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    const/4 v1, 0x1

    aput v0, p1, v1

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    sget v2, Landroidx/leanback/R$id;->lb_slide_transition_value:I

    invoke-virtual {v0, v2, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v2, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mTerminalValue:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean v1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mCanceled:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    iget-boolean p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mCanceled:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mTerminalValue:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mFinalVisibility:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onAnimationPause(Landroid/animation/Animator;)V
    .locals 2

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/util/Property;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mPausedValue:F

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mEndValue:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mFinalVisibility:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onAnimationResume(Landroid/animation/Animator;)V
    .locals 2

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mProp:Landroid/util/Property;

    iget-object v0, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    iget v1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mPausedValue:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/leanback/transition/SlideKitkat$SlideAnimatorListener;->mView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
