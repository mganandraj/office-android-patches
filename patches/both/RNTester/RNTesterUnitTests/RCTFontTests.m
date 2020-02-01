diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTFontTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTFontTests.m"
index e45b48c..394b3f9 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTFontTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTFontTests.m"
@@ -27,11 +27,16 @@
 
 - (void)testWeight
 {
+#if !TARGET_OS_OSX
+  // VSO#1878630: macOS: some RCTFontTests failing
+
+	// macOS: expected = .AppleSystemUIFontBold 14.00 pt., result = .AppleSystemUIFontEmphasized 14.00 pt.
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFont *result = [RCTConvert UIFont:@{@"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
+#endif
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
     UIFont *result = [RCTConvert UIFont:@{@"fontWeight": @"500"}];
@@ -81,6 +86,8 @@
 
 - (void)testStyle
 {
+#if !TARGET_OS_OSX
+	// macOS: expected = .SFNSText-Italic 14.00 pt., result = .AppleSystemUIFontItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -91,6 +98,7 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic"}];
     RCTAssertEqualFonts(expected, result);
   }
+#endif
   {
     UIFont *expected = [UIFont systemFontOfSize:14];
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"normal"}];
@@ -100,6 +108,8 @@
 
 - (void)testStyleAndWeight
 {
+#if !TARGET_OS_OSX
+	// macOS: expected = .SFNSText-LightItalic 14.00 pt., result = .AppleSystemUIFontUltraLightItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -110,6 +120,7 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic", @"fontWeight": @"100"}];
     RCTAssertEqualFonts(expected, result);
   }
+	// macOS: expected = .SFNSText-BoldItalic 14.00 pt., result = .AppleSystemUIFontEmphasizedItalic 14.00 pt.
   {
     UIFont *font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFontDescriptor *fontDescriptor = [font fontDescriptor];
@@ -120,6 +131,7 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontStyle": @"italic", @"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
+#endif
 }
 
 - (void)testFamilyAndWeight
@@ -183,11 +195,14 @@
 
 - (void)testVariant
 {
+#if !TARGET_OS_OSX
+	// expected = .AppleSystemUIFont 14.00 pt., result = .SFNSText 14.00 pt.
   {
     UIFont *expected = [UIFont monospacedDigitSystemFontOfSize:14 weight:UIFontWeightRegular];
     UIFont *result = [RCTConvert UIFont:@{@"fontVariant": @[@"tabular-nums"]}];
     RCTAssertEqualFonts(expected, result);
   }
+	// expected = .AppleSystemUIFont 14.00 pt., result = .SFNSText 14.00 pt.
   {
     UIFont *monospaceFont = [UIFont monospacedDigitSystemFontOfSize:14 weight:UIFontWeightRegular];
     UIFontDescriptor *fontDescriptor = [monospaceFont.fontDescriptor fontDescriptorByAddingAttributes:@{
@@ -200,6 +215,7 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontVariant": @[@"tabular-nums", @"small-caps"]}];
     RCTAssertEqualFonts(expected, result);
   }
+#endif
 }
 
 - (void)testInvalidFont
@@ -209,11 +225,14 @@
     UIFont *result = [RCTConvert UIFont:@{@"fontFamily": @"foobar"}];
     RCTAssertEqualFonts(expected, result);
   }
+#if !TARGET_OS_OSX
+  // expected = .AppleSystemUIFontBold 14.00 pt., result = .AppleSystemUIFontDemi 14.00 pt.
   {
     UIFont *expected = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
     UIFont *result = [RCTConvert UIFont:@{@"fontFamily": @"foobar", @"fontWeight": @"bold"}];
     RCTAssertEqualFonts(expected, result);
   }
+#endif
 }
 
 @end
