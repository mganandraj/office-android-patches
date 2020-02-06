--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RCTTextAttributes.h"	2020-01-30 13:55:47.986615000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RCTTextAttributes.h"	2020-01-29 14:10:08.990882500 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTTextDecorationLineType.h>
 
@@ -24,8 +24,8 @@
 @interface RCTTextAttributes : NSObject <NSCopying>
 
 // Color
-@property (nonatomic, strong, nullable) UIColor *foregroundColor;
-@property (nonatomic, strong, nullable) UIColor *backgroundColor;
+@property (nonatomic, strong, nullable) RCTUIColor *foregroundColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, strong, nullable) RCTUIColor *backgroundColor; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, assign) CGFloat opacity;
 // Font
 @property (nonatomic, copy, nullable) NSString *fontFamily;
@@ -42,13 +42,13 @@
 @property (nonatomic, assign) NSTextAlignment alignment;
 @property (nonatomic, assign) NSWritingDirection baseWritingDirection;
 // Decoration
-@property (nonatomic, strong, nullable) UIColor *textDecorationColor;
+@property (nonatomic, strong, nullable) RCTUIColor *textDecorationColor; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, assign) NSUnderlineStyle textDecorationStyle;
 @property (nonatomic, assign) RCTTextDecorationLineType textDecorationLine;
 // Shadow
 @property (nonatomic, assign) CGSize textShadowOffset;
 @property (nonatomic, assign) CGFloat textShadowRadius;
-@property (nonatomic, strong, nullable) UIColor *textShadowColor;
+@property (nonatomic, strong, nullable) RCTUIColor *textShadowColor; // TODO(OSS Candidate ISS#2710739)
 // Special
 @property (nonatomic, assign) BOOL isHighlighted;
 @property (nonatomic, strong, nullable) NSNumber *tag;
@@ -84,8 +84,8 @@
 /**
  * Foreground and background colors with opacity and right defaults.
  */
-- (UIColor *)effectiveForegroundColor;
-- (UIColor *)effectiveBackgroundColor;
+- (RCTUIColor *)effectiveForegroundColor; // TODO(OSS Candidate ISS#2710739)
+- (RCTUIColor *)effectiveBackgroundColor; // TODO(OSS Candidate ISS#2710739)
 
 /**
  * Text transformed per 'none', 'uppercase', 'lowercase', 'capitalize'
