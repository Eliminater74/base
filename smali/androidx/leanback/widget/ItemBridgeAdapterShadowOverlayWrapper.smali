.class public Landroidx/leanback/widget/ItemBridgeAdapterShadowOverlayWrapper;
.super Landroidx/leanback/widget/ItemBridgeAdapter$Wrapper;
.source "ItemBridgeAdapterShadowOverlayWrapper.java"


# instance fields
.field private final mHelper:Landroidx/leanback/widget/ShadowOverlayHelper;


# direct methods
.method public constructor <init>(Landroidx/leanback/widget/ShadowOverlayHelper;)V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/widget/ItemBridgeAdapter$Wrapper;-><init>()V

    iput-object p1, p0, Landroidx/leanback/widget/ItemBridgeAdapterShadowOverlayWrapper;->mHelper:Landroidx/leanback/widget/ShadowOverlayHelper;

    return-void
.end method


# virtual methods
.method public createWrapper(Landroid/view/View;)Landroid/view/View;
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Landroidx/leanback/widget/ItemBridgeAdapterShadowOverlayWrapper;->mHelper:Landroidx/leanback/widget/ShadowOverlayHelper;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/ShadowOverlayHelper;->createShadowOverlayContainer(Landroid/content/Context;)Landroidx/leanback/widget/ShadowOverlayContainer;

    move-result-object p1

    return-object p1
.end method

.method public wrap(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    check-cast p1, Landroidx/leanback/widget/ShadowOverlayContainer;

    invoke-virtual {p1, p2}, Landroidx/leanback/widget/ShadowOverlayContainer;->wrap(Landroid/view/View;)V

    return-void
.end method
