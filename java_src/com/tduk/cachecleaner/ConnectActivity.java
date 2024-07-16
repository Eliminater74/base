package com.tduk.cachecleaner;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.cgutman.adblib.AdbCrypto;
import com.tduk.cachecleaner.p004ui.Dialog;
import com.tduk.cachecleaner.p004ui.SpinnerDialog;
/* loaded from: classes.dex */
public class ConnectActivity extends Activity implements View.OnClickListener {
    private static final String PREFS_FILE = "AdbConnectPrefs";
    private boolean autoConnect = false;
    private Button connectButton;
    private EditText ipField;
    private SpinnerDialog keygenSpinner;
    private EditText portField;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(com.tduk.appklr.R.layout.activity_connect);
        this.connectButton = (Button) findViewById(com.tduk.appklr.R.id.connect);
        this.ipField = (EditText) findViewById(com.tduk.appklr.R.id.ipAddressField);
        this.portField = (EditText) findViewById(com.tduk.appklr.R.id.portField);
        this.connectButton.setOnClickListener(this);
        loadPreferences();
        if (this.autoConnect) {
            this.connectButton.performClick();
        }
        if (AdbUtils.readCryptoConfig(getFilesDir()) == null) {
            this.keygenSpinner = SpinnerDialog.displayDialog(this, "Generating RSA Key Pair", "This will only be done once.", true);
            new Thread(new Runnable() { // from class: com.tduk.cachecleaner.ConnectActivity.1
                @Override // java.lang.Runnable
                public void run() {
                    AdbCrypto writeNewCryptoConfig = AdbUtils.writeNewCryptoConfig(ConnectActivity.this.getFilesDir());
                    ConnectActivity.this.keygenSpinner.dismiss();
                    if (writeNewCryptoConfig == null) {
                        Dialog.displayDialog(ConnectActivity.this, "Key Pair Generation Failed", "Unable to generate and save RSA key pair", true);
                    } else {
                        Dialog.displayDialog(ConnectActivity.this, "New Key Pair Generated", "Devices running 4.2.2 will need to be plugged in to a computer the next time you connect to them", false);
                    }
                }
            }).start();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        Dialog.closeDialogs();
        SpinnerDialog.closeDialogs();
        super.onDestroy();
    }

    private void loadPreferences() {
        SharedPreferences sharedPreferences = getSharedPreferences(PREFS_FILE, 0);
        this.ipField.setText(sharedPreferences.getString("IP", "localhost"));
        this.portField.setText(sharedPreferences.getString("Port", "5555"));
        this.autoConnect = sharedPreferences.getBoolean("auto_connect", false);
    }

    private void savePreferences() {
        SharedPreferences.Editor edit = getSharedPreferences(PREFS_FILE, 0).edit();
        edit.putString("IP", this.ipField.getText().toString());
        edit.putString("Port", this.portField.getText().toString());
        edit.apply();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Intent intent = new Intent(this, ShellAutoRunner.class);
        intent.putExtra("IP", this.ipField.getText().toString());
        try {
            int parseInt = Integer.parseInt(this.portField.getText().toString());
            if (parseInt > 0 && parseInt <= 65535) {
                intent.putExtra("Port", parseInt);
                savePreferences();
                startActivity(intent);
                return;
            }
            Dialog.displayDialog(this, "Invalid Port", "The port number must be between 1 and 65535", false);
        } catch (NumberFormatException unused) {
            Dialog.displayDialog(this, "Invalid Port", "The port must be an integer", false);
        }
    }
}
