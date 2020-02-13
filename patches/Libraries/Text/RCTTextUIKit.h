--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RCTTextUIKit.h"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RCTTextUIKit.h"	2020-01-29 14:10:08.991885400 -0800
@@ -0,0 +1,48 @@
+/**
+ * Copyright (c) 2015-present, Facebook, Inc.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ */
+
+#include <TargetConditionals.h>
+#if !TARGET_OS_OSX
+#import <UIKit/UIKit.h>
+
+UIKIT_STATIC_INLINE BOOL RCTTextSelectionEqual(UITextRange *range1, UITextRange *range2)
+{
+  return [range1 isEqual:range2];
+}
+
+#else
+#import <AppKit/AppKit.h>
+
+NS_INLINE BOOL RCTTextSelectionEqual(NSRange range1, NSRange range2)
+{
+  return NSEqualRanges(range1, range2);
+}
+
+//
+// semantically equivalent constants
+//
+
+// UITextView.h/NSTextView.h
+#define UITextViewTextDidChangeNotification   NSTextDidChangeNotification
+#define UITextFieldTextDidChangeNotification  NSControlTextDidChangeNotification
+
+//
+// functionally equivalent types
+//
+
+// These types have the same purpose but may differ semantically. Use with care!
+
+// UITextField
+
+#define UITextField NSTextField
+#define UITextFieldDelegate NSTextFieldDelegate
+
+// UITextView
+#define UITextView NSTextView
+#define UITextViewDelegate NSTextViewDelegate
+
+#endif
