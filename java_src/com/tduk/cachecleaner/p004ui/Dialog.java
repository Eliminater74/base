package com.tduk.cachecleaner.p004ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import java.util.ArrayList;
import java.util.Iterator;
/* renamed from: com.tduk.cachecleaner.ui.Dialog */
/* loaded from: classes.dex */
public class Dialog implements Runnable {
    private static ArrayList<Dialog> rundownDialogs = new ArrayList<>();
    private Activity activity;
    AlertDialog alert;
    private boolean endAfterDismiss;
    private String message;
    private String title;

    public Dialog(Activity activity, String str, String str2, boolean z) {
        this.activity = activity;
        this.title = str;
        this.message = str2;
        this.endAfterDismiss = z;
    }

    public static void closeDialogs() {
        Iterator<Dialog> it = rundownDialogs.iterator();
        while (it.hasNext()) {
            it.next().alert.dismiss();
        }
        rundownDialogs.clear();
    }

    public static void displayDialog(Activity activity, String str, String str2, boolean z) {
        activity.runOnUiThread(new Dialog(activity, str, str2, z));
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.activity.isFinishing()) {
            return;
        }
        AlertDialog create = new AlertDialog.Builder(this.activity).create();
        this.alert = create;
        create.setTitle(this.title);
        this.alert.setMessage(this.message);
        this.alert.setCancelable(false);
        this.alert.setCanceledOnTouchOutside(false);
        this.alert.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.tduk.cachecleaner.ui.Dialog.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                Dialog.this.alert.dismiss();
                Dialog.rundownDialogs.remove(this);
                if (Dialog.this.endAfterDismiss) {
                    Dialog.this.activity.finish();
                }
            }
        });
        rundownDialogs.add(this);
        this.alert.show();
    }
}
