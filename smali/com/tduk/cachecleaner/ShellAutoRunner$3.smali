.class Lcom/tduk/cachecleaner/ShellAutoRunner$3;
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

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "adb_enabled"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    iget-object v2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {v2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "adb_wifi_enabled"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    iget-object v3, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {v3}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "adb_over_ethernet"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v0, :cond_2

    move v3, v0

    goto :goto_2

    :cond_2
    move v3, v1

    :goto_2
    iget-object v4, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {v4}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "adb_tcp_enabled"

    invoke-static {v4, v5, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v0, :cond_3

    move v4, v0

    goto :goto_3

    :cond_3
    move v4, v1

    :goto_3
    if-nez p1, :cond_4

    if-nez v2, :cond_4

    if-nez v3, :cond_4

    if-eqz v4, :cond_5

    :cond_4
    move v1, v0

    :cond_5
    if-eqz v1, :cond_6

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->connect()V

    goto :goto_4

    :cond_6
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;->this$0:Lcom/tduk/cachecleaner/ShellAutoRunner;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f110028

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_4
    return-void
.end method
