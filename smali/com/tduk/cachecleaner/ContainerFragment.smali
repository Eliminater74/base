.class public Lcom/tduk/cachecleaner/ContainerFragment;
.super Landroidx/leanback/preference/LeanbackSettingsFragmentCompat;
.source "ContainerFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/leanback/preference/LeanbackSettingsFragmentCompat;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceStartFragment(Landroidx/preference/PreferenceFragmentCompat;Landroidx/preference/Preference;)Z
    .locals 3

    invoke-virtual {p2}, Landroidx/preference/Preference;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ContainerFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->getFragmentFactory()Landroidx/fragment/app/FragmentFactory;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ContainerFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p2}, Landroidx/preference/Preference;->getFragment()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Landroidx/fragment/app/FragmentFactory;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    instance-of p1, p2, Landroidx/preference/PreferenceFragmentCompat;

    if-nez p1, :cond_1

    instance-of p1, p2, Landroidx/preference/PreferenceDialogFragmentCompat;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/tduk/cachecleaner/ContainerFragment;->startImmersiveFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0, p2}, Lcom/tduk/cachecleaner/ContainerFragment;->startPreferenceFragment(Landroidx/fragment/app/Fragment;)V

    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public onPreferenceStartInitialScreen()V
    .locals 1

    new-instance v0, Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    invoke-direct {v0}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/ContainerFragment;->startPreferenceFragment(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public onPreferenceStartScreen(Landroidx/preference/PreferenceFragmentCompat;Landroidx/preference/PreferenceScreen;)Z
    .locals 3

    new-instance p1, Lcom/tduk/cachecleaner/AppsWhitelistFragment;

    invoke-direct {p1}, Lcom/tduk/cachecleaner/AppsWhitelistFragment;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    invoke-virtual {p2}, Landroidx/preference/PreferenceScreen;->getKey()Ljava/lang/String;

    move-result-object p2

    const-string v2, "androidx.preference.PreferenceFragmentCompat.PREFERENCE_ROOT"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ContainerFragment;->startPreferenceFragment(Landroidx/fragment/app/Fragment;)V

    return v1
.end method
