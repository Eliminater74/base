.class public Lcom/tduk/cachecleaner/adblib/AndroidBase64;
.super Ljava/lang/Object;
.source "AndroidBase64.java"

# interfaces
.implements Lcom/cgutman/adblib/AdbBase64;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encodeToString([B)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    invoke-static {p1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
