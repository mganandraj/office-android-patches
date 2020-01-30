diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTFontTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTFontTests.m
index 394b3f91f..e45b48cc6 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTFontTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTFontTests.m
@@ -27,16 +27,11 @@
 
 - (void)testWeight
 {
-#if !TARGET_OS_OSX
-  // VSO#1878630: macOS: some RCTFontTests failing
-
-	// macOS: expected = .AppleSystemUIFontBold 14.00 pt., result = .AppleSystemUIFontEmphasized 14.00 pt.
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFont *result = [RCTConvert UIFont:@{@"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
-#endif
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
     UIFont *result = [RCTConvert UIFont:@{@"fontWeight": @"500"}];
@@ -86,8 +81,6 @@
 
 - (void)testStyle
 {
-#if !TARGET_OS_OSX
-	// macOS: expected = .SFNSText-Italic 14.00 pt., result = .AppleSystemUIFontItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -98,7 +91,6 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic"}];
     RCTAssertEqualFonts(expected, result);
   }
-#endif
   {
     UIFont *expected = [UIFont systemFontOfSize:14];
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"normal"}];
@@ -108,8 +100,6 @@
 
 - (void)testStyleAndWeight
 {
-#if !TARGET_OS_OSX
-	// macOS: expected = .SFNSText-LightItalic 14.00 pt., result = .AppleSystemUIFontUltraLightItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -120,7 +110,6 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic", @"fontWeight": @"100"}];
     RCTAssertEqualFonts(expected, result);
   }
-	// macOS: expected = .SFNSText-BoldItalic 14.00 pt., result = .AppleSystemUIFontEmphasizedItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -131,7 +120,6 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic", @"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
-#endif
 }
 
 - (void)testFamilyAndWeight
@@ -195,14 +183,11 @@
 
 - (void)testVariant
 {
-#if !TARGET_OS_OSX
-	// expected = .AppleSystemUIFont 14.00 pt., result = .SFNSText 14.00 pt.
   {
     UIFont *expected = [UIFont monospacedDigitSystemFontOfSize:14 weight:UIFontWeightRegular];
     UIFont *result = [RCTConvert UIFont:@{@"fontVariant": @[@"tabular-nums"]}];
     RCTAssertEqualFonts(expected, result);
   }
-	// expected = .AppleSystemUIFont 14.00 pt., result = .SFNSText 14.00 pt.
   {
     UIFont *monospaceFont = [UIFont monospacedDigitSystemFontOfSize:14 weight:UIFontWeightRegular];
     UIFontDescriptor *fontDescriptor = [monospaceFont.fontDescriptor fontDescriptorByAddingAttributes:@{
@@ -215,7 +200,6 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontVariant": @[@"tabular-nums", @"small-caps"]}];
     RCTAssertEqualFonts(expected, result);
   }
-#endif
 }
 
 - (void)testInvalidFont
@@ -225,14 +209,11 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontFamily": @"foobar"}];
     RCTAssertEqualFonts(expected, result);
   }
-#if !TARGET_OS_OSX
-  // expected = .AppleSystemUIFontBold 14.00 pt., result = .AppleSystemUIFontDemi 14.00 pt.
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFont *result = [RCTConvert UIFont:@{@"fontFamily": @"foobar", @"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
-#endif
 }
 
 @end
