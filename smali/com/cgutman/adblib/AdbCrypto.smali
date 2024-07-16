.class public Lcom/cgutman/adblib/AdbCrypto;
.super Ljava/lang/Object;
.source "AdbCrypto.java"


# static fields
.field public static final KEY_LENGTH_BITS:I = 0x800

.field public static final KEY_LENGTH_BYTES:I = 0x100

.field public static final KEY_LENGTH_WORDS:I = 0x40

.field public static SIGNATURE_PADDING:[B

.field public static final SIGNATURE_PADDING_AS_INT:[I


# instance fields
.field private base64:Lcom/cgutman/adblib/AdbBase64;

.field private keyPair:Ljava/security/KeyPair;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    const/16 v0, 0xec

    new-array v0, v0, [I

    const/4 v1, 0x1

    aput v1, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0xff

    aput v2, v0, v1

    const/4 v3, 0x3

    aput v2, v0, v3

    const/4 v4, 0x4

    aput v2, v0, v4

    const/4 v5, 0x5

    aput v2, v0, v5

    const/4 v6, 0x6

    aput v2, v0, v6

    const/4 v7, 0x7

    aput v2, v0, v7

    const/16 v7, 0x8

    aput v2, v0, v7

    const/16 v7, 0x9

    aput v2, v0, v7

    const/16 v8, 0xa

    aput v2, v0, v8

    const/16 v8, 0xb

    aput v2, v0, v8

    const/16 v8, 0xc

    aput v2, v0, v8

    const/16 v8, 0xd

    aput v2, v0, v8

    const/16 v8, 0xe

    aput v2, v0, v8

    const/16 v9, 0xf

    aput v2, v0, v9

    const/16 v9, 0x10

    aput v2, v0, v9

    const/16 v9, 0x11

    aput v2, v0, v9

    const/16 v9, 0x12

    aput v2, v0, v9

    const/16 v9, 0x13

    aput v2, v0, v9

    const/16 v9, 0x14

    aput v2, v0, v9

    const/16 v10, 0x15

    aput v2, v0, v10

    const/16 v10, 0x16

    aput v2, v0, v10

    const/16 v10, 0x17

    aput v2, v0, v10

    const/16 v10, 0x18

    aput v2, v0, v10

    const/16 v10, 0x19

    aput v2, v0, v10

    const/16 v10, 0x1a

    aput v2, v0, v10

    const/16 v11, 0x1b

    aput v2, v0, v11

    const/16 v11, 0x1c

    aput v2, v0, v11

    const/16 v11, 0x1d

    aput v2, v0, v11

    const/16 v11, 0x1e

    aput v2, v0, v11

    const/16 v11, 0x1f

    aput v2, v0, v11

    const/16 v11, 0x20

    aput v2, v0, v11

    const/16 v11, 0x21

    aput v2, v0, v11

    const/16 v12, 0x22

    aput v2, v0, v12

    const/16 v12, 0x23

    aput v2, v0, v12

    const/16 v12, 0x24

    aput v2, v0, v12

    const/16 v12, 0x25

    aput v2, v0, v12

    const/16 v12, 0x26

    aput v2, v0, v12

    const/16 v12, 0x27

    aput v2, v0, v12

    const/16 v12, 0x28

    aput v2, v0, v12

    const/16 v12, 0x29

    aput v2, v0, v12

    const/16 v12, 0x2a

    aput v2, v0, v12

    const/16 v12, 0x2b

    aput v2, v0, v12

    const/16 v13, 0x2c

    aput v2, v0, v13

    const/16 v13, 0x2d

    aput v2, v0, v13

    const/16 v13, 0x2e

    aput v2, v0, v13

    const/16 v13, 0x2f

    aput v2, v0, v13

    const/16 v13, 0x30

    aput v2, v0, v13

    const/16 v14, 0x31

    aput v2, v0, v14

    const/16 v14, 0x32

    aput v2, v0, v14

    const/16 v14, 0x33

    aput v2, v0, v14

    const/16 v14, 0x34

    aput v2, v0, v14

    const/16 v14, 0x35

    aput v2, v0, v14

    const/16 v14, 0x36

    aput v2, v0, v14

    const/16 v14, 0x37

    aput v2, v0, v14

    const/16 v14, 0x38

    aput v2, v0, v14

    const/16 v14, 0x39

    aput v2, v0, v14

    const/16 v14, 0x3a

    aput v2, v0, v14

    const/16 v14, 0x3b

    aput v2, v0, v14

    const/16 v14, 0x3c

    aput v2, v0, v14

    const/16 v14, 0x3d

    aput v2, v0, v14

    const/16 v14, 0x3e

    aput v2, v0, v14

    const/16 v14, 0x3f

    aput v2, v0, v14

    const/16 v14, 0x40

    aput v2, v0, v14

    const/16 v14, 0x41

    aput v2, v0, v14

    const/16 v14, 0x42

    aput v2, v0, v14

    const/16 v14, 0x43

    aput v2, v0, v14

    const/16 v14, 0x44

    aput v2, v0, v14

    const/16 v14, 0x45

    aput v2, v0, v14

    const/16 v14, 0x46

    aput v2, v0, v14

    const/16 v14, 0x47

    aput v2, v0, v14

    const/16 v14, 0x48

    aput v2, v0, v14

    const/16 v14, 0x49

    aput v2, v0, v14

    const/16 v14, 0x4a

    aput v2, v0, v14

    const/16 v14, 0x4b

    aput v2, v0, v14

    const/16 v14, 0x4c

    aput v2, v0, v14

    const/16 v14, 0x4d

    aput v2, v0, v14

    const/16 v14, 0x4e

    aput v2, v0, v14

    const/16 v14, 0x4f

    aput v2, v0, v14

    const/16 v14, 0x50

    aput v2, v0, v14

    const/16 v14, 0x51

    aput v2, v0, v14

    const/16 v14, 0x52

    aput v2, v0, v14

    const/16 v14, 0x53

    aput v2, v0, v14

    const/16 v14, 0x54

    aput v2, v0, v14

    const/16 v14, 0x55

    aput v2, v0, v14

    const/16 v14, 0x56

    aput v2, v0, v14

    const/16 v14, 0x57

    aput v2, v0, v14

    const/16 v14, 0x58

    aput v2, v0, v14

    const/16 v14, 0x59

    aput v2, v0, v14

    const/16 v14, 0x5a

    aput v2, v0, v14

    const/16 v14, 0x5b

    aput v2, v0, v14

    const/16 v14, 0x5c

    aput v2, v0, v14

    const/16 v14, 0x5d

    aput v2, v0, v14

    const/16 v14, 0x5e

    aput v2, v0, v14

    const/16 v14, 0x5f

    aput v2, v0, v14

    const/16 v14, 0x60

    aput v2, v0, v14

    const/16 v14, 0x61

    aput v2, v0, v14

    const/16 v14, 0x62

    aput v2, v0, v14

    const/16 v14, 0x63

    aput v2, v0, v14

    const/16 v14, 0x64

    aput v2, v0, v14

    const/16 v14, 0x65

    aput v2, v0, v14

    const/16 v14, 0x66

    aput v2, v0, v14

    const/16 v14, 0x67

    aput v2, v0, v14

    const/16 v14, 0x68

    aput v2, v0, v14

    const/16 v14, 0x69

    aput v2, v0, v14

    const/16 v14, 0x6a

    aput v2, v0, v14

    const/16 v14, 0x6b

    aput v2, v0, v14

    const/16 v14, 0x6c

    aput v2, v0, v14

    const/16 v14, 0x6d

    aput v2, v0, v14

    const/16 v14, 0x6e

    aput v2, v0, v14

    const/16 v14, 0x6f

    aput v2, v0, v14

    const/16 v14, 0x70

    aput v2, v0, v14

    const/16 v14, 0x71

    aput v2, v0, v14

    const/16 v14, 0x72

    aput v2, v0, v14

    const/16 v14, 0x73

    aput v2, v0, v14

    const/16 v14, 0x74

    aput v2, v0, v14

    const/16 v14, 0x75

    aput v2, v0, v14

    const/16 v14, 0x76

    aput v2, v0, v14

    const/16 v14, 0x77

    aput v2, v0, v14

    const/16 v14, 0x78

    aput v2, v0, v14

    const/16 v14, 0x79

    aput v2, v0, v14

    const/16 v14, 0x7a

    aput v2, v0, v14

    const/16 v14, 0x7b

    aput v2, v0, v14

    const/16 v14, 0x7c

    aput v2, v0, v14

    const/16 v14, 0x7d

    aput v2, v0, v14

    const/16 v14, 0x7e

    aput v2, v0, v14

    const/16 v14, 0x7f

    aput v2, v0, v14

    const/16 v14, 0x80

    aput v2, v0, v14

    const/16 v14, 0x81

    aput v2, v0, v14

    const/16 v14, 0x82

    aput v2, v0, v14

    const/16 v14, 0x83

    aput v2, v0, v14

    const/16 v14, 0x84

    aput v2, v0, v14

    const/16 v14, 0x85

    aput v2, v0, v14

    const/16 v14, 0x86

    aput v2, v0, v14

    const/16 v14, 0x87

    aput v2, v0, v14

    const/16 v14, 0x88

    aput v2, v0, v14

    const/16 v14, 0x89

    aput v2, v0, v14

    const/16 v14, 0x8a

    aput v2, v0, v14

    const/16 v14, 0x8b

    aput v2, v0, v14

    const/16 v14, 0x8c

    aput v2, v0, v14

    const/16 v14, 0x8d

    aput v2, v0, v14

    const/16 v14, 0x8e

    aput v2, v0, v14

    const/16 v14, 0x8f

    aput v2, v0, v14

    const/16 v14, 0x90

    aput v2, v0, v14

    const/16 v14, 0x91

    aput v2, v0, v14

    const/16 v14, 0x92

    aput v2, v0, v14

    const/16 v14, 0x93

    aput v2, v0, v14

    const/16 v14, 0x94

    aput v2, v0, v14

    const/16 v14, 0x95

    aput v2, v0, v14

    const/16 v14, 0x96

    aput v2, v0, v14

    const/16 v14, 0x97

    aput v2, v0, v14

    const/16 v14, 0x98

    aput v2, v0, v14

    const/16 v14, 0x99

    aput v2, v0, v14

    const/16 v14, 0x9a

    aput v2, v0, v14

    const/16 v14, 0x9b

    aput v2, v0, v14

    const/16 v14, 0x9c

    aput v2, v0, v14

    const/16 v14, 0x9d

    aput v2, v0, v14

    const/16 v14, 0x9e

    aput v2, v0, v14

    const/16 v14, 0x9f

    aput v2, v0, v14

    const/16 v14, 0xa0

    aput v2, v0, v14

    const/16 v14, 0xa1

    aput v2, v0, v14

    const/16 v14, 0xa2

    aput v2, v0, v14

    const/16 v14, 0xa3

    aput v2, v0, v14

    const/16 v14, 0xa4

    aput v2, v0, v14

    const/16 v14, 0xa5

    aput v2, v0, v14

    const/16 v14, 0xa6

    aput v2, v0, v14

    const/16 v14, 0xa7

    aput v2, v0, v14

    const/16 v14, 0xa8

    aput v2, v0, v14

    const/16 v14, 0xa9

    aput v2, v0, v14

    const/16 v14, 0xaa

    aput v2, v0, v14

    const/16 v14, 0xab

    aput v2, v0, v14

    const/16 v14, 0xac

    aput v2, v0, v14

    const/16 v14, 0xad

    aput v2, v0, v14

    const/16 v14, 0xae

    aput v2, v0, v14

    const/16 v14, 0xaf

    aput v2, v0, v14

    const/16 v14, 0xb0

    aput v2, v0, v14

    const/16 v14, 0xb1

    aput v2, v0, v14

    const/16 v14, 0xb2

    aput v2, v0, v14

    const/16 v14, 0xb3

    aput v2, v0, v14

    const/16 v14, 0xb4

    aput v2, v0, v14

    const/16 v14, 0xb5

    aput v2, v0, v14

    const/16 v14, 0xb6

    aput v2, v0, v14

    const/16 v14, 0xb7

    aput v2, v0, v14

    const/16 v14, 0xb8

    aput v2, v0, v14

    const/16 v14, 0xb9

    aput v2, v0, v14

    const/16 v14, 0xba

    aput v2, v0, v14

    const/16 v14, 0xbb

    aput v2, v0, v14

    const/16 v14, 0xbc

    aput v2, v0, v14

    const/16 v14, 0xbd

    aput v2, v0, v14

    const/16 v14, 0xbe

    aput v2, v0, v14

    const/16 v14, 0xbf

    aput v2, v0, v14

    const/16 v14, 0xc0

    aput v2, v0, v14

    const/16 v14, 0xc1

    aput v2, v0, v14

    const/16 v14, 0xc2

    aput v2, v0, v14

    const/16 v14, 0xc3

    aput v2, v0, v14

    const/16 v14, 0xc4

    aput v2, v0, v14

    const/16 v14, 0xc5

    aput v2, v0, v14

    const/16 v14, 0xc6

    aput v2, v0, v14

    const/16 v14, 0xc7

    aput v2, v0, v14

    const/16 v14, 0xc8

    aput v2, v0, v14

    const/16 v14, 0xc9

    aput v2, v0, v14

    const/16 v14, 0xca

    aput v2, v0, v14

    const/16 v14, 0xcb

    aput v2, v0, v14

    const/16 v14, 0xcc

    aput v2, v0, v14

    const/16 v14, 0xcd

    aput v2, v0, v14

    const/16 v14, 0xce

    aput v2, v0, v14

    const/16 v14, 0xcf

    aput v2, v0, v14

    const/16 v14, 0xd0

    aput v2, v0, v14

    const/16 v14, 0xd1

    aput v2, v0, v14

    const/16 v14, 0xd2

    aput v2, v0, v14

    const/16 v14, 0xd3

    aput v2, v0, v14

    const/16 v14, 0xd4

    aput v2, v0, v14

    const/16 v14, 0xd5

    aput v2, v0, v14

    const/16 v14, 0xd6

    aput v2, v0, v14

    const/16 v14, 0xd7

    aput v2, v0, v14

    const/16 v14, 0xd8

    aput v2, v0, v14

    const/16 v14, 0xd9

    aput v2, v0, v14

    const/16 v14, 0xda

    aput v2, v0, v14

    const/16 v14, 0xdb

    aput v2, v0, v14

    const/16 v2, 0xdd

    aput v13, v0, v2

    const/16 v2, 0xde

    aput v11, v0, v2

    const/16 v2, 0xdf

    aput v13, v0, v2

    const/16 v2, 0xe0

    aput v7, v0, v2

    const/16 v2, 0xe1

    aput v6, v0, v2

    const/16 v2, 0xe2

    aput v5, v0, v2

    const/16 v2, 0xe3

    aput v12, v0, v2

    const/16 v2, 0xe4

    aput v8, v0, v2

    const/16 v2, 0xe5

    aput v3, v0, v2

    const/16 v2, 0xe6

    aput v1, v0, v2

    const/16 v1, 0xe7

    aput v10, v0, v1

    const/16 v1, 0xe8

    aput v5, v0, v1

    const/16 v1, 0xea

    aput v4, v0, v1

    const/16 v1, 0xeb

    aput v9, v0, v1

    sput-object v0, Lcom/cgutman/adblib/AdbCrypto;->SIGNATURE_PADDING_AS_INT:[I

    array-length v0, v0

    new-array v0, v0, [B

    sput-object v0, Lcom/cgutman/adblib/AdbCrypto;->SIGNATURE_PADDING:[B

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/cgutman/adblib/AdbCrypto;->SIGNATURE_PADDING:[B

    array-length v2, v1

    if-lt v0, v2, :cond_0

    return-void

    :cond_0
    sget-object v2, Lcom/cgutman/adblib/AdbCrypto;->SIGNATURE_PADDING_AS_INT:[I

    aget v2, v2, v0

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertRsaPublicKeyToAdbFormat(Ljava/security/interfaces/RSAPublicKey;)[B
    .locals 11

    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p0}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v1

    sget-object v2, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/16 v3, 0x800

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v2

    const-wide/16 v3, 0x2

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    const/16 v4, 0x40

    new-array v5, v4, [I

    new-array v6, v4, [I

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-lt v8, v4, :cond_2

    const/16 v0, 0x20c

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    invoke-virtual {v9, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move v0, v7

    :goto_1
    if-lt v0, v4, :cond_1

    :goto_2
    if-lt v7, v4, :cond_0

    invoke-interface {p0}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result p0

    invoke-virtual {v9, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0

    :cond_0
    aget v0, v6, v7

    invoke-virtual {v9, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_1
    aget v1, v5, v0

    invoke-virtual {v9, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v2

    aget-object v9, v2, v7

    const/4 v10, 0x1

    aget-object v2, v2, v10

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    aput v2, v6, v8

    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v1

    aget-object v2, v1, v7

    aget-object v1, v1, v10

    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    aput v1, v5, v8

    add-int/lit8 v8, v8, 0x1

    move-object v1, v2

    move-object v2, v9

    goto :goto_0
.end method

.method public static generateAdbKeyPair(Lcom/cgutman/adblib/AdbBase64;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    new-instance v0, Lcom/cgutman/adblib/AdbCrypto;

    invoke-direct {v0}, Lcom/cgutman/adblib/AdbCrypto;-><init>()V

    const-string v1, "RSA"

    invoke-static {v1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v1

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Ljava/security/KeyPairGenerator;->initialize(I)V

    invoke-virtual {v1}, Ljava/security/KeyPairGenerator;->genKeyPair()Ljava/security/KeyPair;

    move-result-object v1

    iput-object v1, v0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    iput-object p0, v0, Lcom/cgutman/adblib/AdbCrypto;->base64:Lcom/cgutman/adblib/AdbBase64;

    return-object v0
.end method

.method public static loadAdbKeyPair(Lcom/cgutman/adblib/AdbBase64;Ljava/io/File;Ljava/io/File;)Lcom/cgutman/adblib/AdbCrypto;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    new-instance v0, Lcom/cgutman/adblib/AdbCrypto;

    invoke-direct {v0}, Lcom/cgutman/adblib/AdbCrypto;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v1, v1, [B

    new-array v2, v2, [B

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v3, v1}, Ljava/io/FileInputStream;->read([B)I

    invoke-virtual {p1, v2}, Ljava/io/FileInputStream;->read([B)I

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    const-string p1, "RSA"

    invoke-static {p1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object p1

    new-instance p2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {p2, v1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    new-instance v1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v1, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    new-instance v2, Ljava/security/KeyPair;

    invoke-virtual {p1, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v1

    invoke-virtual {p1, p2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object p1

    invoke-direct {v2, v1, p1}, Ljava/security/KeyPair;-><init>(Ljava/security/PublicKey;Ljava/security/PrivateKey;)V

    iput-object v2, v0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    iput-object p0, v0, Lcom/cgutman/adblib/AdbCrypto;->base64:Lcom/cgutman/adblib/AdbBase64;

    return-object v0
.end method


# virtual methods
.method public getAdbPublicKeyPayload()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {v0}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v0

    check-cast v0, Ljava/security/interfaces/RSAPublicKey;

    invoke-static {v0}, Lcom/cgutman/adblib/AdbCrypto;->convertRsaPublicKeyToAdbFormat(Ljava/security/interfaces/RSAPublicKey;)[B

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x2d0

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v2, p0, Lcom/cgutman/adblib/AdbCrypto;->base64:Lcom/cgutman/adblib/AdbBase64;

    invoke-interface {v2, v0}, Lcom/cgutman/adblib/AdbBase64;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " unknown@unknown"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public saveAdbKeyPair(Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget-object p2, p0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {p2}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object p2

    invoke-interface {p2}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/io/FileOutputStream;->write([B)V

    iget-object p2, p0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {p2}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object p2

    invoke-interface {p2}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    return-void
.end method

.method public signAdbTokenPayload([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const-string v0, "RSA/ECB/NoPadding"

    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    iget-object v1, p0, Lcom/cgutman/adblib/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    sget-object v1, Lcom/cgutman/adblib/AdbCrypto;->SIGNATURE_PADDING:[B

    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->update([B)[B

    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    return-object p1
.end method
