--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DatePickerAndroid\\DatePickerAndroid.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DatePickerAndroid\\DatePickerAndroid.macos.js"	2020-01-29 14:10:08.836881800 -0800
@@ -0,0 +1,32 @@
+/**
+ * Copyright (c) 2015-present, Facebook, Inc.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow
+ */
+
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+import type {Options, DatePickerOpenAction} from './DatePickerAndroidTypes';
+
+class DatePickerAndroid {
+  static async open(options: ?Options): Promise<DatePickerOpenAction> {
+    throw new Error('DatePickerAndroid is not supported on this platform.');
+  }
+
+  /**
+   * A date has been selected.
+   */
+  static +dateSetAction: 'dateSetAction' = 'dateSetAction';
+  /**
+   * The dialog has been dismissed.
+   */
+  static +dismissedAction: 'dismissedAction' = 'dismissedAction';
+}
+
+module.exports = DatePickerAndroid;
