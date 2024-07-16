.class Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;
.super Ljava/lang/Object;
.source "AppsWhitelistFragment.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AppsWhitelistFragment;->onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/content/pm/PackageInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

.field final synthetic val$pm:Landroid/content/pm/PackageManager;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment;Landroid/content/pm/PackageManager;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    iput-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;->val$pm:Landroid/content/pm/PackageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/content/pm/PackageInfo;Landroid/content/pm/PackageInfo;)I
    .locals 1

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;->val$pm:Landroid/content/pm/PackageManager;

    invoke-virtual {p1, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p2, p2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;->val$pm:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Landroid/content/pm/PackageInfo;

    check-cast p2, Landroid/content/pm/PackageInfo;

    invoke-virtual {p0, p1, p2}, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;->compare(Landroid/content/pm/PackageInfo;Landroid/content/pm/PackageInfo;)I

    move-result p1

    return p1
.end method
