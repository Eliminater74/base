.class public Landroidx/leanback/widget/SearchBar;
.super Landroid/widget/RelativeLayout;
.source "SearchBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;,
        Landroidx/leanback/widget/SearchBar$SearchBarListener;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final DEFAULT_PRIORITY:I = 0x1

.field static final DEFAULT_RATE:F = 1.0f

.field static final DO_NOT_LOOP:I = 0x0

.field static final FULL_LEFT_VOLUME:F = 1.0f

.field static final FULL_RIGHT_VOLUME:F = 1.0f

.field static final TAG:Ljava/lang/String; = "SearchBar"


# instance fields
.field mAutoStartRecognition:Z

.field private mBackgroundAlpha:I

.field private mBackgroundSpeechAlpha:I

.field private mBadgeDrawable:Landroid/graphics/drawable/Drawable;

.field private mBadgeView:Landroid/widget/ImageView;

.field private mBarBackground:Landroid/graphics/drawable/Drawable;

.field private mBarHeight:I

.field private final mContext:Landroid/content/Context;

.field final mHandler:Landroid/os/Handler;

.field private mHint:Ljava/lang/String;

.field private final mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mListening:Z

.field private mPermissionListener:Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;

.field mRecognizing:Z

.field mSearchBarListener:Landroidx/leanback/widget/SearchBar$SearchBarListener;

.field mSearchQuery:Ljava/lang/String;

.field mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

.field mSoundMap:Landroid/util/SparseIntArray;

.field mSoundPool:Landroid/media/SoundPool;

.field mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

.field private mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

.field private mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

.field private final mTextColor:I

.field private final mTextColorSpeechMode:I

.field private final mTextHintColor:I

.field private final mTextHintColorSpeechMode:I

.field private mTitle:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/leanback/widget/SearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/leanback/widget/SearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Landroidx/leanback/widget/SearchBar;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x0

    iput-boolean p2, p0, Landroidx/leanback/widget/SearchBar;->mAutoStartRecognition:Z

    new-instance p3, Landroid/util/SparseIntArray;

    invoke-direct {p3}, Landroid/util/SparseIntArray;-><init>()V

    iput-object p3, p0, Landroidx/leanback/widget/SearchBar;->mSoundMap:Landroid/util/SparseIntArray;

    iput-boolean p2, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/leanback/R$layout;->lb_search_bar:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$dimen;->lb_search_bar_height:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/leanback/widget/SearchBar;->mBarHeight:I

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Landroidx/leanback/widget/SearchBar;->mBarHeight:I

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p2}, Landroidx/leanback/widget/SearchBar;->setBackgroundColor(I)V

    invoke-virtual {p0, p2}, Landroidx/leanback/widget/SearchBar;->setClipChildren(Z)V

    const-string p2, ""

    iput-object p2, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    const-string p2, "input_method"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    sget p1, Landroidx/leanback/R$color;->lb_search_bar_text_speech_mode:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mTextColorSpeechMode:I

    sget p1, Landroidx/leanback/R$color;->lb_search_bar_text:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mTextColor:I

    sget p1, Landroidx/leanback/R$integer;->lb_search_bar_speech_mode_background_alpha:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mBackgroundSpeechAlpha:I

    sget p1, Landroidx/leanback/R$integer;->lb_search_bar_text_mode_background_alpha:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mBackgroundAlpha:I

    sget p1, Landroidx/leanback/R$color;->lb_search_bar_hint_speech_mode:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColorSpeechMode:I

    sget p1, Landroidx/leanback/R$color;->lb_search_bar_hint:I

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColor:I

    return-void
.end method

.method private isVoiceMode()Z
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    invoke-virtual {v0}, Landroidx/leanback/widget/SpeechOrbView;->isFocused()Z

    move-result v0

    return v0
.end method

