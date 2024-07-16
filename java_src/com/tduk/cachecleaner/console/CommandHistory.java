package com.tduk.cachecleaner.console;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.ContextMenu;
import java.util.LinkedList;
/* loaded from: classes.dex */
public class CommandHistory {
    private int historyLimit;
    private SharedPreferences prefs;
    private LinkedList<String> previousCommands = new LinkedList<>();

    public static CommandHistory loadCommandHistoryFromPrefs(int i, Context context, String str) {
        CommandHistory commandHistory = new CommandHistory(i);
        SharedPreferences sharedPreferences = context.getSharedPreferences(str, 0);
        commandHistory.prefs = sharedPreferences;
        int i2 = sharedPreferences.getInt("Size", 0);
        for (int i3 = 0; i3 < i2; i3++) {
            String string = commandHistory.prefs.getString("" + i3, null);
            if (string != null) {
                commandHistory.add(string);
            }
        }
        return commandHistory;
    }

    private CommandHistory(int i) {
        this.historyLimit = i;
    }

    public void add(String str) {
        if (this.previousCommands.size() > this.historyLimit) {
            this.previousCommands.removeFirst();
        }
        this.previousCommands.add(str);
    }

    public void populateMenu(ContextMenu contextMenu) {
        for (int size = this.previousCommands.size() - 1; size >= 0; size--) {
            contextMenu.add(0, 0, 0, this.previousCommands.get(size));
        }
    }

    public void save() {
        SharedPreferences.Editor edit = this.prefs.edit();
        for (int i = 0; i < this.previousCommands.size(); i++) {
            edit.putString("" + i, this.previousCommands.get(i));
        }
        edit.putInt("Size", this.previousCommands.size());
        edit.apply();
    }
}
