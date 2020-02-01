diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManager.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManager.java"
index 022eb1c..9d53982 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManager.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\ReactInstanceManager.java"
@@ -49,12 +49,14 @@ import com.facebook.infer.annotation.ThreadConfined;
 import com.facebook.infer.annotation.ThreadSafe;
 import com.facebook.react.bridge.Arguments;
 import com.facebook.react.bridge.CatalystInstance;
+import com.facebook.react.bridge.CatalystInstance.CatalystInstanceEventListener;
 import com.facebook.react.bridge.CatalystInstanceImpl;
 import com.facebook.react.bridge.JSBundleLoader;
 import com.facebook.react.bridge.JSIModulePackage;
 import com.facebook.react.bridge.JavaJSExecutor;
 import com.facebook.react.bridge.JavaScriptExecutor;
 import com.facebook.react.bridge.JavaScriptExecutorFactory;
+import com.facebook.react.bridge.NativeArray;
 import com.facebook.react.bridge.NativeDeltaClient;
 import com.facebook.react.bridge.NativeModuleCallExceptionHandler;
 import com.facebook.react.bridge.NativeModuleRegistry;
@@ -168,6 +170,18 @@ public class ReactInstanceManager {
   private final @Nullable NativeModuleCallExceptionHandler mNativeModuleCallExceptionHandler;
   private final @Nullable JSIModulePackage mJSIModulePackage;
   private List<ViewManager> mViewManagers;
+  private final int mMinNumShakes;
+  private final int mMinTimeLeftInFrameForNonBatchedOperationMs;
+  private boolean mIsContextCreatedOnUIThread;
+  private @Nullable CatalystInstanceEventListener mCatalystInstanceEventListener;
+
+  private final DefaultHardwareBackBtnHandler mBackBtnHandler =
+      new DefaultHardwareBackBtnHandler() {
+        @Override
+        public void invokeDefaultOnBackPressed() {
+          ReactInstanceManager.this.invokeDefaultOnBackPressed();
+        }
+      };
 
   private class ReactContextInitParams {
     private final JavaScriptExecutorFactory mJsExecutorFactory;
@@ -246,6 +260,8 @@ public class ReactInstanceManager {
     mLifecycleState = initialLifecycleState;
     mMemoryPressureRouter = new MemoryPressureRouter(applicationContext);
     mNativeModuleCallExceptionHandler = nativeModuleCallExceptionHandler;
+    mMinTimeLeftInFrameForNonBatchedOperationMs = minTimeLeftInFrameForNonBatchedOperationMs;
+    mMinNumShakes = minNumShakes;
     synchronized (mPackages) {
       PrinterHolder.getPrinter()
           .logMessage(ReactDebugOverlayTags.RN_CORE, "RNCore: Use Split Packages");
@@ -340,6 +356,44 @@ public class ReactInstanceManager {
     recreateReactContextInBackgroundInner();
   }
 
+  @ThreadConfined(UI)
+  public void registerAdditionalPackages(List<ReactPackage> packages) {
+    if (packages == null || packages.isEmpty()) {
+      return;
+    }
+
+    // CatalystInstance hasn't been created, so add packages for later evaluation
+    if (!hasStartedCreatingInitialContext()) {
+      synchronized (mPackages) {
+        for (ReactPackage p : packages) {
+          if (!mPackages.contains(p)) {
+            mPackages.add(p);
+          }
+        }
+      }
+      return;
+    }
+
+    ReactContext context = getCurrentReactContext();
+    CatalystInstance catalystInstance = context != null ? context.getCatalystInstance() : null;
+
+    Assertions.assertNotNull(catalystInstance, "CatalystInstance null after hasStartedCreatingInitialContext true.");
+
+    // Do not create the new context but use the one we have already avaialable else NativeModuleRegistry will complain.
+    final ReactApplicationContext reactContext =  (ReactApplicationContext)context;
+
+    NativeModuleRegistry nativeModuleRegistry = processPackages(reactContext, packages, true);
+    catalystInstance.extendNativeModules(nativeModuleRegistry);
+  }
+
+  /**
+   *
+   * Register CatalystInstanceEventListener
+   */
+  public void setCatalystInstanceEventListener(CatalystInstanceEventListener catalystInstanceEventListener) {
+    mCatalystInstanceEventListener = catalystInstanceEventListener;
+  }
+
   /**
    * Recreate the react application and context. This should be called if configuration has changed
    * or the developer has requested the app to be reloaded. It should only be called after an
@@ -922,6 +976,8 @@ public class ReactInstanceManager {
       }
     }
 
+    // React context is getting created on a background thread.
+    mIsContextCreatedOnUIThread = false;
     mCreateReactContextThread =
         new Thread(
             null,
@@ -985,27 +1041,71 @@ public class ReactInstanceManager {
     mCreateReactContextThread.start();
   }
 
+  @ThreadConfined(UI)
+  public ReactContext createReactContextOnUIThread() {
+    Log.d(ReactConstants.TAG, "ReactInstanceManager.createReactContextOnUIThread()");
+    // React context is getting created on UI thread.
+    mIsContextCreatedOnUIThread = true;
+    final ReactContextInitParams initParams = new ReactContextInitParams(
+      mJavaScriptExecutorFactory,
+      mBundleLoader);
+
+    ReactApplicationContext reactApplicationContext = null;
+    // As destroy() may have run and set this to false, ensure that it is true before we create
+    mHasStartedCreatingInitialContext = true;
+    try {
+      reactApplicationContext = createReactContext(
+        initParams.getJsExecutorFactory().create(),
+        initParams.getJsBundleLoader());
+
+      mCreateReactContextThread = null;
+      ReactMarker.logMarker(PRE_SETUP_REACT_CONTEXT_START);
+
+      final ReactApplicationContext reactApplicationContextFinal = reactApplicationContext;
+
+      Runnable setupReactContextRunnable =
+        new Runnable() {
+          @Override
+          public void run() {
+            try {
+              setupReactContext(reactApplicationContextFinal);
+            } catch (Exception e) {
+              mDevSupportManager.handleException(e);
+            }
+          }
+        };
+
+      reactApplicationContext.runOnNativeModulesQueueThread(setupReactContextRunnable);
+    } catch (Exception e) {
+      mDevSupportManager.handleException(e);
+    }
+
+    return reactApplicationContext;
+  }
+
   private void setupReactContext(final ReactApplicationContext reactContext) {
     Log.d(ReactConstants.TAG, "ReactInstanceManager.setupReactContext()");
     ReactMarker.logMarker(PRE_SETUP_REACT_CONTEXT_END);
     ReactMarker.logMarker(SETUP_REACT_CONTEXT_START);
     Systrace.beginSection(TRACE_TAG_REACT_JAVA_BRIDGE, "setupReactContext");
-    synchronized (mAttachedReactRoots) {
-      synchronized (mReactContextLock) {
-        mCurrentReactContext = Assertions.assertNotNull(reactContext);
-      }
-
-      CatalystInstance catalystInstance =
-          Assertions.assertNotNull(reactContext.getCatalystInstance());
+    synchronized (mReactContextLock) {
+      mCurrentReactContext = Assertions.assertNotNull(reactContext);
+    }
+    final CatalystInstance catalystInstance =
+      Assertions.assertNotNull(reactContext.getCatalystInstance());
 
       catalystInstance.initialize();
       mDevSupportManager.onNewReactContextCreated(reactContext);
       mMemoryPressureRouter.addMemoryPressureListener(catalystInstance);
       moveReactContextToCurrentLifecycleState();
 
+    // Do not attach root views if the context is created synchronously on UI thread.
+    if (!mIsContextCreatedOnUIThread) {
       ReactMarker.logMarker(ATTACH_MEASURED_ROOT_VIEWS_START);
-      for (ReactRoot reactRoot : mAttachedReactRoots) {
-        attachRootViewToInstance(reactRoot);
+      synchronized (mAttachedReactRoots) {
+        for (ReactRoot mAttachedReactRoots : mAttachedReactRoots) {
+          attachRootViewToInstance(mAttachedReactRoots);
+        }
       }
       ReactMarker.logMarker(ATTACH_MEASURED_ROOT_VIEWS_END);
     }
@@ -1127,7 +1227,8 @@ public class ReactInstanceManager {
       .setJSExecutor(jsExecutor)
       .setRegistry(nativeModuleRegistry)
       .setJSBundleLoader(jsBundleLoader)
-      .setNativeModuleCallExceptionHandler(exceptionHandler);
+      .setNativeModuleCallExceptionHandler(exceptionHandler)
+      .setCatalystInstanceEventListener(mCatalystInstanceEventListener);
 
     ReactMarker.logMarker(CREATE_CATALYST_INSTANCE_START);
     // CREATE_CATALYST_INSTANCE_END is in JSCExecutor.cpp
