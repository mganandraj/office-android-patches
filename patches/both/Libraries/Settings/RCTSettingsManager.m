diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Settings\\RCTSettingsManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Settings\\RCTSettingsManager.m"
index ab8e14d..046ebed 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Settings\\RCTSettingsManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Settings\\RCTSettingsManager.m"
@@ -16,6 +16,10 @@
 {
   BOOL _ignoringUpdates;
   NSUserDefaults *_defaults;
+  
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  BOOL _isListeningForUpdates;
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 @synthesize bridge = _bridge;
@@ -37,11 +41,12 @@ RCT_EXPORT_MODULE()
   if ((self = [super init])) {
     _defaults = defaults;
 
-
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     [[NSNotificationCenter defaultCenter] addObserver:self
                                              selector:@selector(userDefaultsDidChange:)
                                                  name:NSUserDefaultsDidChangeNotification
                                                object:_defaults];
+#endif // TODO(macOS ISS#2323203)
   }
   return self;
 }
@@ -109,4 +114,29 @@ RCT_EXPORT_METHOD(deleteValues:(NSArray<NSString *> *)keys)
   _ignoringUpdates = NO;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+/**
+ * Enable or disable monitoring of changes to NSUserDefaults
+ */
+RCT_EXPORT_METHOD(setIsMonitoringEnabled:(BOOL)isEnabled)
+{
+  if (isEnabled) {
+    if (!_isListeningForUpdates) {
+      [[NSNotificationCenter defaultCenter] addObserver:self
+                                               selector:@selector(userDefaultsDidChange:)
+                                                   name:NSUserDefaultsDidChangeNotification
+                                                 object:_defaults];
+      _isListeningForUpdates = YES;
+    }
+  }
+  else
+  {
+    if (_isListeningForUpdates) {
+      [[NSNotificationCenter defaultCenter] removeObserver:self];
+      _isListeningForUpdates = NO;
+    }
+  }
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
