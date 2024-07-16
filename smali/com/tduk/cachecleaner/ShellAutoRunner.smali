.class public Lcom/tduk/cachecleaner/ShellAutoRunner;
.super Landroid/app/Activity;
.source "ShellAutoRunner.java"

# interfaces
.implements Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/TextView$OnEditorActionListener;


# static fields
.field private static final MAX_COMMAND_HISTORY:I = 0xf

.field private static final MENU_ID_AUTOSCROLL:I = 0x2

.field private static final MENU_ID_CTRL_C:I = 0x1

.field private static final MENU_ID_EXIT:I = 0x3

.field private static final PREFS_FILE:Ljava/lang/String; = "AdbCmdHistoryPrefs"


# instance fields
.field private _wasCleaned:Z

.field private autoScrollEnabled:Z

.field private binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

.field cleanAndBootButton:Landroid/widget/Button;

.field cleanButton:Landroid/widget/Button;

.field private commandBox:Landroid/widget/EditText;

.field private commandBuffer:Ljava/lang/StringBuilder;

.field private commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

.field connectButton:Landroid/widget/Button;

.field private connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

.field private connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

.field private hostName:Ljava/lang/String;

.field isExcludingApps:Z

.field private isRebooting:Z

.field private keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

.field private lastConsoleBuffer:Lcom/tduk/cachecleaner/console/ConsoleBuffer;

.field private port:I

.field private scrollViewAtBottom:Z

.field private service:Landroid/content/Intent;

.field private serviceConn:Landroid/content/ServiceConnection;

.field private shellScroller:Landroid/widget/ScrollView;

.field private shellView:Landroid/widget/TextView;

.field private updateGui:Z

.field private updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private userScrolling:Z

.field whiteList:Landroid/widget/CheckBox;

