.class Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;
.super Ljava/lang/Object;
.source "AppsWhitelistFragment.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AppsWhitelistFragment;->onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

.field final synthetic val$app:Landroid/content/pm/PackageInfo;

.field final synthetic val$appPreference:Landroidx/preference/SwitchPreference;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment;Landroidx/preference/SwitchPreference;Landroid/content/pm/PackageInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    iput-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$appPreference:Landroidx/preference/SwitchPreference;

    iput-object p3, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$app:Landroid/content/pm/PackageInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$appPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p2, p1}, Landroidx/preference/SwitchPreference;->setChecked(Z)V

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    iget-object p2, p2, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->appsWhitelist:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$app:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    iget-object p2, p2, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->appsWhitelist:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;->val$app:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_0
    new-instance p2, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;

    invoke-direct {p2, p0, p1}, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2$1;-><init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;Z)V

    invoke-static {p2}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    return p1
.end method
