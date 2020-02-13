--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Color\\NativeOrDynamicColorType.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Color\\NativeOrDynamicColorType.js"	2020-01-29 14:10:08.827881400 -0800
@@ -0,0 +1,19 @@
+/**
+ * Copyright (c) Facebook, Inc. and its affiliates.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow strict
+ */
+
+'use strict';
+
+export type NativeOrDynamicColorType = {
+  semantic?: string,
+  dynamic?: {
+    light: ?(string | number | NativeOrDynamicColorType),
+    dark: ?(string | number | NativeOrDynamicColorType),
+  },
+};
