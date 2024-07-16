package androidx.leanback.widget;
/* loaded from: classes.dex */
final class WindowAlignment {
    public final Axis horizontal;
    private Axis mMainAxis;
    private int mOrientation = 0;
    private Axis mSecondAxis;
    public final Axis vertical;

    /* JADX INFO: Access modifiers changed from: package-private */
    public WindowAlignment() {
        Axis axis = new Axis("vertical");
        this.vertical = axis;
        Axis axis2 = new Axis("horizontal");
        this.horizontal = axis2;
        this.mMainAxis = axis2;
        this.mSecondAxis = axis;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Axis {
        private static final int PF_KEYLINE_OVER_HIGH_EDGE = 2;
        private static final int PF_KEYLINE_OVER_LOW_EDGE = 1;
        private int mMaxEdge;
        private int mMaxScroll;
        private int mMinEdge;
        private int mMinScroll;
        private int mPaddingMax;
        private int mPaddingMin;
        private boolean mReversedFlow;
        private int mSize;
        private int mPreferredKeyLine = 2;
        private int mWindowAlignment = 3;
        private int mWindowAlignmentOffset = 0;
        private float mWindowAlignmentOffsetPercent = 50.0f;

        int calculateScrollToKeyLine(int i, int i2) {
            return i - i2;
        }

        Axis(String str) {
            reset();
        }

        public int getWindowAlignment() {
            return this.mWindowAlignment;
        }

        public void setWindowAlignment(int i) {
            this.mWindowAlignment = i;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void setPreferKeylineOverLowEdge(boolean z) {
            int i;
            if (z) {
                i = this.mPreferredKeyLine | 1;
            } else {
                i = this.mPreferredKeyLine & (-2);
            }
            this.mPreferredKeyLine = i;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void setPreferKeylineOverHighEdge(boolean z) {
            int i;
            if (z) {
                i = this.mPreferredKeyLine | 2;
            } else {
                i = this.mPreferredKeyLine & (-3);
            }
            this.mPreferredKeyLine = i;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean isPreferKeylineOverHighEdge() {
            return (this.mPreferredKeyLine & 2) != 0;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean isPreferKeylineOverLowEdge() {
            return (this.mPreferredKeyLine & 1) != 0;
        }

        public int getWindowAlignmentOffset() {
            return this.mWindowAlignmentOffset;
        }

        public void setWindowAlignmentOffset(int i) {
            this.mWindowAlignmentOffset = i;
        }

        public void setWindowAlignmentOffsetPercent(float f) {
            if ((f < 0.0f || f > 100.0f) && f != -1.0f) {
                throw new IllegalArgumentException();
            }
            this.mWindowAlignmentOffsetPercent = f;
        }

        public float getWindowAlignmentOffsetPercent() {
            return this.mWindowAlignmentOffsetPercent;
        }

        public int getMinScroll() {
            return this.mMinScroll;
        }

        public void invalidateScrollMin() {
            this.mMinEdge = Integer.MIN_VALUE;
            this.mMinScroll = Integer.MIN_VALUE;
        }

        public int getMaxScroll() {
            return this.mMaxScroll;
        }

        public void invalidateScrollMax() {
            this.mMaxEdge = Integer.MAX_VALUE;
            this.mMaxScroll = Integer.MAX_VALUE;
        }

        void reset() {
            this.mMinEdge = Integer.MIN_VALUE;
            this.mMaxEdge = Integer.MAX_VALUE;
        }

        public boolean isMinUnknown() {
            return this.mMinEdge == Integer.MIN_VALUE;
        }

        public boolean isMaxUnknown() {
            return this.mMaxEdge == Integer.MAX_VALUE;
        }

        public void setSize(int i) {
            this.mSize = i;
        }

        public int getSize() {
            return this.mSize;
        }

        public void setPadding(int i, int i2) {
            this.mPaddingMin = i;
            this.mPaddingMax = i2;
        }

        public int getPaddingMin() {
            return this.mPaddingMin;
        }

        public int getPaddingMax() {
            return this.mPaddingMax;
        }

        public int getClientSize() {
            return (this.mSize - this.mPaddingMin) - this.mPaddingMax;
        }

        int calculateKeyline() {
            if (!this.mReversedFlow) {
                int i = this.mWindowAlignmentOffset;
                if (i < 0) {
                    i += this.mSize;
                }
                float f = this.mWindowAlignmentOffsetPercent;
                return f != -1.0f ? i + ((int) ((this.mSize * f) / 100.0f)) : i;
            }
            int i2 = this.mWindowAlignmentOffset;
            int i3 = i2 >= 0 ? this.mSize - i2 : -i2;
            float f2 = this.mWindowAlignmentOffsetPercent;
            return f2 != -1.0f ? i3 - ((int) ((this.mSize * f2) / 100.0f)) : i3;
        }

        /* JADX WARN: Code restructure failed: missing block: B:11:0x0027, code lost:
            r4.mMinScroll = r4.mMinEdge - r4.mPaddingMin;
         */
        /* JADX WARN: Code restructure failed: missing block: B:21:0x0048, code lost:
            r4.mMaxScroll = (r4.mMaxEdge - r4.mPaddingMin) - r5;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void updateMinMax(int r5, int r6, int r7, int r8) {
            /*
                r4 = this;
                r4.mMinEdge = r5
                r4.mMaxEdge = r6
                int r5 = r4.getClientSize()
                int r6 = r4.calculateKeyline()
                boolean r0 = r4.isMinUnknown()
                boolean r1 = r4.isMaxUnknown()
                if (r0 != 0) goto L35
                boolean r2 = r4.mReversedFlow
                if (r2 != 0) goto L21
                int r2 = r4.mWindowAlignment
                r2 = r2 & 1
                if (r2 == 0) goto L2f
                goto L27
            L21:
                int r2 = r4.mWindowAlignment
                r2 = r2 & 2
                if (r2 == 0) goto L2f
            L27:
                int r2 = r4.mMinEdge
                int r3 = r4.mPaddingMin
                int r2 = r2 - r3
                r4.mMinScroll = r2
                goto L35
            L2f:
                int r2 = r4.calculateScrollToKeyLine(r7, r6)
                r4.mMinScroll = r2
            L35:
                if (r1 != 0) goto L57
                boolean r2 = r4.mReversedFlow
                if (r2 != 0) goto L42
                int r2 = r4.mWindowAlignment
                r2 = r2 & 2
                if (r2 == 0) goto L51
                goto L48
            L42:
                int r2 = r4.mWindowAlignment
                r2 = r2 & 1
                if (r2 == 0) goto L51
            L48:
                int r2 = r4.mMaxEdge
                int r3 = r4.mPaddingMin
                int r2 = r2 - r3
                int r2 = r2 - r5
                r4.mMaxScroll = r2
                goto L57
            L51:
                int r5 = r4.calculateScrollToKeyLine(r8, r6)
                r4.mMaxScroll = r5
            L57:
                if (r1 != 0) goto Le6
                if (r0 != 0) goto Le6
                boolean r5 = r4.mReversedFlow
                if (r5 != 0) goto La3
                int r5 = r4.mWindowAlignment
                r0 = r5 & 1
                if (r0 == 0) goto L82
                boolean r5 = r4.isPreferKeylineOverLowEdge()
                if (r5 == 0) goto L77
                int r5 = r4.mMinScroll
                int r6 = r4.calculateScrollToKeyLine(r8, r6)
                int r5 = java.lang.Math.min(r5, r6)
                r4.mMinScroll = r5
            L77:
                int r5 = r4.mMinScroll
                int r6 = r4.mMaxScroll
                int r5 = java.lang.Math.max(r5, r6)
                r4.mMaxScroll = r5
                goto Le6
            L82:
                r5 = r5 & 2
                if (r5 == 0) goto Le6
                boolean r5 = r4.isPreferKeylineOverHighEdge()
                if (r5 == 0) goto L98
                int r5 = r4.mMaxScroll
                int r6 = r4.calculateScrollToKeyLine(r7, r6)
                int r5 = java.lang.Math.max(r5, r6)
                r4.mMaxScroll = r5
            L98:
                int r5 = r4.mMinScroll
                int r6 = r4.mMaxScroll
                int r5 = java.lang.Math.min(r5, r6)
                r4.mMinScroll = r5
                goto Le6
            La3:
                int r5 = r4.mWindowAlignment
                r0 = r5 & 1
                if (r0 == 0) goto Lc6
                boolean r5 = r4.isPreferKeylineOverLowEdge()
                if (r5 == 0) goto Lbb
                int r5 = r4.mMaxScroll
                int r6 = r4.calculateScrollToKeyLine(r7, r6)
                int r5 = java.lang.Math.max(r5, r6)
                r4.mMaxScroll = r5
            Lbb:
                int r5 = r4.mMinScroll
                int r6 = r4.mMaxScroll
                int r5 = java.lang.Math.min(r5, r6)
                r4.mMinScroll = r5
                goto Le6
            Lc6:
                r5 = r5 & 2
                if (r5 == 0) goto Le6
                boolean r5 = r4.isPreferKeylineOverHighEdge()
                if (r5 == 0) goto Ldc
                int r5 = r4.mMinScroll
                int r6 = r4.calculateScrollToKeyLine(r8, r6)
                int r5 = java.lang.Math.min(r5, r6)
                r4.mMinScroll = r5
            Ldc:
                int r5 = r4.mMinScroll
                int r6 = r4.mMaxScroll
                int r5 = java.lang.Math.max(r5, r6)
                r4.mMaxScroll = r5
            Le6:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.leanback.widget.WindowAlignment.Axis.updateMinMax(int, int, int, int):void");
        }

        public int getScroll(int i) {
            int i2;
            int i3;
            int size = getSize();
            int calculateKeyline = calculateKeyline();
            boolean isMinUnknown = isMinUnknown();
            boolean isMaxUnknown = isMaxUnknown();
            if (!isMinUnknown) {
                int i4 = this.mPaddingMin;
                int i5 = calculateKeyline - i4;
                if (this.mReversedFlow ? (this.mWindowAlignment & 2) != 0 : (this.mWindowAlignment & 1) != 0) {
                    int i6 = this.mMinEdge;
                    if (i - i6 <= i5) {
                        int i7 = i6 - i4;
                        return (isMaxUnknown || i7 <= (i3 = this.mMaxScroll)) ? i7 : i3;
                    }
                }
            }
            if (!isMaxUnknown) {
                int i8 = this.mPaddingMax;
                int i9 = (size - calculateKeyline) - i8;
                if (this.mReversedFlow ? (this.mWindowAlignment & 1) != 0 : (this.mWindowAlignment & 2) != 0) {
                    int i10 = this.mMaxEdge;
                    if (i10 - i <= i9) {
                        int i11 = i10 - (size - i8);
                        return (isMinUnknown || i11 >= (i2 = this.mMinScroll)) ? i11 : i2;
                    }
                }
            }
            return calculateScrollToKeyLine(i, calculateKeyline);
        }

        public void setReversedFlow(boolean z) {
            this.mReversedFlow = z;
        }

        public String toString() {
            return " min:" + this.mMinEdge + " " + this.mMinScroll + " max:" + this.mMaxEdge + " " + this.mMaxScroll;
        }
    }

    public Axis mainAxis() {
        return this.mMainAxis;
    }

    public Axis secondAxis() {
        return this.mSecondAxis;
    }

    public void setOrientation(int i) {
        this.mOrientation = i;
        if (i == 0) {
            this.mMainAxis = this.horizontal;
            this.mSecondAxis = this.vertical;
            return;
        }
        this.mMainAxis = this.vertical;
        this.mSecondAxis = this.horizontal;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public void reset() {
        mainAxis().reset();
    }

    public String toString() {
        return "horizontal=" + this.horizontal + "; vertical=" + this.vertical;
    }
}
