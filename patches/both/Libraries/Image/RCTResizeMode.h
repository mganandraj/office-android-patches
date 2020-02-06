--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTResizeMode.h"	2020-01-30 13:55:47.910611200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTResizeMode.h"	2020-01-29 14:10:08.904882100 -0800
@@ -8,10 +8,17 @@
 #import <React/RCTConvert.h>
 
 typedef NS_ENUM(NSInteger, RCTResizeMode) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   RCTResizeModeCover = UIViewContentModeScaleAspectFill,
   RCTResizeModeContain = UIViewContentModeScaleAspectFit,
   RCTResizeModeStretch = UIViewContentModeScaleToFill,
   RCTResizeModeCenter = UIViewContentModeCenter,
+#else // [TODO(macOS ISS#2323203)
+  RCTResizeModeCover = -2, // Not supported by NSImageView
+  RCTResizeModeContain = NSImageScaleProportionallyUpOrDown,
+  RCTResizeModeStretch = NSImageScaleAxesIndependently,
+  RCTResizeModeCenter = NSImageScaleNone, // assumes NSImageAlignmentCenter
+#endif // ]TODO(macOS ISS#2323203)
   RCTResizeModeRepeat = -1, // Use negative values to avoid conflicts with iOS enum values.
 };
 
