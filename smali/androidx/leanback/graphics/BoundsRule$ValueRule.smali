.class public final Landroidx/leanback/graphics/BoundsRule$ValueRule;
.super Ljava/lang/Object;
.source "BoundsRule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/graphics/BoundsRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ValueRule"
.end annotation


# instance fields
.field mAbsoluteValue:I

.field mFraction:F


# direct methods
.method constructor <init>(IF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mAbsoluteValue:I

    iput p2, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mFraction:F

    return-void
.end method

.method constructor <init>(Landroidx/leanback/graphics/BoundsRule$ValueRule;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mFraction:F

    iput v0, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mFraction:F

    iget p1, p1, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mAbsoluteValue:I

    iput p1, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mAbsoluteValue:I

    return-void
.end method

.method public static absoluteValue(I)Landroidx/leanback/graphics/BoundsRule$ValueRule;
    .locals 2

    new-instance v0, Landroidx/leanback/graphics/BoundsRule$ValueRule;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/leanback/graphics/BoundsRule$ValueRule;-><init>(IF)V

    return-object v0
.end method

.method public static inheritFromParent(F)Landroidx/leanback/graphics/BoundsRule$ValueRule;
    .locals 2

    new-instance v0, Landroidx/leanback/graphics/BoundsRule$ValueRule;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Landroidx/leanback/graphics/BoundsRule$ValueRule;-><init>(IF)V

    return-object v0
.end method

.method public static inheritFromParentWithOffset(FI)Landroidx/leanback/graphics/BoundsRule$ValueRule;
    .locals 1

    new-instance v0, Landroidx/leanback/graphics/BoundsRule$ValueRule;

    invoke-direct {v0, p1, p0}, Landroidx/leanback/graphics/BoundsRule$ValueRule;-><init>(IF)V

    return-object v0
.end method


# virtual methods
.method public getAbsoluteValue()I
    .locals 1

    iget v0, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mAbsoluteValue:I

    return v0
.end method

.method public getFraction()F
    .locals 1

    iget v0, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mFraction:F

    return v0
.end method

.method public setAbsoluteValue(I)V
    .locals 0

    iput p1, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mAbsoluteValue:I

    return-void
.end method

.method public setFraction(F)V
    .locals 0

    iput p1, p0, Landroidx/leanback/graphics/BoundsRule$ValueRule;->mFraction:F

    return-void
.end method
