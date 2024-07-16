.class public Lcom/tduk/cachecleaner/console/CommandHistory;
.super Ljava/lang/Object;
.source "CommandHistory.java"


# instance fields
.field private historyLimit:I

.field private prefs:Landroid/content/SharedPreferences;

.field private previousCommands:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    iput p1, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->historyLimit:I

    return-void
.end method

.method public static loadCommandHistoryFromPrefs(ILandroid/content/Context;Ljava/lang/String;)Lcom/tduk/cachecleaner/console/CommandHistory;
    .locals 3

    new-instance v0, Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/console/CommandHistory;-><init>(I)V

    const/4 p0, 0x0

    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, v0, Lcom/tduk/cachecleaner/console/CommandHistory;->prefs:Landroid/content/SharedPreferences;

    const-string p2, "Size"

    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    :goto_0
    if-ge p0, p1, :cond_1

    iget-object p2, v0, Lcom/tduk/cachecleaner/console/CommandHistory;->prefs:Landroid/content/SharedPreferences;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p2, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/tduk/cachecleaner/console/CommandHistory;->add(Ljava/lang/String;)V

    :cond_0
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget v1, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->historyLimit:I

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public populateMenu(Landroid/view/ContextMenu;)V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    invoke-interface {p1, v2, v2, v2, v1}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public save()V
    .locals 4

    iget-object v0, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/tduk/cachecleaner/console/CommandHistory;->previousCommands:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const-string v2, "Size"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
