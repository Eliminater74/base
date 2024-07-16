.class public Lcom/tduk/cachecleaner/AppsWhitelistFragment;
.super Landroidx/leanback/preference/LeanbackPreferenceFragmentCompat;
.source "AppsWhitelistFragment.java"


# instance fields
.field appsWhitelist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/preference/LeanbackPreferenceFragmentCompat;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tduk/cachecleaner/AppsWhitelistUtils;->getWhitelist(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->appsWhitelist:Ljava/util/ArrayList;

    invoke-super {p0, p1}, Landroidx/leanback/preference/LeanbackPreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 6

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/preference/PreferenceManager;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object p1

    const-string p2, "Apps Whitelist"

    invoke-virtual {p1, p2}, Landroidx/preference/PreferenceScreen;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->requireContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;

    invoke-direct {v1, p0, p2}, Lcom/tduk/cachecleaner/AppsWhitelistFragment$1;-><init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment;Landroid/content/pm/PackageManager;)V

    invoke-interface {v0, v1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInfo;

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v3, 0x1

    and-int/2addr v2, v3

    if-nez v2, :cond_0

    new-instance v2, Landroidx/preference/SwitchPreference;

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->requireContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroidx/preference/SwitchPreference;-><init>(Landroid/content/Context;)V

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroidx/preference/SwitchPreference;->setKey(Ljava/lang/String;)V

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v4, p2}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroidx/preference/SwitchPreference;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lcom/tduk/cachecleaner/AppsWhitelistFragment;->appsWhitelist:Ljava/util/ArrayList;

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v2, v4}, Landroidx/preference/SwitchPreference;->setChecked(Z)V

    :try_start_0
    iget-object v4, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v4}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    invoke-virtual {v2, v4}, Landroidx/preference/SwitchPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const v3, 0x7f070066

    invoke-virtual {v2, v3}, Landroidx/preference/SwitchPreference;->setIcon(I)V

    :goto_1
    new-instance v3, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;

    invoke-direct {v3, p0, v2, v1}, Lcom/tduk/cachecleaner/AppsWhitelistFragment$2;-><init>(Lcom/tduk/cachecleaner/AppsWhitelistFragment;Landroidx/preference/SwitchPreference;Landroid/content/pm/PackageInfo;)V

    invoke-virtual {v2, v3}, Landroidx/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    invoke-virtual {p1, v2}, Landroidx/preference/PreferenceScreen;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    :cond_1
    return-void
.end method
