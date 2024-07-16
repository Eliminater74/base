.class public Lcom/tduk/cachecleaner/console/ConsoleBuffer;
.super Ljava/lang/Object;
.source "ConsoleBuffer.java"


# instance fields
.field private amountPopulated:I

.field private buffer:[C


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array p1, p1, [C

    iput-object p1, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->buffer:[C

    const/4 p1, 0x0

    iput p1, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    return-void
.end method


# virtual methods
.method public declared-synchronized append([BII)V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    add-int v1, v0, p3

    iget-object v2, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->buffer:[C

    array-length v3, v2

    const/4 v4, 0x0

    if-le v1, v3, :cond_0

    sub-int/2addr v0, p3

    invoke-static {v2, p3, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    sub-int/2addr v0, p3

    iput v0, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    :cond_0
    :goto_0
    if-ge v4, p3, :cond_1

    iget-object v0, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->buffer:[C

    iget v1, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    add-int v2, p2, v4

    aget-byte v2, p1, v2

    int-to-char v2, v2

    aput-char v2, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateTextView(Landroid/widget/TextView;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->buffer:[C

    const/4 v1, 0x0

    iget v2, p0, Lcom/tduk/cachecleaner/console/ConsoleBuffer;->amountPopulated:I

    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/TextView;->setText([CII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
