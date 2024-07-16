package com.tduk.cachecleaner;

import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.adblib.AndroidBase64;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class AdbUtils {
    public static final String PRIVATE_KEY_NAME = "private.key";
    public static final String PUBLIC_KEY_NAME = "public.key";

    public static AdbCrypto readCryptoConfig(File file) {
        File file2 = new File(file, PUBLIC_KEY_NAME);
        File file3 = new File(file, PRIVATE_KEY_NAME);
        if (file2.exists() && file3.exists()) {
            try {
                return AdbCrypto.loadAdbKeyPair(new AndroidBase64(), file3, file2);
            } catch (Exception unused) {
                return null;
            }
        }
        return null;
    }

    public static AdbCrypto writeNewCryptoConfig(File file) {
        File file2 = new File(file, PUBLIC_KEY_NAME);
        File file3 = new File(file, PRIVATE_KEY_NAME);
        try {
            AdbCrypto generateAdbKeyPair = AdbCrypto.generateAdbKeyPair(new AndroidBase64());
            generateAdbKeyPair.saveAdbKeyPair(file3, file2);
            return generateAdbKeyPair;
        } catch (Exception unused) {
            return null;
        }
    }

    public static boolean safeClose(Closeable closeable) {
        if (closeable == null) {
            return false;
        }
        try {
            closeable.close();
            return true;
        } catch (IOException unused) {
            return false;
        }
    }

    public static void safeAsyncClose(final Closeable closeable) {
        if (closeable == null) {
            return;
        }
        new Thread(new Runnable() { // from class: com.tduk.cachecleaner.AdbUtils.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    closeable.close();
                } catch (IOException unused) {
                }
            }
        }).start();
    }
}