.field whitelistButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->isRebooting:Z

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->autoScrollEnabled:Z

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->userScrolling:Z

    iput-boolean v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->_wasCleaned:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$1;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$1;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    iput-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->serviceConn:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$000(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-object p0
.end method

.method static synthetic access$002(Lcom/tduk/cachecleaner/ShellAutoRunner;Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-object p1
.end method

.method static synthetic access$100(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/tduk/cachecleaner/ShellAutoRunner;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->userScrolling:Z

    return p1
.end method

.method static synthetic access$102(Lcom/tduk/cachecleaner/ShellAutoRunner;Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/tduk/cachecleaner/ShellAutoRunner;)Lcom/tduk/cachecleaner/ui/SpinnerDialog;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/tduk/cachecleaner/ShellAutoRunner;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateTerminalView()V

    return-void
.end method

.method static synthetic access$1500(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$200(Lcom/tduk/cachecleaner/ShellAutoRunner;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->hostName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/tduk/cachecleaner/ShellAutoRunner;)I
    .locals 0

    iget p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->port:I

    return p0
.end method

.method static synthetic access$400(Lcom/tduk/cachecleaner/ShellAutoRunner;Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/tduk/cachecleaner/ShellAutoRunner;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->autoSubmitCommand()V

    return-void
.end method

.method static synthetic access$600(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$700(Lcom/tduk/cachecleaner/ShellAutoRunner;)Landroid/widget/ScrollView;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellScroller:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/tduk/cachecleaner/ShellAutoRunner;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->doAsyncGuiUpdate()V

    return-void
.end method

.method static synthetic access$900(Lcom/tduk/cachecleaner/ShellAutoRunner;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    return p0
.end method

.method static synthetic access$902(Lcom/tduk/cachecleaner/ShellAutoRunner;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    return p1
.end method

.method private autoSubmitCommand()V
    .locals 11

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v0

    invoke-static {p0}, Lcom/tduk/cachecleaner/AppsWhitelistUtils;->getWhitelist(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, -0x1

    move v4, v1

    move v5, v3

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ge v4, v6, :cond_4

    add-int/lit8 v6, v4, 0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/PackageInfo;

    iget-object v8, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr v8, v7

    if-eqz v8, :cond_0

    move v8, v7

    goto :goto_1

    :cond_0
    move v8, v1

    :goto_1
    iget-object v9, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v9, v9, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v10, 0x200000

    and-int/2addr v9, v10

    if-eqz v9, :cond_1

    goto :goto_2

    :cond_1
    move v7, v1

    :goto_2
    iget-object v4, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    if-eqz v8, :cond_2

    goto :goto_3

    :cond_2
    if-nez v7, :cond_3

    const-string v7, "com.tduk.appklr"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "am force-stop "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/tduk/cachecleaner/ShellAutoRunner;->sendCommand(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    const-string v7, "sendCommand"

    invoke-static {v7, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_3
    move v4, v6

    goto :goto_0

    :cond_4
    if-ne v5, v3, :cond_5

    const-string v0, "Total number of apps killed 0"

    invoke-static {p0, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_4

    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Total number of apps killed is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_4
    return-void
.end method

.method private connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->findConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/ShellAutoRunner;->startConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {p1, v0, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :goto_0
    return-object v0
.end method

.method private doAsyncGuiUpdate()V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tduk/cachecleaner/ShellAutoRunner$14;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$14;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_1
    return-void
.end method

.method private sendCommand(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {v0, p1}, Lcom/tduk/cachecleaner/console/CommandHistory;->add(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->queueCommand(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->doAsyncGuiUpdate()V

    return-void
.end method

.method private setGuiDirty()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method private startConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connecting to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->hostName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Please make sure your device has ADB Debugging enabled.\n\nYou may need to accept a prompt on your device if you are connecting to it for the first time.\n\nIf you see this message for more than 5seconds, press Back on the remote and then click on Connect"

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->createConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {p2, p1, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->startConnect()V

    return-object p1
.end method

.method private updateTerminalView()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->lastConsoleBuffer:Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->updateTextView(Landroid/widget/TextView;)V

    :cond_0
    iget-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->autoScrollEnabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellView:Landroid/widget/TextView;

    new-instance v1, Lcom/tduk/cachecleaner/ShellAutoRunner$11;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$11;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public canReceiveData()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method connect()V
    .locals 4

    const-string v0, "localhost"

    iput-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->hostName:Ljava/lang/String;

    const/16 v0, 0x15b3

    iput v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->port:I

    const-string v0, "TDUK APP Cache Cleaner"

    invoke-virtual {p0, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->service:Landroid/content/Intent;

    iget-object v2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->serviceConn:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :cond_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->hostName:Ljava/lang/String;

    iget v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->port:I

    invoke-direct {p0, v0, v1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    :goto_0
    return-void
.end method

.method public consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V
    .locals 0

    iput-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->lastConsoleBuffer:Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->setGuiDirty()V

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateGui:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->userScrolling:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->doAsyncGuiUpdate()V

    :cond_0
    return-void
.end method

.method public isConsole()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public loadAdbCrypto(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 0

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p1

    return-object p1
.end method

.method public notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 2

    const-string p1, "AdbConnectPrefs"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "auto_connect"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    new-instance p1, Lcom/tduk/cachecleaner/ShellAutoRunner$12;

    invoke-direct {p1, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$12;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 2

    const-string p1, "AdbConnectPrefs"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "auto_connect"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Connection Failed"

    const/4 v0, 0x1

    invoke-static {p0, p2, p1, v0}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance p1, Lcom/tduk/cachecleaner/ShellAutoRunner$13;

    invoke-direct {p1, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$13;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public notifyStreamClosed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 2

    const-string p1, "Connection Closed"

    const-string v0, "The connection was gracefully closed."

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public notifyStreamFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 1

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Connection Terminated"

    const/4 v0, 0x1

    invoke-static {p0, p2, p1, v0}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v1, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->safeAsyncClose(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->finish()V

    goto :goto_0

    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result p1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->autoScrollEnabled:Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz p1, :cond_4

    new-array v0, v1, [B

    const/4 v3, 0x0

    aput-byte v2, v0, v3

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->queueBytes([B)Z

    iput-boolean v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->doAsyncGuiUpdate()V

    :cond_4
    :goto_0
    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001f

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->setContentView(I)V

    const p1, 0x7f090205

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellView:Landroid/widget/TextView;

    const p1, 0x7f090093

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    const p1, 0x7f090204

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellScroller:Landroid/widget/ScrollView;

    const p1, 0x7f090075

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->cleanButton:Landroid/widget/Button;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$2;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$2;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090079

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectButton:Landroid/widget/Button;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$3;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$3;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090076

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->cleanAndBootButton:Landroid/widget/Button;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$4;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$4;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f09007b

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->whitelistButton:Landroid/widget/Button;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$5;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$5;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090077

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$6;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$6;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcom/tduk/cachecleaner/ShellAutoRunner$7;

    invoke-direct {p1, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$7;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$8;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$8;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellScroller:Landroid/widget/ScrollView;

    new-instance v2, Lcom/tduk/cachecleaner/ShellAutoRunner$9;

    invoke-direct {v2, p0, v0}, Lcom/tduk/cachecleaner/ShellAutoRunner$9;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    const-string v1, "Run"

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->registerForContextMenu(Landroid/view/View;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->shellView:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->registerForContextMenu(Landroid/view/View;)V

    const/16 p1, 0xf

    const-string v0, "AdbCmdHistoryPrefs"

    invoke-static {p1, p0, v0}, Lcom/tduk/cachecleaner/console/CommandHistory;->loadCommandHistoryFromPrefs(ILandroid/content/Context;Ljava/lang/String;)Lcom/tduk/cachecleaner/console/CommandHistory;

    move-result-object p1

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/tduk/cachecleaner/service/ShellService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->service:Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/ShellAutoRunner;->onNewIntent(Landroid/content/Intent;)V

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0c0032

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    const-string v0, "Generating RSA Key Pair"

    const-string v1, "This will only be done once."

    invoke-static {p0, v0, v1, p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->keygenSpinner:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/tduk/cachecleaner/ShellAutoRunner$10;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/ShellAutoRunner$10;-><init>(Lcom/tduk/cachecleaner/ShellAutoRunner;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    iget-object p3, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    if-ne p2, p3, :cond_0

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {p2, p1}, Lcom/tduk/cachecleaner/console/CommandHistory;->populateMenu(Landroid/view/ContextMenu;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    const/4 p3, 0x1

    const-string v0, "Send Ctrl+C"

    invoke-interface {p1, p2, p3, p2, v0}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const/4 v0, 0x2

    const-string v1, "Auto-scroll terminal"

    invoke-interface {p1, p2, v0, p2, v1}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    iget-boolean p3, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->autoScrollEnabled:Z

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    const/4 p3, 0x3

    const-string v0, "Exit Terminal"

    invoke-interface {p1, p2, p3, p2, v0}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_0
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/console/CommandHistory;->save()V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyDestroyingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->safeAsyncClose(Ljava/io/Closeable;)V

    :cond_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->serviceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_2
    invoke-static {}, Lcom/tduk/cachecleaner/ui/Dialog;->closeDialogs()V

    invoke-static {}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->closeDialogs()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x6

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {p2, p1}, Lcom/tduk/cachecleaner/console/CommandHistory;->add(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    const/16 p2, 0xa

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    iget-object p2, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->queueCommand(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->commandBox:Landroid/widget/EditText;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->scrollViewAtBottom:Z

    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->doAsyncGuiUpdate()V

    return p1

    :cond_1
    :goto_0
    return p3
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    const/16 v0, 0x42

    if-ne p2, v0, :cond_0

    check-cast p1, Landroid/widget/TextView;

    const/4 p2, 0x6

    invoke-virtual {p0, p1, p2, p3}, Lcom/tduk/cachecleaner/ShellAutoRunner;->onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onPause()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyPausingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateGui:Z

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyResumingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    :cond_0
    invoke-direct {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateTerminalView()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->updateGui:Z

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    return-void
.end method

.method protected onStart()V
    .locals 2

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/ShellAutoRunner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/ShellAutoRunner;->service:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V
    .locals 0

    return-void
.end method

.method public xyz(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Total number of background apps running: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
