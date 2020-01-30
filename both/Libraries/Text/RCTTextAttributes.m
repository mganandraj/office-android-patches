diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTTextAttributes.m b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTTextAttributes.m
index 754b8a458..ceefb2e49 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTTextAttributes.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTTextAttributes.m
@@ -129,7 +129,7 @@ NSString *const RCTTextAttributesTagAttributeName = @"RCTTextAttributesTagAttrib
   }
 
   // Colors
-  RCTUIColor *effectiveForegroundColor = self.effectiveForegroundColor; // TODO(OSS Candidate ISS#2710739)
+  UIColor *effectiveForegroundColor = self.effectiveForegroundColor;
 
   if (_foregroundColor || !isnan(_opacity)) {
     attributes[NSForegroundColorAttributeName] = effectiveForegroundColor;
@@ -215,9 +215,9 @@ NSString *const RCTTextAttributesTagAttributeName = @"RCTTextAttributesTagAttrib
   }
 }
 
-- (RCTUIColor *)effectiveForegroundColor // TODO(OSS Candidate ISS#2710739)
+- (UIColor *)effectiveForegroundColor
 {
-  RCTUIColor *effectiveForegroundColor = _foregroundColor ?: [RCTUIColor blackColor]; // TODO(OSS Candidate ISS#2710739)
+  UIColor *effectiveForegroundColor = _foregroundColor ?: [UIColor blackColor];
 
   if (!isnan(_opacity)) {
     effectiveForegroundColor = [effectiveForegroundColor colorWithAlphaComponent:CGColorGetAlpha(effectiveForegroundColor.CGColor) * _opacity];
@@ -226,15 +226,15 @@ NSString *const RCTTextAttributesTagAttributeName = @"RCTTextAttributesTagAttrib
   return effectiveForegroundColor;
 }
 
-- (RCTUIColor *)effectiveBackgroundColor // TODO(OSS Candidate ISS#2710739)
+- (UIColor *)effectiveBackgroundColor
 {
-  RCTUIColor *effectiveBackgroundColor = _backgroundColor;// ?: [[UIColor whiteColor] colorWithAlphaComponent:0]; // TODO(OSS Candidate ISS#2710739)
+  UIColor *effectiveBackgroundColor = _backgroundColor;// ?: [[UIColor whiteColor] colorWithAlphaComponent:0];
 
   if (effectiveBackgroundColor && !isnan(_opacity)) {
     effectiveBackgroundColor = [effectiveBackgroundColor colorWithAlphaComponent:CGColorGetAlpha(effectiveBackgroundColor.CGColor) * _opacity];
   }
 
-  return effectiveBackgroundColor ?: [RCTUIColor clearColor]; // TODO(OSS Candidate ISS#2710739)
+  return effectiveBackgroundColor ?: [UIColor clearColor];
 }
 
 - (NSString *)applyTextAttributesToText:(NSString *)text
