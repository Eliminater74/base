package androidx.leanback.widget;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import androidx.leanback.C0393R;
import androidx.leanback.widget.SearchOrbView;
/* loaded from: classes.dex */
public class SpeechOrbView extends SearchOrbView {
    private int mCurrentLevel;
    private boolean mListening;
    private SearchOrbView.Colors mListeningOrbColors;
    private SearchOrbView.Colors mNotListeningOrbColors;
    private final float mSoundLevelMaxZoom;

    public SpeechOrbView(Context context) {
        this(context, null);
    }

    public SpeechOrbView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SpeechOrbView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mCurrentLevel = 0;
        this.mListening = false;
        Resources resources = context.getResources();
        this.mSoundLevelMaxZoom = resources.getFraction(C0393R.fraction.lb_search_bar_speech_orb_max_level_zoom, 1, 1);
        this.mNotListeningOrbColors = new SearchOrbView.Colors(resources.getColor(C0393R.C0394color.lb_speech_orb_not_recording), resources.getColor(C0393R.C0394color.lb_speech_orb_not_recording_pulsed), resources.getColor(C0393R.C0394color.lb_speech_orb_not_recording_icon));
        this.mListeningOrbColors = new SearchOrbView.Colors(resources.getColor(C0393R.C0394color.lb_speech_orb_recording), resources.getColor(C0393R.C0394color.lb_speech_orb_recording), 0);
        showNotListening();
    }

    @Override // androidx.leanback.widget.SearchOrbView
    int getLayoutResourceId() {
        return C0393R.layout.lb_speech_orb;
    }

    public void setListeningOrbColors(SearchOrbView.Colors colors) {
        this.mListeningOrbColors = colors;
    }

    public void setNotListeningOrbColors(SearchOrbView.Colors colors) {
        this.mNotListeningOrbColors = colors;
    }

    public void showListening() {
        setOrbColors(this.mListeningOrbColors);
        setOrbIcon(getResources().getDrawable(C0393R.C0395drawable.lb_ic_search_mic));
        animateOnFocus(true);
        enableOrbColorAnimation(false);
        scaleOrbViewOnly(1.0f);
        this.mCurrentLevel = 0;
        this.mListening = true;
    }

    public void showNotListening() {
        setOrbColors(this.mNotListeningOrbColors);
        setOrbIcon(getResources().getDrawable(C0393R.C0395drawable.lb_ic_search_mic_out));
        animateOnFocus(hasFocus());
        scaleOrbViewOnly(1.0f);
        this.mListening = false;
    }

    public void setSoundLevel(int i) {
        if (this.mListening) {
            int i2 = this.mCurrentLevel;
            if (i > i2) {
                this.mCurrentLevel = i2 + ((i - i2) / 2);
            } else {
                this.mCurrentLevel = (int) (i2 * 0.7f);
            }
            scaleOrbViewOnly((((this.mSoundLevelMaxZoom - getFocusedZoom()) * this.mCurrentLevel) / 100.0f) + 1.0f);
        }
    }
}
