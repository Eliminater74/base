.class Landroidx/leanback/widget/ActionPresenterSelector$OneLineActionPresenter;
.super Landroidx/leanback/widget/ActionPresenterSelector$ActionPresenter;
.source "ActionPresenterSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/ActionPresenterSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OneLineActionPresenter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/widget/ActionPresenterSelector$ActionPresenter;-><init>()V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroidx/leanback/widget/ActionPresenterSelector$ActionPresenter;->onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V

    check-cast p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;

    check-cast p2, Landroidx/leanback/widget/Action;

    iget-object p1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mButton:Landroid/widget/Button;

    invoke-virtual {p2}, Landroidx/leanback/widget/Action;->getLabel1()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;)Landroidx/leanback/widget/Presenter$ViewHolder;
    .locals 3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/leanback/R$layout;->lb_action_1_line:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutDirection()I

    move-result p1

    invoke-direct {v1, v0, p1}, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;-><init>(Landroid/view/View;I)V

    return-object v1
.end method
