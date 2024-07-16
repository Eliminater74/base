package com.tduk.cachecleaner.console;

import android.widget.TextView;
/* loaded from: classes.dex */
public class ConsoleBuffer {
    private int amountPopulated = 0;
    private char[] buffer;

    public ConsoleBuffer(int i) {
        this.buffer = new char[i];
    }

    public synchronized void append(byte[] bArr, int i, int i2) {
        int i3 = this.amountPopulated;
        int i4 = i3 + i2;
        char[] cArr = this.buffer;
        if (i4 > cArr.length) {
            System.arraycopy(cArr, i2, cArr, 0, i3 - i2);
            this.amountPopulated -= i2;
        }
        for (int i5 = 0; i5 < i2; i5++) {
            char[] cArr2 = this.buffer;
            int i6 = this.amountPopulated;
            this.amountPopulated = i6 + 1;
            cArr2[i6] = (char) bArr[i + i5];
        }
    }

    public synchronized void updateTextView(TextView textView) {
        textView.setText(this.buffer, 0, this.amountPopulated);
    }
}
