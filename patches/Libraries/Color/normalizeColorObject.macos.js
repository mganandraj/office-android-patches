--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Color\\normalizeColorObject.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Color\\normalizeColorObject.macos.js"	2020-01-29 14:10:08.828881200 -0800
@@ -0,0 +1,39 @@
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
+  if ('semantic' in color) {
+    // a macos semantic color
+    return color;
+  } else if ('dynamic' in color && color.dynamic !== undefined) {
+    const normalizeColor = require('normalizeColor');
+
+    // a dynamic, appearance aware color
+    const dynamic = color.dynamic;
+    const dynamicColor: NativeOrDynamicColorType = {
+      dynamic: {
+        light: normalizeColor(dynamic.light),
+        dark: normalizeColor(dynamic.dark),
+      },
+    };
+    return dynamicColor;
+  }
+
+  return null;
+}
+
+module.exports = normalizeColorObject;
+// ]TODO(macOS ISS#2323203)
