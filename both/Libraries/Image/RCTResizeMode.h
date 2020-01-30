diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTResizeMode.h b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTResizeMode.h
index f175d958f..9d49f2d32 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTResizeMode.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTResizeMode.h
@@ -8,17 +8,10 @@
 #import <React/RCTConvert.h>
 
 typedef NS_ENUM(NSInteger, RCTResizeMode) {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   RCTResizeModeCover = UIViewContentModeScaleAspectFill,
   RCTResizeModeContain = UIViewContentModeScaleAspectFit,
   RCTResizeModeStretch = UIViewContentModeScaleToFill,
   RCTResizeModeCenter = UIViewContentModeCenter,
-#else // [TODO(macOS ISS#2323203)
-  RCTResizeModeCover = -2, // Not supported by NSImageView
-  RCTResizeModeContain = NSImageScaleProportionallyUpOrDown,
-  RCTResizeModeStretch = NSImageScaleAxesIndependently,
-  RCTResizeModeCenter = NSImageScaleNone, // assumes NSImageAlignmentCenter
-#endif // ]TODO(macOS ISS#2323203)
   RCTResizeModeRepeat = -1, // Use negative values to avoid conflicts with iOS enum values.
 };
 
