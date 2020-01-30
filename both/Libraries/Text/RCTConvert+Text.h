diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTConvert+Text.h b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTConvert+Text.h
index 09c8b95ca..0a33ab38b 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTConvert+Text.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTConvert+Text.h
@@ -11,20 +11,6 @@
 
 NS_ASSUME_NONNULL_BEGIN
 
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-typedef enum UITextAutocorrectionType : NSInteger {
-    UITextAutocorrectionTypeDefault,
-    UITextAutocorrectionTypeNo,
-    UITextAutocorrectionTypeYes,
-} UITextAutocorrectionType;
-
-typedef enum UITextSpellCheckingType : NSInteger {
-    UITextSpellCheckingTypeDefault,
-    UITextSpellCheckingTypeNo,
-    UITextSpellCheckingTypeYes,
-} UITextSpellCheckingType;
-#endif // TODO(macOS ISS#2323203)]
-
 @interface RCTConvert (Text)
 
 + (UITextAutocorrectionType)UITextAutocorrectionType:(nullable id)json;
