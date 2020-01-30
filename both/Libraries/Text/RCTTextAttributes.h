diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTTextAttributes.h b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTTextAttributes.h
index 2c7d24ffa..d48b10b13 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/RCTTextAttributes.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/RCTTextAttributes.h
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTTextDecorationLineType.h>
 
@@ -24,8 +24,8 @@ extern NSString *const RCTTextAttributesTagAttributeName;
 @interface RCTTextAttributes : NSObject <NSCopying>
 
 // Color
-@property (nonatomic, strong, nullable) RCTUIColor *foregroundColor; // TODO(OSS Candidate ISS#2710739)
-@property (nonatomic, strong, nullable) RCTUIColor *backgroundColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, strong, nullable) UIColor *foregroundColor;
+@property (nonatomic, strong, nullable) UIColor *backgroundColor;
 @property (nonatomic, assign) CGFloat opacity;
 // Font
 @property (nonatomic, copy, nullable) NSString *fontFamily;
@@ -42,13 +42,13 @@ extern NSString *const RCTTextAttributesTagAttributeName;
 @property (nonatomic, assign) NSTextAlignment alignment;
 @property (nonatomic, assign) NSWritingDirection baseWritingDirection;
 // Decoration
-@property (nonatomic, strong, nullable) RCTUIColor *textDecorationColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, strong, nullable) UIColor *textDecorationColor;
 @property (nonatomic, assign) NSUnderlineStyle textDecorationStyle;
 @property (nonatomic, assign) RCTTextDecorationLineType textDecorationLine;
 // Shadow
 @property (nonatomic, assign) CGSize textShadowOffset;
 @property (nonatomic, assign) CGFloat textShadowRadius;
-@property (nonatomic, strong, nullable) RCTUIColor *textShadowColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, strong, nullable) UIColor *textShadowColor;
 // Special
 @property (nonatomic, assign) BOOL isHighlighted;
 @property (nonatomic, strong, nullable) NSNumber *tag;
@@ -84,8 +84,8 @@ extern NSString *const RCTTextAttributesTagAttributeName;
 /**
  * Foreground and background colors with opacity and right defaults.
  */
-- (RCTUIColor *)effectiveForegroundColor; // TODO(OSS Candidate ISS#2710739)
-- (RCTUIColor *)effectiveBackgroundColor; // TODO(OSS Candidate ISS#2710739)
+- (UIColor *)effectiveForegroundColor;
+- (UIColor *)effectiveBackgroundColor;
 
 /**
  * Text transformed per 'none', 'uppercase', 'lowercase', 'capitalize'
