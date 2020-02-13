--- "e:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java"	2020-01-30 13:55:48.238578900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java"	2020-01-29 14:10:09.339920000 -0800
@@ -15,11 +15,13 @@
 import com.facebook.react.bridge.JavaScriptExecutorFactory;
 import com.facebook.react.bridge.NativeModuleCallExceptionHandler;
 import com.facebook.react.bridge.NotThreadSafeBridgeIdleDebugListener;
+import com.facebook.react.bridge.WritableNativeMap;
 import com.facebook.react.common.LifecycleState;
 import com.facebook.react.devsupport.RedBoxHandler;
 import com.facebook.react.devsupport.interfaces.DevBundleDownloadListener;
 import com.facebook.react.devsupport.interfaces.DevSupportManager;
 import com.facebook.react.jscexecutor.JSCExecutorFactory;
+import com.facebook.react.v8executor.V8ExecutorFactory;
 import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler;
 import com.facebook.react.packagerconnection.RequestHandler;
 import com.facebook.react.uimanager.UIImplementationProvider;
@@ -274,7 +276,7 @@
         mCurrentActivity,
         mDefaultHardwareBackBtnHandler,
         mJavaScriptExecutorFactory == null
-            ? new JSCExecutorFactory(appName, deviceName)
+            ? new V8ExecutorFactory(appName, deviceName)
             : mJavaScriptExecutorFactory,
         (mJSBundleLoader == null && mJSBundleAssetUrl != null)
             ? JSBundleLoader.createAssetLoader(
