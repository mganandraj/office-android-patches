--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Color\\normalizeColorObject.android.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Color\\normalizeColorObject.android.js"	2020-01-29 14:10:08.828881200 -0800
@@ -0,0 +1,22 @@
+/**
+ * Copyright (c) Facebook, Inc. and its affiliates.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow
+ */
+// [TODO(macOS ISS#2323203)
+'use strict';
+
+import type {NativeOrDynamicColorType} from 'NativeOrDynamicColorType';
+
+function normalizeColorObject(
+  color: NativeOrDynamicColorType,
+): ?(number | NativeOrDynamicColorType) {
+  return null;
+}
+
+module.exports = normalizeColorObject;
+// ]TODO(macOS ISS#2323203)
