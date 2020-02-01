diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstanceImpl.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstanceImpl.java"
index b2325fd..0574e3f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstanceImpl.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstanceImpl.java"
@@ -107,7 +107,8 @@ public class CatalystInstanceImpl implements CatalystInstance {
       final JavaScriptExecutor jsExecutor,
       final NativeModuleRegistry nativeModuleRegistry,
       final JSBundleLoader jsBundleLoader,
-      NativeModuleCallExceptionHandler nativeModuleCallExceptionHandler) {
+      NativeModuleCallExceptionHandler nativeModuleCallExceptionHandler,
+      CatalystInstanceEventListener catalystInstanceEventListener) {
     Log.d(ReactConstants.TAG, "Initializing React Xplat Bridge.");
     Systrace.beginSection(TRACE_TAG_REACT_JAVA_BRIDGE, "createCatalystInstanceImpl");
 
@@ -125,15 +126,23 @@ public class CatalystInstanceImpl implements CatalystInstance {
     mTraceListener = new JSProfilerTraceListener(this);
     Systrace.endSection(TRACE_TAG_REACT_JAVA_BRIDGE);
 
+    Log.d(ReactConstants.TAG, "Create module registry");
+
+    createModuleRegistry(mNativeModulesQueueThread,
+      mNativeModuleRegistry.getJavaModules(this),
+      mNativeModuleRegistry.getCxxModules());
+
+    if (catalystInstanceEventListener != null) {
+      Log.d(ReactConstants.TAG, "Invoking callback onModuleRegistryCreated");
+      catalystInstanceEventListener.onModuleRegistryCreated(this);
+    }
+
     Log.d(ReactConstants.TAG, "Initializing React Xplat Bridge before initializeBridge");
     Systrace.beginSection(TRACE_TAG_REACT_JAVA_BRIDGE, "initializeCxxBridge");
     initializeBridge(
       new BridgeCallback(this),
       jsExecutor,
-      mReactQueueConfiguration.getJSQueueThread(),
-      mNativeModulesQueueThread,
-      mNativeModuleRegistry.getJavaModules(this),
-      mNativeModuleRegistry.getCxxModules());
+      mReactQueueConfiguration.getJSQueueThread());
     Log.d(ReactConstants.TAG, "Initializing React Xplat Bridge after initializeBridge");
     Systrace.endSection(TRACE_TAG_REACT_JAVA_BRIDGE);
 
@@ -195,13 +204,15 @@ public class CatalystInstanceImpl implements CatalystInstance {
     Collection<JavaModuleWrapper> javaModules,
     Collection<ModuleHolder> cxxModules);
 
+  private native void createModuleRegistry(
+    MessageQueueThread moduleQueue,
+    Collection<JavaModuleWrapper> javaModules,
+    Collection<ModuleHolder> cxxModules);
+
   private native void initializeBridge(
-      ReactCallback callback,
-      JavaScriptExecutor jsExecutor,
-      MessageQueueThread jsQueue,
-      MessageQueueThread moduleQueue,
-      Collection<JavaModuleWrapper> javaModules,
-      Collection<ModuleHolder> cxxModules);
+    ReactCallback callback,
+    JavaScriptExecutor jsExecutor,
+    MessageQueueThread jsQueue);
 
   @Override
   public void setSourceURLs(String deviceURL, String remoteURL) {
@@ -367,7 +378,6 @@ public class CatalystInstanceImpl implements CatalystInstance {
                     mJavaScriptContextHolder.clear();
 
                     mHybridData.resetNative();
-                    getReactQueueConfiguration().destroy();
                     Log.d(ReactConstants.TAG, "CatalystInstanceImpl.destroy() end");
                     ReactMarker.logMarker(ReactMarkerConstants.DESTROY_CATALYST_INSTANCE_END);
                   }
@@ -498,6 +508,9 @@ public class CatalystInstanceImpl implements CatalystInstance {
 
   private native long getJavaScriptContext();
 
+  @Override
+  public native long getPointerOfInstancePointer();
+
   private void incrementPendingJSCalls() {
     int oldPendingCalls = mPendingJSCalls.getAndIncrement();
     boolean wasIdle = oldPendingCalls == 0;
@@ -595,6 +608,7 @@ public class CatalystInstanceImpl implements CatalystInstance {
     private @Nullable NativeModuleRegistry mRegistry;
     private @Nullable JavaScriptExecutor mJSExecutor;
     private @Nullable NativeModuleCallExceptionHandler mNativeModuleCallExceptionHandler;
+    private @Nullable CatalystInstanceEventListener mCatalystInstanceEventListener;
 
 
     public Builder setReactQueueConfigurationSpec(
@@ -624,13 +638,20 @@ public class CatalystInstanceImpl implements CatalystInstance {
       return this;
     }
 
+    public Builder setCatalystInstanceEventListener(
+      CatalystInstanceEventListener catalystInstanceEventListener) {
+      mCatalystInstanceEventListener = catalystInstanceEventListener;
+      return this;
+    }
+
     public CatalystInstanceImpl build() {
       return new CatalystInstanceImpl(
-          Assertions.assertNotNull(mReactQueueConfigurationSpec),
-          Assertions.assertNotNull(mJSExecutor),
-          Assertions.assertNotNull(mRegistry),
-          Assertions.assertNotNull(mJSBundleLoader),
-          Assertions.assertNotNull(mNativeModuleCallExceptionHandler));
+        Assertions.assertNotNull(mReactQueueConfigurationSpec),
+        Assertions.assertNotNull(mJSExecutor),
+        Assertions.assertNotNull(mRegistry),
+        Assertions.assertNotNull(mJSBundleLoader),
+        Assertions.assertNotNull(mNativeModuleCallExceptionHandler),
+        mCatalystInstanceEventListener);
     }
   }
 }
