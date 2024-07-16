.class public Landroidx/leanback/widget/picker/TimePicker;
.super Landroidx/leanback/widget/picker/Picker;
.source "TimePicker.java"


# static fields
.field private static final AM_INDEX:I = 0x0

.field private static final HOURS_IN_HALF_DAY:I = 0xc

.field private static final PM_INDEX:I = 0x1

.field static final TAG:Ljava/lang/String; = "TimePicker"


# instance fields
.field mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

.field mColAmPmIndex:I

.field mColHourIndex:I

.field mColMinuteIndex:I

.field private final mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

.field private mCurrentAmPmIndex:I

.field private mCurrentHour:I

.field private mCurrentMinute:I

.field mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

.field private mIs24hFormat:Z

.field mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

.field private mTimePickerFormat:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    sget v0, Landroidx/leanback/R$attr;->timePickerStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/leanback/widget/picker/TimePicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

    invoke-direct {p0, p1, p2, p3}, Landroidx/leanback/widget/picker/Picker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p3, v0}, Landroidx/leanback/widget/picker/PickerUtility;->getTimeConstantInstance(Ljava/util/Locale;Landroid/content/res/Resources;)Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    move-result-object p3

    iput-object p3, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    sget-object v0, Landroidx/leanback/R$styleable;->lbTimePicker:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget-object v3, Landroidx/leanback/R$styleable;->lbTimePicker:[I

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, v0

    invoke-static/range {v1 .. v7}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    :try_start_0
    sget p2, Landroidx/leanback/R$styleable;->lbTimePicker_is24HourFormat:I

    invoke-static {p1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result p1

    invoke-virtual {v0, p2, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    sget p1, Landroidx/leanback/R$styleable;->lbTimePicker_useCurrentTime:I

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->updateColumns()V

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->updateColumnsRange()V

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iget-object p2, p3, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Landroidx/leanback/widget/picker/PickerUtility;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    const/16 p2, 0xb

    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/leanback/widget/picker/TimePicker;->setHour(I)V

    const/16 p2, 0xc

    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/picker/TimePicker;->setMinute(I)V

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->setAmPmValue()V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw p1
.end method

.method private extractTimeFields()Ljava/lang/String;
    .locals 7

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->getBestHourMinutePattern()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v1, v1, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->locale:Ljava/util/Locale;

    invoke-static {v1}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    const/16 v4, 0x61

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const-string v5, "a"

    if-ltz v4, :cond_1

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const-string v6, "m"

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-le v4, v0, :cond_2

    :cond_1
    move v2, v3

    :cond_2
    if-eqz v1, :cond_3

    const-string v0, "mh"

    goto :goto_1

    :cond_3
    const-string v0, "hm"

    :goto_1
    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->is24Hour()Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0

    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    if-eqz v2, :cond_5

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_2

    :cond_5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isAnyOf(C[C)Z
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    aget-char v2, p1, v1

    if-ne p0, v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private setAmPmValue()V
    .locals 3

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->is24Hour()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mColAmPmIndex:I

    iget v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Landroidx/leanback/widget/picker/TimePicker;->setColumnValue(IIZ)V

    :cond_0
    return-void
.end method

.method private updateColumns()V
    .locals 7

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->getBestHourMinutePattern()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mTimePickerFormat:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iput-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mTimePickerFormat:Ljava/lang/String;

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->extractTimeFields()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->extractSeparators()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    if-ne v2, v3, :cond_5

    invoke-virtual {p0, v1}, Landroidx/leanback/widget/picker/TimePicker;->setSeparators(Ljava/util/List;)V

    iget-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v1, v1, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iput-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iput-object v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

    const/4 v1, -0x1

    iput v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mColAmPmIndex:I

    iput v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mColMinuteIndex:I

    iput v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mColHourIndex:I

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x41

    if-eq v5, v6, :cond_3

    const/16 v6, 0x48

    if-eq v5, v6, :cond_2

    const/16 v6, 0x4d

    if-ne v5, v6, :cond_1

    new-instance v5, Landroidx/leanback/widget/picker/PickerColumn;

    invoke-direct {v5}, Landroidx/leanback/widget/picker/PickerColumn;-><init>()V

    iput-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iget-object v6, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v6, v6, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->minutes:[Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroidx/leanback/widget/picker/PickerColumn;->setStaticLabels([Ljava/lang/CharSequence;)V

    iput v3, p0, Landroidx/leanback/widget/picker/TimePicker;->mColMinuteIndex:I

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid time picker format."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v5, Landroidx/leanback/widget/picker/PickerColumn;

    invoke-direct {v5}, Landroidx/leanback/widget/picker/PickerColumn;-><init>()V

    iput-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iget-object v6, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v6, v6, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->hours24:[Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroidx/leanback/widget/picker/PickerColumn;->setStaticLabels([Ljava/lang/CharSequence;)V

    iput v3, p0, Landroidx/leanback/widget/picker/TimePicker;->mColHourIndex:I

    goto :goto_1

    :cond_3
    new-instance v5, Landroidx/leanback/widget/picker/PickerColumn;

    invoke-direct {v5}, Landroidx/leanback/widget/picker/PickerColumn;-><init>()V

    iput-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iget-object v6, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v6, v6, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->ampm:[Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroidx/leanback/widget/picker/PickerColumn;->setStaticLabels([Ljava/lang/CharSequence;)V

    iput v3, p0, Landroidx/leanback/widget/picker/TimePicker;->mColAmPmIndex:I

    iget-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-static {v5, v2}, Landroidx/leanback/widget/picker/TimePicker;->updateMin(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v5, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-static {v5, v4}, Landroidx/leanback/widget/picker/TimePicker;->updateMax(Landroidx/leanback/widget/picker/PickerColumn;I)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v1}, Landroidx/leanback/widget/picker/TimePicker;->setColumns(Ljava/util/List;)V

    return-void

    :cond_5
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Separators size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " must equal the size of timeFieldsPattern: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " + 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateColumnsRange()V
    .locals 4

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iget-boolean v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-static {v0, v1}, Landroidx/leanback/widget/picker/TimePicker;->updateMin(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mHourColumn:Landroidx/leanback/widget/picker/PickerColumn;

    iget-boolean v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x17

    goto :goto_0

    :cond_0
    const/16 v1, 0xc

    :goto_0
    invoke-static {v0, v1}, Landroidx/leanback/widget/picker/TimePicker;->updateMax(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/leanback/widget/picker/TimePicker;->updateMin(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mMinuteColumn:Landroidx/leanback/widget/picker/PickerColumn;

    const/16 v3, 0x3b

    invoke-static {v0, v3}, Landroidx/leanback/widget/picker/TimePicker;->updateMax(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    if-eqz v0, :cond_1

    invoke-static {v0, v1}, Landroidx/leanback/widget/picker/TimePicker;->updateMin(Landroidx/leanback/widget/picker/PickerColumn;I)V

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mAmPmColumn:Landroidx/leanback/widget/picker/PickerColumn;

    invoke-static {v0, v2}, Landroidx/leanback/widget/picker/TimePicker;->updateMax(Landroidx/leanback/widget/picker/PickerColumn;I)V

    :cond_1
    return-void
.end method

.method private static updateMax(Landroidx/leanback/widget/picker/PickerColumn;I)V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/PickerColumn;->getMaxValue()I

    move-result v0

    if-eq p1, v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/picker/PickerColumn;->setMaxValue(I)V

    :cond_0
    return-void
.end method

.method private static updateMin(Landroidx/leanback/widget/picker/PickerColumn;I)V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/PickerColumn;->getMinValue()I

    move-result v0

    if-eq p1, v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/picker/PickerColumn;->setMinValue(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method extractSeparators()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->getBestHourMinutePattern()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x7

    new-array v3, v3, [C

    fill-array-data v3, :array_0

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v5, v8, :cond_6

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x20

    if-ne v8, v9, :cond_0

    goto :goto_2

    :cond_0
    const/16 v9, 0x27

    if-ne v8, v9, :cond_2

    if-nez v6, :cond_1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    const/4 v6, 0x1

    goto :goto_2

    :cond_1
    move v6, v4

    goto :goto_2

    :cond_2
    if-eqz v6, :cond_3

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_3
    invoke-static {v8, v3}, Landroidx/leanback/widget/picker/TimePicker;->isAnyOf(C[C)Z

    move-result v9

    if-eqz v9, :cond_4

    if-eq v8, v7, :cond_5

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_1

    :cond_4
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5
    :goto_1
    move v7, v8

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v1

    :array_0
    .array-data 2
        0x48s
        0x68s
        0x4bs
        0x6bs
        0x6ds
        0x4ds
        0x61s
    .end array-data
.end method

.method getBestHourMinutePattern()Ljava/lang/String;
    .locals 5

    sget-boolean v0, Landroidx/leanback/widget/picker/PickerUtility;->SUPPORTS_BEST_DATE_TIME_PATTERN:Z

    const-string v1, "h:mma"

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v0, v0, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->locale:Ljava/util/Locale;

    iget-boolean v2, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-eqz v2, :cond_0

    const-string v2, "Hma"

    goto :goto_0

    :cond_0
    const-string v2, "hma"

    :goto_0
    invoke-static {v0, v2}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x3

    iget-object v2, p0, Landroidx/leanback/widget/picker/TimePicker;->mConstant:Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;

    iget-object v2, v2, Landroidx/leanback/widget/picker/PickerUtility$TimeConstant;->locale:Ljava/util/Locale;

    invoke-static {v0, v2}, Ljava/text/SimpleDateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    instance-of v2, v0, Ljava/text/SimpleDateFormat;

    if-eqz v2, :cond_2

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    const-string v2, "s"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iget-boolean v2, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-eqz v2, :cond_4

    const/16 v2, 0x68

    const/16 v4, 0x48

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const-string v2, "a"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    iget-boolean v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-eqz v0, :cond_3

    const-string v0, "H:mma"

    goto :goto_1

    :cond_3
    move-object v0, v1

    :cond_4
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_2

    :cond_5
    move-object v1, v0

    :goto_2
    return-object v1
.end method

.method public getHour()I
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-eqz v0, :cond_0

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    return v0

    :cond_0
    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    if-nez v0, :cond_1

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    rem-int/lit8 v0, v0, 0xc

    return v0

    :cond_1
    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    rem-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    return v0
.end method

.method public getMinute()I
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentMinute:I

    return v0
.end method

.method public is24Hour()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    return v0
.end method

.method public isPm()Z
    .locals 2

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public onColumnValueChanged(II)V
    .locals 1

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mColHourIndex:I

    if-ne p1, v0, :cond_0

    iput p2, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    goto :goto_0

    :cond_0
    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mColMinuteIndex:I

    if-ne p1, v0, :cond_1

    iput p2, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentMinute:I

    goto :goto_0

    :cond_1
    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mColAmPmIndex:I

    if-ne p1, v0, :cond_2

    iput p2, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    :goto_0
    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid column index."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHour(I)V
    .locals 3

    if-ltz p1, :cond_3

    const/16 v0, 0x17

    if-gt p1, v0, :cond_3

    iput p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->is24Hour()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_2

    iget p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    const/16 v1, 0xc

    if-lt p1, v1, :cond_0

    const/4 v2, 0x1

    iput v2, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    if-le p1, v1, :cond_1

    sub-int/2addr p1, v1

    iput p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    goto :goto_0

    :cond_0
    iput v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentAmPmIndex:I

    if-nez p1, :cond_1

    iput v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    :cond_1
    :goto_0
    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->setAmPmValue()V

    :cond_2
    iget p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mColHourIndex:I

    iget v1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentHour:I

    invoke-virtual {p0, p1, v1, v0}, Landroidx/leanback/widget/picker/TimePicker;->setColumnValue(IIZ)V

    return-void

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hour: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " is not in [0-23] range in"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setIs24Hour(Z)V
    .locals 2

    iget-boolean v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->getHour()I

    move-result v0

    invoke-virtual {p0}, Landroidx/leanback/widget/picker/TimePicker;->getMinute()I

    move-result v1

    iput-boolean p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mIs24hFormat:Z

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->updateColumns()V

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->updateColumnsRange()V

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/picker/TimePicker;->setHour(I)V

    invoke-virtual {p0, v1}, Landroidx/leanback/widget/picker/TimePicker;->setMinute(I)V

    invoke-direct {p0}, Landroidx/leanback/widget/picker/TimePicker;->setAmPmValue()V

    return-void
.end method

.method public setMinute(I)V
    .locals 3

    if-ltz p1, :cond_0

    const/16 v0, 0x3b

    if-gt p1, v0, :cond_0

    iput p1, p0, Landroidx/leanback/widget/picker/TimePicker;->mCurrentMinute:I

    iget v0, p0, Landroidx/leanback/widget/picker/TimePicker;->mColMinuteIndex:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroidx/leanback/widget/picker/TimePicker;->setColumnValue(IIZ)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minute: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " is not in [0-59] range."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
