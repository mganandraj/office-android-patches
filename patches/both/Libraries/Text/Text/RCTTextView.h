diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextView.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextView.h"
index a082013..7edc12f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextView.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextView.h"
@@ -7,17 +7,17 @@
 
 #import <React/RCTComponent.h>
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 NS_ASSUME_NONNULL_BEGIN
 
-@interface RCTTextView : UIView
+@interface RCTTextView : RCTUIView // TODO(macOS ISS#3536887)
 
 @property (nonatomic, assign) BOOL selectable;
 
 - (void)setTextStorage:(NSTextStorage *)textStorage
           contentFrame:(CGRect)contentFrame
-       descendantViews:(NSArray<UIView *> *)descendantViews;
+       descendantViews:(NSArray<RCTUIView *> *)descendantViews; // TODO(macOS ISS#3536887)
 
 @end
 
