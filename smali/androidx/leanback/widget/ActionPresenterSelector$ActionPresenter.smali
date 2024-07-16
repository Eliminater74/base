.class abstract Landroidx/leanback/widget/ActionPresenterSelector$ActionPresenter;
.super Landroidx/leanback/widget/Presenter;
.source "ActionPresenterSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/leanback/widget/ActionPresenterSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ActionPresenter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/widget/Presenter;-><init>()V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;Ljava/lang/Object;)V
    .locals 4

    check-cast p2, Landroidx/leanback/widget/Action;

    check-cast p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;

    iput-object p2, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mAction:Landroidx/leanback/widget/Action;

    invoke-virtual {p2}, Landroidx/leanback/widget/Action;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iget-object v1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Landroidx/leanback/R$dimen;->lb_action_with_icon_padding_start:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Landroidx/leanback/R$dimen;->lb_action_with_icon_padding_end:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    invoke-virtual {v3, v1, v0, v2, v0}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_0

    :cond_0
    iget-object v1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Landroidx/leanback/R$dimen;->lb_action_padding_horizontal:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    invoke-virtual {v2, v1, v0, v1, v0}, Landroid/view/View;->setPaddingRelative(IIII)V

    :goto_0
    iget v0, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mLayoutDirection:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    iget-object p1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mButton:Landroid/widget/Button;

    invoke-virtual {p1, v2, v2, p2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    iget-object p1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mButton:Landroid/widget/Button;

    invoke-virtual {p1, p2, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_1
    return-void
.end method

.method public onUnbindViewHolder(Landroidx/leanback/widget/Presenter$ViewHolder;)V
    .locals 3

    check-cast p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;

    iget-object v0, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->view:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    iput-object v1, p1, Landroidx/leanback/widget/ActionPresenterSelector$ActionViewHolder;->mAction:Landroidx/leanback/widget/Action;

    return-void
.end method