.method private loadSounds(Landroid/content/Context;)V
    .locals 7

    const/4 v0, 0x4

    new-array v1, v0, [I

    sget v2, Landroidx/leanback/R$raw;->lb_voice_failure:I

    const/4 v3, 0x0

    aput v2, v1, v3

    sget v2, Landroidx/leanback/R$raw;->lb_voice_open:I

    const/4 v4, 0x1

    aput v2, v1, v4

    sget v2, Landroidx/leanback/R$raw;->lb_voice_no_input:I

    const/4 v5, 0x2

    aput v2, v1, v5

    sget v2, Landroidx/leanback/R$raw;->lb_voice_success:I

    const/4 v5, 0x3

    aput v2, v1, v5

    :goto_0
    if-ge v3, v0, :cond_0

    aget v2, v1, v3

    iget-object v5, p0, Landroidx/leanback/widget/SearchBar;->mSoundMap:Landroid/util/SparseIntArray;

    iget-object v6, p0, Landroidx/leanback/widget/SearchBar;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v6, p1, v2, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v6

    invoke-virtual {v5, v2, v6}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private play(I)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mHandler:Landroid/os/Handler;

    new-instance v1, Landroidx/leanback/widget/SearchBar$10;

    invoke-direct {v1, p0, p1}, Landroidx/leanback/widget/SearchBar$10;-><init>(Landroidx/leanback/widget/SearchBar;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private updateHint()V
    .locals 5

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$string;->lb_search_bar_hint:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mTitle:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->isVoiceMode()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Landroidx/leanback/R$string;->lb_search_bar_hint_with_title_speech:I

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Landroidx/leanback/widget/SearchBar;->mTitle:Ljava/lang/String;

    aput-object v4, v2, v1

    invoke-virtual {v0, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Landroidx/leanback/R$string;->lb_search_bar_hint_with_title:I

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Landroidx/leanback/widget/SearchBar;->mTitle:Ljava/lang/String;

    aput-object v4, v2, v1

    invoke-virtual {v0, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->isVoiceMode()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroidx/leanback/R$string;->lb_search_bar_hint_speech:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    :goto_0
    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mHint:Ljava/lang/String;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    if-eqz v1, :cond_3

    invoke-virtual {v1, v0}, Landroidx/leanback/widget/SearchEditText;->setHint(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public displayCompletions(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Landroid/view/inputmethod/CompletionInfo;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v2, v3, v4, v5, v1}, Landroid/view/inputmethod/CompletionInfo;-><init>(JILjava/lang/CharSequence;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Landroid/view/inputmethod/CompletionInfo;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/view/inputmethod/CompletionInfo;

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/SearchBar;->displayCompletions([Landroid/view/inputmethod/CompletionInfo;)V

    return-void
.end method

.method public displayCompletions([Landroid/view/inputmethod/CompletionInfo;)V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, v1, p1}, Landroid/view/inputmethod/InputMethodManager;->displayCompletions(Landroid/view/View;[Landroid/view/inputmethod/CompletionInfo;)V

    return-void
.end method

.method public getBadgeDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mBadgeDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getHint()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mHint:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method hideNativeKeyboard()V
    .locals 3

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v1}, Landroidx/leanback/widget/SearchEditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

.method public isRecognizing()Z
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSoundPool:Landroid/media/SoundPool;

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Landroidx/leanback/widget/SearchBar;->loadSounds(Landroid/content/Context;)V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->stopRecognition()V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    sget v0, Landroidx/leanback/R$id;->lb_search_bar_items:I

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mBarBackground:Landroid/graphics/drawable/Drawable;

    sget v0, Landroidx/leanback/R$id;->lb_search_text_editor:I

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/leanback/widget/SearchEditText;

    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    sget v0, Landroidx/leanback/R$id;->lb_search_bar_badge:I

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mBadgeView:Landroid/widget/ImageView;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mBadgeDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    new-instance v1, Landroidx/leanback/widget/SearchBar$1;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$1;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    new-instance v0, Landroidx/leanback/widget/SearchBar$2;

    invoke-direct {v0, p0}, Landroidx/leanback/widget/SearchBar$2;-><init>(Landroidx/leanback/widget/SearchBar;)V

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    new-instance v2, Landroidx/leanback/widget/SearchBar$3;

    invoke-direct {v2, p0, v0}, Landroidx/leanback/widget/SearchBar$3;-><init>(Landroidx/leanback/widget/SearchBar;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Landroidx/leanback/widget/SearchEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    new-instance v1, Landroidx/leanback/widget/SearchBar$4;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$4;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setOnKeyboardDismissListener(Landroidx/leanback/widget/SearchEditText$OnKeyboardDismissListener;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    new-instance v1, Landroidx/leanback/widget/SearchBar$5;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$5;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    const-string v1, "escapeNorth,voiceDismiss"

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setPrivateImeOptions(Ljava/lang/String;)V

    sget v0, Landroidx/leanback/R$id;->lb_search_bar_speech_orb:I

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/leanback/widget/SpeechOrbView;

    iput-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    new-instance v1, Landroidx/leanback/widget/SearchBar$6;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$6;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SpeechOrbView;->setOnOrbClickedListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    new-instance v1, Landroidx/leanback/widget/SearchBar$7;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$7;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SpeechOrbView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->hasFocus()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/leanback/widget/SearchBar;->updateUi(Z)V

    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->updateHint()V

    return-void
.end method

.method playSearchFailure()V
    .locals 1

    sget v0, Landroidx/leanback/R$raw;->lb_voice_failure:I

    invoke-direct {p0, v0}, Landroidx/leanback/widget/SearchBar;->play(I)V

    return-void
.end method

.method playSearchOpen()V
    .locals 1

    sget v0, Landroidx/leanback/R$raw;->lb_voice_open:I

    invoke-direct {p0, v0}, Landroidx/leanback/widget/SearchBar;->play(I)V

    return-void
.end method

.method playSearchSuccess()V
    .locals 1

    sget v0, Landroidx/leanback/R$raw;->lb_voice_success:I

    invoke-direct {p0, v0}, Landroidx/leanback/widget/SearchBar;->play(I)V

    return-void
.end method

.method public setBadgeDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mBadgeDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mBadgeView:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mBadgeView:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mBadgeView:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setNextFocusDownId(I)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/SpeechOrbView;->setNextFocusDownId(I)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/SearchEditText;->setNextFocusDownId(I)V

    return-void
.end method

.method public setPermissionListener(Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mPermissionListener:Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;

    return-void
.end method

.method public setSearchAffordanceColors(Landroidx/leanback/widget/SearchOrbView$Colors;)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/SpeechOrbView;->setNotListeningOrbColors(Landroidx/leanback/widget/SearchOrbView$Colors;)V

    :cond_0
    return-void
.end method

.method public setSearchAffordanceColorsInListening(Landroidx/leanback/widget/SearchOrbView$Colors;)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/SpeechOrbView;->setListeningOrbColors(Landroidx/leanback/widget/SearchOrbView$Colors;)V

    :cond_0
    return-void
.end method

.method public setSearchBarListener(Landroidx/leanback/widget/SearchBar$SearchBarListener;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchBarListener:Landroidx/leanback/widget/SearchBar$SearchBarListener;

    return-void
.end method

.method public setSearchQuery(Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->stopRecognition()V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, p1}, Landroidx/leanback/widget/SearchEditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroidx/leanback/widget/SearchBar;->setSearchQueryInternal(Ljava/lang/String;)V

    return-void
.end method

.method setSearchQueryInternal(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchBarListener:Landroidx/leanback/widget/SearchBar$SearchBarListener;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Landroidx/leanback/widget/SearchBar$SearchBarListener;->onSearchQueryChange(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public setSpeechRecognitionCallback(Landroidx/leanback/widget/SpeechRecognitionCallback;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can\'t have speech recognizer and request"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method public setSpeechRecognizer(Landroid/speech/SpeechRecognizer;)V
    .locals 2

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->stopRecognition()V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    iget-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mListening:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->cancel()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mListening:Z

    :cond_0
    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

    if-eqz v0, :cond_2

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can\'t have speech recognizer and request"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Landroidx/leanback/widget/SearchBar;->mTitle:Ljava/lang/String;

    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->updateHint()V

    return-void
.end method

.method showNativeKeyboard()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mHandler:Landroid/os/Handler;

    new-instance v1, Landroidx/leanback/widget/SearchBar$8;

    invoke-direct {v1, p0}, Landroidx/leanback/widget/SearchBar$8;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public startRecognition()V
    .locals 4

    iget-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->requestFocus()Z

    :cond_1
    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

    const-string v1, ""

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

    invoke-interface {v0}, Landroidx/leanback/widget/SpeechRecognitionCallback;->recognizeSpeech()V

    iput-boolean v2, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    return-void

    :cond_2
    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    if-nez v0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v3, "android.permission.RECORD_AUDIO"

    invoke-virtual {v0, v3}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_4

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mPermissionListener:Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroidx/leanback/widget/SearchBar$SearchBarPermissionListener;->requestAudioPermission()V

    return-void

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "android.permission.RECORD_AUDIO required for search"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    iput-boolean v2, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.speech.extra.LANGUAGE_MODEL"

    const-string v3, "free_form"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.speech.extra.PARTIAL_RESULTS"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    new-instance v3, Landroidx/leanback/widget/SearchBar$9;

    invoke-direct {v3, p0}, Landroidx/leanback/widget/SearchBar$9;-><init>(Landroidx/leanback/widget/SearchBar;)V

    invoke-virtual {v1, v3}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    iput-boolean v2, p0, Landroidx/leanback/widget/SearchBar;->mListening:Z

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v1, v0}, Landroid/speech/SpeechRecognizer;->startListening(Landroid/content/Intent;)V

    return-void
.end method

.method public stopRecognition()V
    .locals 2

    iget-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mHint:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/leanback/widget/SearchEditText;->setHint(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognitionCallback:Landroidx/leanback/widget/SpeechRecognitionCallback;

    if-nez v1, :cond_3

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechOrbView:Landroidx/leanback/widget/SpeechOrbView;

    invoke-virtual {v1}, Landroidx/leanback/widget/SpeechOrbView;->showNotListening()V

    iget-boolean v1, p0, Landroidx/leanback/widget/SearchBar;->mListening:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v1}, Landroid/speech/SpeechRecognizer;->cancel()V

    iput-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mListening:Z

    :cond_2
    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSpeechRecognizer:Landroid/speech/SpeechRecognizer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    :cond_3
    :goto_0
    return-void
.end method

.method submitQuery()V
    .locals 2

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/leanback/widget/SearchBar;->mSearchBarListener:Landroidx/leanback/widget/SearchBar$SearchBarListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroidx/leanback/widget/SearchBar;->mSearchQuery:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/leanback/widget/SearchBar$SearchBarListener;->onSearchQuerySubmit(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method toggleRecognition()V
    .locals 1

    iget-boolean v0, p0, Landroidx/leanback/widget/SearchBar;->mRecognizing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->stopRecognition()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/leanback/widget/SearchBar;->startRecognition()V

    :goto_0
    return-void
.end method

.method updateUi(Z)V
    .locals 1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mBarBackground:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mBackgroundSpeechAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->isVoiceMode()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColorSpeechMode:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setTextColor(I)V

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColorSpeechMode:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setHintTextColor(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextColorSpeechMode:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setTextColor(I)V

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColorSpeechMode:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setHintTextColor(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mBarBackground:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mBackgroundAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextColor:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setTextColor(I)V

    iget-object p1, p0, Landroidx/leanback/widget/SearchBar;->mSearchTextEditor:Landroidx/leanback/widget/SearchEditText;

    iget v0, p0, Landroidx/leanback/widget/SearchBar;->mTextHintColor:I

    invoke-virtual {p1, v0}, Landroidx/leanback/widget/SearchEditText;->setHintTextColor(I)V

    :goto_0
    invoke-direct {p0}, Landroidx/leanback/widget/SearchBar;->updateHint()V

    return-void
.end method
