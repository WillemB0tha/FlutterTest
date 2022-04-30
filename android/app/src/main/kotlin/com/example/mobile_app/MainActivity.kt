package com.example.mobile.app

import io.flutter.embedding.android.FlutterActivity
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.crashes.Crashes;

class MainActivity: FlutterActivity() {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        AppCenter.start(getApplication(), "e7393c7b-0bb8-4cc1-a35a-da1c9d8f2a95", Analytics.class, Crashes.class);
    }
}
