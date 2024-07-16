.class public final Landroidx/leanback/widget/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final lbBaseGridView:[I

.field public static final lbBaseGridView_android_gravity:I = 0x0

.field public static final lbBaseGridView_android_horizontalSpacing:I = 0x1

.field public static final lbBaseGridView_android_verticalSpacing:I = 0x2

.field public static final lbBaseGridView_focusOutEnd:I = 0x3

.field public static final lbBaseGridView_focusOutFront:I = 0x4

.field public static final lbBaseGridView_focusOutSideEnd:I = 0x5

.field public static final lbBaseGridView_focusOutSideStart:I = 0x6

.field public static final lbBaseGridView_horizontalMargin:I = 0x7

.field public static final lbBaseGridView_verticalMargin:I = 0x8

.field public static final lbHorizontalGridView:[I

.field public static final lbHorizontalGridView_numberOfRows:I = 0x0

.field public static final lbHorizontalGridView_rowHeight:I = 0x1

.field public static final lbVerticalGridView:[I

.field public static final lbVerticalGridView_columnWidth:I = 0x0

.field public static final lbVerticalGridView_numberOfColumns:I = 0x1


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroidx/leanback/widget/R$styleable;->lbBaseGridView:[I

    const/4 v0, 0x2

    new-array v1, v0, [I

    fill-array-data v1, :array_1

    sput-object v1, Landroidx/leanback/widget/R$styleable;->lbHorizontalGridView:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Landroidx/leanback/widget/R$styleable;->lbVerticalGridView:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x10100af
        0x1010114
        0x1010115
        0x7f0301a5
        0x7f0301a6
        0x7f0301a7
        0x7f0301a8
        0x7f030204
        0x7f03046b
    .end array-data

    :array_1
    .array-data 4
        0x7f0302fd
        0x7f03037f
    .end array-data

    :array_2
    .array-data 4
        0x7f0300e4
        0x7f0302fc
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
