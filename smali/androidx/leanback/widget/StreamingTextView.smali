.class Landroidx/leanback/widget/StreamingTextView;
.super Landroid/widget/EditText;
.source "StreamingTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/StreamingTextView$DottySpan;
    }
.end annotation


# static fields
.field private static final ACCESSIBILITY_CLASS_NAME:Ljava/lang/String; = "androidx.leanback.widget.StreamingTextView"

.field static final ANIMATE_DOTS_FOR_PENDING:Z = true

.field private static final DEBUG:Z = false

.field private static final DOTS_FOR_PENDING:Z = true

.field private static final DOTS_FOR_STABLE:Z = false

.field private static final SPLIT_PATTERN:Ljava/util/regex/Pattern;

.field private static final STREAM_POSITION_PROPERTY:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroidx/leanback/widget/StreamingTextView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final STREAM_UPDATE_DELAY_MILLIS:J = 0x32L

.field private static final TAG:Ljava/lang/String; = "StreamingTextView"

.field private static final TEXT_DOT_SCALE:F = 1.3f


# instance fields
.field mOneDot:Landroid/graphics/Bitmap;

.field final mRandom:Ljava/util/Random;

.field mStreamPosition:I

.field private mStreamingAnimation:Landroid/animation/ObjectAnimator;

.field mTwoDot:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "\\S+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/leanback/widget/StreamingTextView;->SPLIT_PATTERN:Ljava/util/regex/Pattern;

    new-instance v0, Landroidx/leanback/widget/StreamingTextView$1;

    const-class v1, Ljava/lang/Integer;

    const-string v2, "streamPosition"

    invoke-direct {v0, v1, v2}, Landroidx/leanback/widget/StreamingTextView$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Landroidx/leanback/widget/StreamingTextView;->STREAM_POSITION_PROPERTY:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Landroidx/leanback/widget/StreamingTextView;->mRandom:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Landroidx/leanback/widget/StreamingTextView;->mRandom:Ljava/util/Random;

    return-void
.end method

.method private addColorSpan(Landroid/text/SpannableStringBuilder;ILjava/lang/String;I)V
    .locals 1

    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, p4

    const/16 p3, 0x21

    invoke-virtual {p1, v0, p4, p2, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method private addDottySpans(Landroid/text/SpannableStringBuilder;Ljava/lang/String;I)V
    .locals 5

    sget-object v0, Landroidx/leanback/widget/StreamingTextView;->SPLIT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    add-int/2addr v1, p3

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    add-int/2addr v2, p3

    new-instance v3, Landroidx/leanback/widget/StreamingTextView$DottySpan;

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-direct {v3, p0, v4, v1}, Landroidx/leanback/widget/StreamingTextView$DottySpan;-><init>(Landroidx/leanback/widget/StreamingTextView;II)V

    const/16 v4, 0x21

    invoke-virtual {p1, v3, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private cancelStreamAnimation()V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private getScaledBitmap(IF)Landroid/graphics/Bitmap;
    .locals 2

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    float-to-int p2, v1

    const/4 v1, 0x0

    invoke-static {p1, v0, p2, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public static isLayoutRtl(Landroid/view/View;)Z
    .locals 1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private startStreamAnimation()V
    .locals 6

    invoke-direct {p0}, Landroidx/leanback/widget/StreamingTextView;->cancelStreamAnimation()V

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->getStreamPosition()I

    move-result v0

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->length()I

    move-result v1

    sub-int v2, v1, v0

    if-lez v2, :cond_1

    iget-object v3, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    if-nez v3, :cond_0

    new-instance v3, Landroid/animation/ObjectAnimator;

    invoke-direct {v3}, Landroid/animation/ObjectAnimator;-><init>()V

    iput-object v3, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v3, p0}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    iget-object v3, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    sget-object v4, Landroidx/leanback/widget/StreamingTextView;->STREAM_POSITION_PROPERTY:Landroid/util/Property;

    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->setProperty(Landroid/util/Property;)V

    :cond_0
    iget-object v3, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    const/4 v4, 0x2

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v0, v4, v5

    const/4 v0, 0x1

    aput v1, v4, v0

    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->setIntValues([I)V

    iget-object v0, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v3, 0x32

    int-to-long v1, v2

    mul-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamingAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    :cond_1
    return-void
.end method

.method private updateText(Ljava/lang/CharSequence;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/StreamingTextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/StreamingTextView;->bringPointIntoView(I)Z

    return-void
.end method


# virtual methods
.method getStreamPosition()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamPosition:I

    return v0
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/EditText;->onFinishInflate()V

    sget v0, Landroidx/leanback/R$drawable;->lb_text_dot_one:I

    const v1, 0x3fa66666    # 1.3f

    invoke-direct {p0, v0, v1}, Landroidx/leanback/widget/StreamingTextView;->getScaledBitmap(IF)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/StreamingTextView;->mOneDot:Landroid/graphics/Bitmap;

    sget v0, Landroidx/leanback/R$drawable;->lb_text_dot_two:I

    invoke-direct {p0, v0, v1}, Landroidx/leanback/widget/StreamingTextView;->getScaledBitmap(IF)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/StreamingTextView;->mTwoDot:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->reset()V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/EditText;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    const-string v0, "androidx.leanback.widget.StreamingTextView"

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamPosition:I

    invoke-direct {p0}, Landroidx/leanback/widget/StreamingTextView;->cancelStreamAnimation()V

    const-string v0, ""

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/StreamingTextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/core/widget/TextViewCompat;->wrapCustomSelectionActionModeCallback(Landroid/widget/TextView;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/EditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public setFinalRecognizedText(Ljava/lang/CharSequence;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/leanback/widget/StreamingTextView;->updateText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method setStreamPosition(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamPosition:I

    invoke-virtual {p0}, Landroidx/leanback/widget/StreamingTextView;->invalidate()V

    return-void
.end method

.method public updateRecognizedText(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-direct {p0, v0, p2, v1}, Landroidx/leanback/widget/StreamingTextView;->addDottySpans(Landroid/text/SpannableStringBuilder;Ljava/lang/String;I)V

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iget p2, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamPosition:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/StreamingTextView;->mStreamPosition:I

    new-instance p1, Landroid/text/SpannedString;

    invoke-direct {p1, v0}, Landroid/text/SpannedString;-><init>(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p1}, Landroidx/leanback/widget/StreamingTextView;->updateText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Landroidx/leanback/widget/StreamingTextView;->startStreamAnimation()V

    return-void
.end method

.method public updateRecognizedText(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
