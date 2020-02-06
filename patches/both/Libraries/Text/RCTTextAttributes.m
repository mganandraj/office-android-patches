--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RCTTextAttributes.m"	2020-01-30 13:55:47.987608800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RCTTextAttributes.m"	2020-01-29 14:10:08.990882500 -0800
@@ -129,7 +129,7 @@
   }
 
   // Colors
-  UIColor *effectiveForegroundColor = self.effectiveForegroundColor;
+  RCTUIColor *effectiveForegroundColor = self.effectiveForegroundColor; // TODO(OSS Candidate ISS#2710739)
 
   if (_foregroundColor || !isnan(_opacity)) {
     attributes[NSForegroundColorAttributeName] = effectiveForegroundColor;
@@ -215,9 +215,9 @@
   }
 }
 
-- (UIColor *)effectiveForegroundColor
+- (RCTUIColor *)effectiveForegroundColor // TODO(OSS Candidate ISS#2710739)
 {
-  UIColor *effectiveForegroundColor = _foregroundColor ?: [UIColor blackColor];
+  RCTUIColor *effectiveForegroundColor = _foregroundColor ?: [RCTUIColor blackColor]; // TODO(OSS Candidate ISS#2710739)
 
   if (!isnan(_opacity)) {
     effectiveForegroundColor = [effectiveForegroundColor colorWithAlphaComponent:CGColorGetAlpha(effectiveForegroundColor.CGColor) * _opacity];
@@ -226,15 +226,15 @@
   return effectiveForegroundColor;
 }
 
-- (UIColor *)effectiveBackgroundColor
+- (RCTUIColor *)effectiveBackgroundColor // TODO(OSS Candidate ISS#2710739)
 {
-  UIColor *effectiveBackgroundColor = _backgroundColor;// ?: [[UIColor whiteColor] colorWithAlphaComponent:0];
+  RCTUIColor *effectiveBackgroundColor = _backgroundColor;// ?: [[UIColor whiteColor] colorWithAlphaComponent:0]; // TODO(OSS Candidate ISS#2710739)
 
   if (effectiveBackgroundColor && !isnan(_opacity)) {
     effectiveBackgroundColor = [effectiveBackgroundColor colorWithAlphaComponent:CGColorGetAlpha(effectiveBackgroundColor.CGColor) * _opacity];
   }
 
-  return effectiveBackgroundColor ?: [UIColor clearColor];
+  return effectiveBackgroundColor ?: [RCTUIColor clearColor]; // TODO(OSS Candidate ISS#2710739)
 }
 
 - (NSString *)applyTextAttributesToText:(NSString *)text
