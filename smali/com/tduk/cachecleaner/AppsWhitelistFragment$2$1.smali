.class Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;
.super Ljava/lang/Object;
.source "AppsWhitelistFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

.field final synthetic val$isChecked:Z


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;Z)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    iput-boolean p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->val$isChecked:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-boolean v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->val$isChecked:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    iget-object v1, v1, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$app:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/tduk/cachecleaner/AppsWhitelistUtils;->addAppToWhitelist(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    iget-object v0, v0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;->this$1:Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    iget-object v1, v1, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$app:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/tduk/cachecleaner/AppsWhitelistUtils;->removeAppFromWhitelist(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
