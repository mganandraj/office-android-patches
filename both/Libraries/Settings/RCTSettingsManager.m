diff --git a/E:/github/ms-react-native-forpatch/Libraries/Settings/RCTSettingsManager.m b/E:/github/fb-react-native-forpatch/Libraries/Settings/RCTSettingsManager.m
index 046ebed39..ab8e14dfc 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Settings/RCTSettingsManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Settings/RCTSettingsManager.m
@@ -16,10 +16,6 @@
 {
   BOOL _ignoringUpdates;
   NSUserDefaults *_defaults;
-  
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-  BOOL _isListeningForUpdates;
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 @synthesize bridge = _bridge;
@@ -41,12 +37,11 @@ RCT_EXPORT_MODULE()
   if ((self = [super init])) {
     _defaults = defaults;
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
     [[NSNotificationCenter defaultCenter] addObserver:self
                                              selector:@selector(userDefaultsDidChange:)
                                                  name:NSUserDefaultsDidChangeNotification
                                                object:_defaults];
-#endif // TODO(macOS ISS#2323203)
   }
   return self;
 }
@@ -114,29 +109,4 @@ RCT_EXPORT_METHOD(deleteValues:(NSArray<NSString *> *)keys)
   _ignoringUpdates = NO;
 }
 
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-/**
- * Enable or disable monitoring of changes to NSUserDefaults
- */
-RCT_EXPORT_METHOD(setIsMonitoringEnabled:(BOOL)isEnabled)
-{
-  if (isEnabled) {
-    if (!_isListeningForUpdates) {
-      [[NSNotificationCenter defaultCenter] addObserver:self
-                                               selector:@selector(userDefaultsDidChange:)
-                                                   name:NSUserDefaultsDidChangeNotification
-                                                 object:_defaults];
-      _isListeningForUpdates = YES;
-    }
-  }
-  else
-  {
-    if (_isListeningForUpdates) {
-      [[NSNotificationCenter defaultCenter] removeObserver:self];
-      _isListeningForUpdates = NO;
-    }
-  }
-}
-#endif // ]TODO(macOS ISS#2323203)
-
 @end
