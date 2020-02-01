diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java"
index 47fc17b..4865ca7 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManagerBuilder.java"
@@ -15,11 +15,13 @@ import com.facebook.react.bridge.JSIModulePackage;
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
@@ -274,7 +276,7 @@ public class ReactInstanceManagerBuilder {
         mCurrentActivity,
         mDefaultHardwareBackBtnHandler,
         mJavaScriptExecutorFactory == null
-            ? new JSCExecutorFactory(appName, deviceName)
+            ? new V8ExecutorFactory(appName, deviceName)
             : mJavaScriptExecutorFactory,
         (mJSBundleLoader == null && mJSBundleAssetUrl != null)
             ? JSBundleLoader.createAssetLoader(
