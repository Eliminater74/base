.class Lcom/tduk/cachecleaner/AdbUtils$1;
.super Ljava/lang/Object;
.source "AdbUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tduk/cachecleaner/AdbUtils;->safeAsyncClose(Ljava/io/Closeable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$c:Ljava/io/Closeable;


# direct methods
.method constructor <init>(Ljava/io/Closeable;)V
    .locals 0

    iput-object p1, p0, Lcom/tduk/cachecleaner/AdbUtils$1;->val$c:Ljava/io/Closeable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/AdbUtils$1;->val$c:Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
