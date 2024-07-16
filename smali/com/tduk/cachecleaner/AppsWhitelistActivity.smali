.class public Lcom/tduk/cachecleaner/AppsWhitelistActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "AppsWhitelistActivity.java"

# interfaces
.implements Landroidx/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback;


# instance fields
.field SETTINGS_FRAGMENT_TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const-string v0, "settings_fragment_tag"

    iput-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->SETTINGS_FRAGMENT_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 3

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->SETTINGS_FRAGMENT_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f090202

    invoke-virtual {p0, v1}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    new-instance v2, Landroidx/transition/Scene;

    invoke-direct {v2, v1}, Landroidx/transition/Scene;-><init>(Landroid/view/ViewGroup;)V

    new-instance v1, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;

    invoke-direct {v1, p0, v0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;-><init>(Lcom/tduk/cachecleaner/AppsWhitelistActivity;Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v2, v1}, Landroidx/transition/Scene;->setEnterAction(Ljava/lang/Runnable;)V

    new-instance v0, Landroidx/transition/Slide;

    const v1, 0x800005

    invoke-direct {v0, v1}, Landroidx/transition/Slide;-><init>(I)V

    new-instance v1, Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity$2;-><init>(Lcom/tduk/cachecleaner/AppsWhitelistActivity;)V

    invoke-virtual {v0, v1}, Landroidx/transition/Slide;->addListener(Landroidx/transition/Transition$TransitionListener;)Landroidx/transition/Transition;

    invoke-static {v2, v0}, Landroidx/transition/TransitionManager;->go(Landroidx/transition/Scene;Landroidx/transition/Transition;)V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :goto_0
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->finishAfterTransition()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001d

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->setContentView(I)V

    return-void
.end method

.method public onPreferenceStartFragment(Landroidx/preference/PreferenceFragmentCompat;Landroidx/preference/Preference;)Z
    .locals 3

    invoke-virtual {p2}, Landroidx/preference/Preference;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->getFragmentFactory()Landroidx/fragment/app/FragmentFactory;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p2}, Landroidx/preference/Preference;->getFragment()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Landroidx/fragment/app/FragmentFactory;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    const v0, 0x7f090202

    invoke-virtual {p1, v0, p2}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    const/4 p1, 0x1

    return p1
.end method
