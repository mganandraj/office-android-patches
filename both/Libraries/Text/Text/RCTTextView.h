diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/RCTTextView.h b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/RCTTextView.h
index 7edc12ffe..a082013cb 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/RCTTextView.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/RCTTextView.h
@@ -7,17 +7,17 @@
 
 #import <React/RCTComponent.h>
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 NS_ASSUME_NONNULL_BEGIN
 
-@interface RCTTextView : RCTUIView // TODO(macOS ISS#3536887)
+@interface RCTTextView : UIView
 
 @property (nonatomic, assign) BOOL selectable;
 
 - (void)setTextStorage:(NSTextStorage *)textStorage
           contentFrame:(CGRect)contentFrame
-       descendantViews:(NSArray<RCTUIView *> *)descendantViews; // TODO(macOS ISS#3536887)
+       descendantViews:(NSArray<UIView *> *)descendantViews;
 
 @end
 
