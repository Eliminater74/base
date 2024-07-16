.class Lcom/tduk/cachecleaner/ShellAutoRunner$4;
.super Ljava/lang/Object;
.source "ShellAutoRunner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/ShellAutoRunner;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$4;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$4;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object p1

    move v1, v0

    move v2, v1

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_4

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInfo;

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v5, 0x1

    and-int/2addr v4, v5

    if-eqz v4, :cond_0

    move v4, v5

    goto :goto_1

    :cond_0
    move v4, v0

    :goto_1
    iget-object v6, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v7, 0x200000

    and-int/2addr v6, v7

    if-eqz v6, :cond_1

    goto :goto_2

    :cond_1
    move v5, v0

    :goto_2
    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    if-eqz v4, :cond_2

    goto :goto_3

    :cond_2
    if-nez v5, :cond_3

    const-string v4, "com.tduk.appklr"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    add-int/lit8 v2, v2, 0x1

    :cond_3
    :goto_3
    move v1, v3

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$4;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1, v2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->xyz(I)V

    return-void
.end method
