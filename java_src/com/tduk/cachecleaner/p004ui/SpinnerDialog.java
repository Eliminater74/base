package com.tduk.cachecleaner.p004ui;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import java.util.ArrayList;
import java.util.Iterator;
/* renamed from: com.tduk.cachecleaner.ui.SpinnerDialog */
/* loaded from: classes.dex */
public class SpinnerDialog implements Runnable, DialogInterface.OnCancelListener {
    private static ArrayList<SpinnerDialog> rundownDialogs = new ArrayList<>();
    private Activity activity;
    private boolean finish;
    private String message;
    private ProgressDialog progress = null;
    private String title;

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
    }

    public SpinnerDialog(Activity activity, String str, String str2, boolean z) {
        this.activity = activity;
        this.title = str;
        this.message = str2;
        this.finish = z;
    }

    public static SpinnerDialog displayDialog(Activity activity, String str, String str2, boolean z) {
        SpinnerDialog spinnerDialog = new SpinnerDialog(activity, str, str2, z);
        activity.runOnUiThread(spinnerDialog);
        return spinnerDialog;
    }

    public static void closeDialogs() {
        Iterator<SpinnerDialog> it = rundownDialogs.iterator();
        while (it.hasNext()) {
            it.next().progress.dismiss();
        }
        rundownDialogs.clear();
    }

    public void dismiss() {
        this.activity.runOnUiThread(this);
    }

    @Override // java.lang.Runnable
    public void run() {
        ProgressDialog progressDialog = this.progress;
        if (progressDialog == null) {
            if (this.activity.isFinishing()) {
                return;
            }
            ProgressDialog progressDialog2 = new ProgressDialog(this.activity);
            this.progress = progressDialog2;
            progressDialog2.setTitle(this.title);
            this.progress.setMessage(this.message);
            this.progress.setProgressStyle(0);
            this.progress.setOnCancelListener(this);
            if (this.finish) {
                this.progress.setCancelable(true);
                this.progress.setCanceledOnTouchOutside(false);
            } else {
                this.progress.setCancelable(false);
            }
            this.progress.show();
            return;
        }
        progressDialog.dismiss();
    }
}
