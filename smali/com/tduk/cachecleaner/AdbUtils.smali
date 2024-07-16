.class public Lcom/tduk/cachecleaner/AdbUtils;
.super Ljava/lang/Object;
.source "AdbUtils.java"


# static fields
.field public static final PRIVATE_KEY_NAME:Ljava/lang/String; = "private.key"

.field public static final PUBLIC_KEY_NAME:Ljava/lang/String; = "public.key"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 3

    new-instance v0, Ljava/io/File;

    const-string v1, "public.key"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    const-string v2, "private.key"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_0

    :try_start_0
    new-instance p0, Lcom/tduk/cachecleaner/adblib/AndroidBase64;

    invoke-direct {p0}, Lcom/tduk/cachecleaner/adblib/AndroidBase64;-><init>()V

    invoke-static {p0, v1, v0}, Lcom/cgutman/adblib/AdbCrypto;->loadAdbKeyPair(Lcom/cgutman/adblib/AdbBase64;Ljava/io/File;Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object v2
.end method

.method public static safeAsyncClose(Ljava/io/Closeable;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tduk/cachecleaner/AdbUtils$1;

    invoke-direct {v1, p0}, Lcom/tduk/cachecleaner/AdbUtils$1;-><init>(Ljava/io/Closeable;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static safeClose(Ljava/io/Closeable;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    return v0
.end method

.method public static writeNewCryptoConfig(Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 3

    new-instance v0, Ljava/io/File;

    const-string v1, "public.key"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    const-string v2, "private.key"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance p0, Lcom/tduk/cachecleaner/adblib/AndroidBase64;

    invoke-direct {p0}, Lcom/tduk/cachecleaner/adblib/AndroidBase64;-><init>()V

    invoke-static {p0}, Lcom/cgutman/adblib/AdbCrypto;->generateAdbKeyPair(Lcom/cgutman/adblib/AdbBase64;)Lcom/cgutman/adblib/AdbCrypto;

    move-result-object p0

    invoke-virtual {p0, v1, v0}, Lcom/cgutman/adblib/AdbCrypto;->saveAdbKeyPair(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method
