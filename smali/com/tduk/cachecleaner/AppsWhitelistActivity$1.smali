.class Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;
.super Ljava/lang/Object;
.source "AppsWhitelistActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AppsWhitelistActivity;->finish()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

.field final synthetic val$fragment:Landroidx/fragment/app/Fragment;


# direct methods
.method constructor <init>(Lcom/tduk/cachecleaner/AppsWhitelistActivity;Landroidx/fragment/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    iput-object p2, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;->val$fragment:Landroidx/fragment/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;->this$0:Lcom/tduk/cachecleaner/AppsWhitelistActivity;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/AppsWhitelistActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AppsWhitelistActivity$1;->val$fragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitNow()V

    return-void
.end method
