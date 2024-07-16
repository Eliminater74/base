.class Lcom/cgutman/adblib/AdbConnection$1;
.super Ljava/lang/Object;
.source "AdbConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cgutman/adblib/AdbConnection;->createConnectionThread()Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cgutman/adblib/AdbConnection;

.field private final synthetic val$conn:Lcom/cgutman/adblib/AdbConnection;


# direct methods
.method constructor <init>(Lcom/cgutman/adblib/AdbConnection;Lcom/cgutman/adblib/AdbConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/cgutman/adblib/AdbConnection$1;->this$0:Lcom/cgutman/adblib/AdbConnection;

    iput-object p2, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->this$0:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v0}, Lcom/cgutman/adblib/AdbConnection;->access$0(Lcom/cgutman/adblib/AdbConnection;)Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->this$0:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v0}, Lcom/cgutman/adblib/AdbConnection;->access$1(Lcom/cgutman/adblib/AdbConnection;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->parseAdbMessage(Ljava/io/InputStream;)Lcom/cgutman/adblib/AdbProtocol$AdbMessage;

    move-result-object v0

    invoke-static {v0}, Lcom/cgutman/adblib/AdbProtocol;->validateMessage(Lcom/cgutman/adblib/AdbProtocol$AdbMessage;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    iget v1, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->command:I

    const/4 v2, 0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v3, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    iget v0, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v3, v0}, Lcom/cgutman/adblib/AdbConnection;->access$7(Lcom/cgutman/adblib/AdbConnection;I)V

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v0, v2}, Lcom/cgutman/adblib/AdbConnection;->access$8(Lcom/cgutman/adblib/AdbConnection;Z)V

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    :sswitch_1
    iget v1, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->arg0:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1}, Lcom/cgutman/adblib/AdbConnection;->access$4(Lcom/cgutman/adblib/AdbConnection;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x3

    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1}, Lcom/cgutman/adblib/AdbConnection;->access$5(Lcom/cgutman/adblib/AdbConnection;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbCrypto;->getAdbPublicKeyPayload()[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/cgutman/adblib/AdbProtocol;->generateAuth(I[B)[B

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v1, 0x2

    iget-object v3, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v3}, Lcom/cgutman/adblib/AdbConnection;->access$5(Lcom/cgutman/adblib/AdbConnection;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object v3

    iget-object v0, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->payload:[B

    invoke-virtual {v3, v0}, Lcom/cgutman/adblib/AdbCrypto;->signAdbTokenPayload([B)[B

    move-result-object v0

    invoke-static {v1, v0}, Lcom/cgutman/adblib/AdbProtocol;->generateAuth(I[B)[B

    move-result-object v0

    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1, v2}, Lcom/cgutman/adblib/AdbConnection;->access$6(Lcom/cgutman/adblib/AdbConnection;Z)V

    :goto_1
    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    iget-object v1, v1, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    iget-object v0, v0, Lcom/cgutman/adblib/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    goto :goto_0

    :sswitch_2
    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1}, Lcom/cgutman/adblib/AdbConnection;->access$2(Lcom/cgutman/adblib/AdbConnection;)Z

    move-result v1

    if-nez v1, :cond_4

    goto/16 :goto_0

    :cond_4
    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->this$0:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1}, Lcom/cgutman/adblib/AdbConnection;->access$3(Lcom/cgutman/adblib/AdbConnection;)Ljava/util/HashMap;

    move-result-object v1

    iget v2, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cgutman/adblib/AdbStream;

    if-nez v1, :cond_5

    goto/16 :goto_0

    :cond_5
    monitor-enter v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :try_start_3
    iget v2, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->command:I

    const v3, 0x59414b4f

    if-ne v2, v3, :cond_6

    iget v0, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->arg0:I

    invoke-virtual {v1, v0}, Lcom/cgutman/adblib/AdbStream;->updateRemoteId(I)V

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->readyForWrite()V

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    goto :goto_2

    :cond_6
    iget v2, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->command:I

    const v3, 0x45545257

    if-ne v2, v3, :cond_7

    iget-object v0, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->payload:[B

    invoke-virtual {v1, v0}, Lcom/cgutman/adblib/AdbStream;->addPayload([B)V

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->sendReady()V

    goto :goto_2

    :cond_7
    iget v2, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->command:I

    const v3, 0x45534c43

    if-ne v2, v3, :cond_8

    iget-object v2, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v2}, Lcom/cgutman/adblib/AdbConnection;->access$3(Lcom/cgutman/adblib/AdbConnection;)Ljava/util/HashMap;

    move-result-object v2

    iget v0, v0, Lcom/cgutman/adblib/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/cgutman/adblib/AdbStream;->notifyClose()V

    :cond_8
    :goto_2
    monitor-exit v1

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    :goto_3
    iget-object v0, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->this$0:Lcom/cgutman/adblib/AdbConnection;

    invoke-static {v1}, Lcom/cgutman/adblib/AdbConnection;->access$9(Lcom/cgutman/adblib/AdbConnection;)V

    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    iget-object v1, p0, Lcom/cgutman/adblib/AdbConnection$1;->val$conn:Lcom/cgutman/adblib/AdbConnection;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/cgutman/adblib/AdbConnection;->access$10(Lcom/cgutman/adblib/AdbConnection;Z)V

    monitor-exit v0

    return-void

    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x45534c43 -> :sswitch_2
        0x45545257 -> :sswitch_2
        0x48545541 -> :sswitch_1
        0x4e584e43 -> :sswitch_0
        0x59414b4f -> :sswitch_2
    .end sparse-switch
.end method
