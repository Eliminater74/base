.class public Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;
.super Landroidx/fragment/app/Fragment;
.source "LeanbackPreferenceDialogFragmentCompat.java"


# static fields
.field public static final ARG_KEY:Ljava/lang/String; = "key"


# instance fields
.field private mPreference:Landroidx/preference/DialogPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    invoke-static {p0}, Landroidx/leanback/preference/LeanbackPreferenceFragmentTransitionHelperApi21;->addTransitions(Landroidx/fragment/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public getPreference()Landroidx/preference/DialogPreference;
    .locals 2

    iget-object v0, p0, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->mPreference:Landroidx/preference/DialogPreference;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Landroidx/preference/DialogPreference$TargetFragment;

    invoke-interface {v1, v0}, Landroidx/preference/DialogPreference$TargetFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/DialogPreference;

    iput-object v0, p0, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->mPreference:Landroidx/preference/DialogPreference;

    :cond_0
    iget-object v0, p0, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->mPreference:Landroidx/preference/DialogPreference;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/leanback/preference/LeanbackPreferenceDialogFragmentCompat;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    instance-of v0, p1, Landroidx/preference/DialogPreference$TargetFragment;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Target fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " must implement TargetFragment interface"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
