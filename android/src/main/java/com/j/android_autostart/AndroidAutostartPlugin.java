package com.j.android_autostart;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AndroidAutostartPlugin */
public class AndroidAutostartPlugin implements FlutterPlugin, MethodCallHandler  {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "android_autostart");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("customSetComponent")) {
      String manufacturer = call.argument("manufacturer");
      String pkg = call.argument("pkg");
      String cls = call.argument("cls");
      customSetComponent(manufacturer,pkg,cls,result);
    }else if(call.method.equals("navigateAutoStartSetting")) {
      navigateAutoStartSetting(result);
    } else{
      result.notImplemented();
    }
  }


  private void customSetComponent(String manufacturer, String pkg, String cls,@NonNull Result result){
    String systemManufacturer = android.os.Build.MANUFACTURER;
    try {
      Intent intent = new Intent();
      if (manufacturer.equalsIgnoreCase(systemManufacturer)) {
        intent.setComponent(new ComponentName(pkg, cls));
      }
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      context.startActivity(intent);
      result.success("Success");
    }catch (Exception e){
      result.error("Failed",e.toString(),"");
    }
  }

  private void navigateAutoStartSetting(@NonNull Result result) {
    String manufacturer = android.os.Build.MANUFACTURER;
    try {
      Intent intent = new Intent();
      if ("xiaomi".equalsIgnoreCase(manufacturer)) {
        intent.setComponent(new ComponentName("com.miui.securitycenter", "com.miui.permcenter.autostart.AutoStartManagementActivity"));
      } else if ("oppo".equalsIgnoreCase(manufacturer)) {
        intent.setComponent(new ComponentName("com.coloros.safecenter", "com.coloros.safecenter.permission.startup.StartupAppListActivity"));
      } else if ("vivo".equalsIgnoreCase(manufacturer)) {
        intent.setComponent(new ComponentName("com.vivo.permissionmanager", "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"));
      } else if ("Letv".equalsIgnoreCase(manufacturer)) {
        intent.setComponent(new ComponentName("com.letv.android.letvsafe", "com.letv.android.letvsafe.AutobootManageActivity"));
      } else if ("Honor".equalsIgnoreCase(manufacturer)) {
        intent.setComponent(new ComponentName("com.huawei.systemmanager", "com.huawei.systemmanager.optimize.process.ProtectActivity"));
      }else{
        return;
      }
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      context.startActivity(intent);

      result.success("Success");
    }catch (Exception e){
      result.error("Failed",e.toString(),"");
    }
  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}




