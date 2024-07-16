package com.tduk.cachecleaner;

import android.content.Context;
import androidx.preference.PreferenceManager;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class AppsWhitelistUtils {
    public static ArrayList<String> getWhitelist(Context context) {
        String string = PreferenceManager.getDefaultSharedPreferences(context).getString("apps_whitelist", null);
        if (string != null) {
            return (ArrayList) new Gson().newBuilder().create().fromJson(string, new TypeToken<ArrayList<String>>() { // from class: com.tduk.cachecleaner.AppsWhitelistUtils.1
            }.getType());
        }
        return new ArrayList<>();
    }

    public static void addAppToWhitelist(Context context, String str) {
        ArrayList<String> whitelist = getWhitelist(context);
        whitelist.add(str);
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString("apps_whitelist", new Gson().newBuilder().create().toJson(whitelist)).apply();
    }

    public static void removeAppFromWhitelist(Context context, String str) {
        ArrayList<String> whitelist = getWhitelist(context);
        whitelist.remove(str);
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString("apps_whitelist", new Gson().newBuilder().create().toJson(whitelist)).apply();
    }
}
