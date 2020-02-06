--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RCTConvert+Text.h"	2020-01-30 13:55:47.985611500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RCTConvert+Text.h"	2020-01-29 14:10:08.989883300 -0800
@@ -11,6 +11,20 @@
 
 NS_ASSUME_NONNULL_BEGIN
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+typedef enum UITextAutocorrectionType : NSInteger {
+    UITextAutocorrectionTypeDefault,
+    UITextAutocorrectionTypeNo,
+    UITextAutocorrectionTypeYes,
+} UITextAutocorrectionType;
+
+typedef enum UITextSpellCheckingType : NSInteger {
+    UITextSpellCheckingTypeDefault,
+    UITextSpellCheckingTypeNo,
+    UITextSpellCheckingTypeYes,
+} UITextSpellCheckingType;
+#endif // TODO(macOS ISS#2323203)]
+
 @interface RCTConvert (Text)
 
 + (UITextAutocorrectionType)UITextAutocorrectionType:(nullable id)json;
