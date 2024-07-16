.class public Lcom/tduk/cachecleaner/AdbShell;
.super Landroid/app/Activity;
.source "AdbShell.java"

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
.field private autoScrollEnabled:Z

.field private binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

.field private commandBox:Landroid/widget/EditText;

.field private commandBuffer:Ljava/lang/StringBuilder;

.field private commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

.field private connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

.field private connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

.field private hostName:Ljava/lang/String;

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


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/AdbShell;->autoScrollEnabled:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/tduk/cachecleaner/AdbShell;->userScrolling:Z

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBuffer:Ljava/lang/StringBuilder;

    new-instance v0, Lcom/tduk/cachecleaner/AdbShell$1;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/AdbShell$1;-><init>(Lcom/tduk/cachecleaner/AdbShell;)V

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->serviceConn:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$000(Lcom/tduk/cachecleaner/AdbShell;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-object p0
.end method

.method static synthetic access$002(Lcom/tduk/cachecleaner/AdbShell;Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;)Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    return-object p1
.end method

.method static synthetic access$100(Lcom/tduk/cachecleaner/AdbShell;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->shellView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$102(Lcom/tduk/cachecleaner/AdbShell;Lcom/tduk/cachecleaner/devconn/DeviceConnection;)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/tduk/cachecleaner/AdbShell;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/tduk/cachecleaner/AdbShell;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->updateTerminalView()V

    return-void
.end method

.method static synthetic access$1300(Lcom/tduk/cachecleaner/AdbShell;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$200(Lcom/tduk/cachecleaner/AdbShell;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->hostName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/tduk/cachecleaner/AdbShell;)I
    .locals 0

    iget p0, p0, Lcom/tduk/cachecleaner/AdbShell;->port:I

    return p0
.end method

.method static synthetic access$400(Lcom/tduk/cachecleaner/AdbShell;Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/AdbShell;->connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$600(Lcom/tduk/cachecleaner/AdbShell;)Landroid/widget/ScrollView;
    .locals 0

    iget-object p0, p0, Lcom/tduk/cachecleaner/AdbShell;->shellScroller:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static synthetic access$700(Lcom/tduk/cachecleaner/AdbShell;)V
    .locals 0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->doAsyncGuiUpdate()V

    return-void
.end method

.method static synthetic access$800(Lcom/tduk/cachecleaner/AdbShell;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    return p0
.end method

.method static synthetic access$802(Lcom/tduk/cachecleaner/AdbShell;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    return p1
.end method

.method static synthetic access$902(Lcom/tduk/cachecleaner/AdbShell;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->userScrolling:Z

    return p1
.end method

.method private connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;
    .locals 1

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->findConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/tduk/cachecleaner/AdbShell;->startConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {p1, v0, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :goto_0
    return-object v0
.end method

.method private doAsyncGuiUpdate()V
    .locals 3

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateQueued:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tduk/cachecleaner/AdbShell$6;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/AdbShell$6;-><init>(Lcom/tduk/cachecleaner/AdbShell;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_1
    return-void
.end method

.method private setGuiDirty()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateRequired:Ljava/util/concurrent/atomic/AtomicBoolean;

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

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->hostName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Please make sure the target device has network ADB enabled.\n\nYou may need to accept a prompt on the target device if you are connecting to it for the first time from this device.\n\nIf you see this message for more than 5 seconds, press back on the remote and then click on Connect"

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {v0, p1, p2}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->createConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    invoke-virtual {p2, p1, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->addListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->startConnect()V

    return-object p1
.end method

.method private updateTerminalView()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->lastConsoleBuffer:Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->shellView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->updateTextView(Landroid/widget/TextView;)V

    :cond_0
    iget-boolean v0, p0, Lcom/tduk/cachecleaner/AdbShell;->autoScrollEnabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->shellView:Landroid/widget/TextView;

    new-instance v1, Lcom/tduk/cachecleaner/AdbShell$5;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/AdbShell$5;-><init>(Lcom/tduk/cachecleaner/AdbShell;)V

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

.method public consoleUpdated(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/console/ConsoleBuffer;)V
    .locals 0

    iput-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->lastConsoleBuffer:Lcom/tduk/cachecleaner/console/ConsoleBuffer;

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->setGuiDirty()V

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->updateGui:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->userScrolling:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->doAsyncGuiUpdate()V

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

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p1

    return-object p1
.end method

.method public notifyConnectionEstablished(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    return-void
.end method

.method public notifyConnectionFailed(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Ljava/lang/Exception;)V
    .locals 1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p1}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Connection Failed"

    const/4 v0, 0x1

    invoke-static {p0, p2, p1, v0}, Lcom/tduk/cachecleaner/ui/Dialog;->displayDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

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

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

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
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {p1}, Lcom/tduk/cachecleaner/AdbUtils;->safeAsyncClose(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->finish()V

    goto :goto_0

    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result p1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->autoScrollEnabled:Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz p1, :cond_4

    new-array v0, v1, [B

    const/4 v3, 0x0

    aput-byte v2, v0, v3

    invoke-virtual {p1, v0}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->queueBytes([B)Z

    iput-boolean v1, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->doAsyncGuiUpdate()V

    :cond_4
    :goto_0
    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001c

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->setContentView(I)V

    const p1, 0x7f090205

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->shellView:Landroid/widget/TextView;

    const p1, 0x7f090093

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    const p1, 0x7f090204

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->shellScroller:Landroid/widget/ScrollView;

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    const-string v0, "pm clear org.xbmc.kodi"

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lcom/tduk/cachecleaner/AdbShell$2;

    invoke-direct {p1, p0}, Lcom/tduk/cachecleaner/AdbShell$2;-><init>(Lcom/tduk/cachecleaner/AdbShell;)V

    new-instance v0, Lcom/tduk/cachecleaner/AdbShell$3;

    invoke-direct {v0, p0}, Lcom/tduk/cachecleaner/AdbShell$3;-><init>(Lcom/tduk/cachecleaner/AdbShell;)V

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->shellScroller:Landroid/widget/ScrollView;

    new-instance v2, Lcom/tduk/cachecleaner/AdbShell$4;

    invoke-direct {v2, p0, v0}, Lcom/tduk/cachecleaner/AdbShell$4;-><init>(Lcom/tduk/cachecleaner/AdbShell;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    const-string v1, "Run"

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->registerForContextMenu(Landroid/view/View;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->shellView:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->registerForContextMenu(Landroid/view/View;)V

    const/16 p1, 0xf

    const-string v0, "AdbCmdHistoryPrefs"

    invoke-static {p1, p0, v0}, Lcom/tduk/cachecleaner/console/CommandHistory;->loadCommandHistoryFromPrefs(ILandroid/content/Context;Ljava/lang/String;)Lcom/tduk/cachecleaner/console/CommandHistory;

    move-result-object p1

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/tduk/cachecleaner/service/ShellService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->service:Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->onNewIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    iget-object p3, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    if-ne p2, p3, :cond_0

    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

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

    iget-boolean p3, p0, Lcom/tduk/cachecleaner/AdbShell;->autoScrollEnabled:Z

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    const/4 p3, 0x3

    const-string v0, "Exit Terminal"

    invoke-interface {p1, p2, p3, p2, v0}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_0
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {v0}, Lcom/tduk/cachecleaner/console/CommandHistory;->save()V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyDestroyingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :cond_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->connectWaiting:Lcom/tduk/cachecleaner/ui/SpinnerDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-static {v0}, Lcom/tduk/cachecleaner/AdbUtils;->safeAsyncClose(Ljava/io/Closeable;)V

    :cond_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->serviceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_2
    invoke-static {}, Lcom/tduk/cachecleaner/ui/Dialog;->closeDialogs()V

    invoke-static {}, Lcom/tduk/cachecleaner/ui/SpinnerDialog;->closeDialogs()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x6

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->commandHistory:Lcom/tduk/cachecleaner/console/CommandHistory;

    invoke-virtual {p2, p1}, Lcom/tduk/cachecleaner/console/CommandHistory;->add(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBuffer:Ljava/lang/StringBuilder;

    const/16 p2, 0xa

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    iget-object p2, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/tduk/cachecleaner/devconn/DeviceConnection;->queueCommand(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->commandBox:Landroid/widget/EditText;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/tduk/cachecleaner/AdbShell;->scrollViewAtBottom:Z

    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->doAsyncGuiUpdate()V

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

    invoke-virtual {p0, p1, p2, p3}, Lcom/tduk/cachecleaner/AdbShell;->onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "IP"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->hostName:Ljava/lang/String;

    const-string v0, "Port"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/tduk/cachecleaner/AdbShell;->port:I

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->hostName:Ljava/lang/String;

    if-eqz v0, :cond_3

    if-ne p1, v1, :cond_0

    goto :goto_1

    :cond_0
    const-string p1, "TDUK APP Cache Cleaner"

    invoke-virtual {p0, p1}, Lcom/tduk/cachecleaner/AdbShell;->setTitle(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->service:Landroid/content/Intent;

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->serviceConn:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    if-eqz v0, :cond_2

    invoke-virtual {p1, v0, p0}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->removeListener(Lcom/tduk/cachecleaner/devconn/DeviceConnection;Lcom/tduk/cachecleaner/devconn/DeviceConnectionListener;)V

    :cond_2
    iget-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->hostName:Ljava/lang/String;

    iget v0, p0, Lcom/tduk/cachecleaner/AdbShell;->port:I

    invoke-direct {p0, p1, v0}, Lcom/tduk/cachecleaner/AdbShell;->connectOrLookupConnection(Ljava/lang/String;I)Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    move-result-object p1

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    :goto_0
    return-void

    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->finish()V

    return-void
.end method

.method public onPause()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyPausingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateGui:Z

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbShell;->binder:Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->connection:Lcom/tduk/cachecleaner/devconn/DeviceConnection;

    invoke-virtual {v0, v1}, Lcom/tduk/cachecleaner/service/ShellService$ShellServiceBinder;->notifyResumingActivity(Lcom/tduk/cachecleaner/devconn/DeviceConnection;)V

    :cond_0
    invoke-direct {p0}, Lcom/tduk/cachecleaner/AdbShell;->updateTerminalView()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tduk/cachecleaner/AdbShell;->updateGui:Z

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    return-void
.end method

.method protected onStart()V
    .locals 2

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    invoke-virtual {p0}, Lcom/tduk/cachecleaner/AdbShell;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tduk/cachecleaner/AdbShell;->service:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public receivedData(Lcom/tduk/cachecleaner/devconn/DeviceConnection;[BII)V
    .locals 0

    return-void
.end method
