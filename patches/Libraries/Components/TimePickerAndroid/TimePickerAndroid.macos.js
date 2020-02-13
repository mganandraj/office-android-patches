--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\TimePickerAndroid\\TimePickerAndroid.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\TimePickerAndroid\\TimePickerAndroid.macos.js"	2020-01-29 14:10:08.870885000 -0800
@@ -0,0 +1,28 @@
+/**
+ * Copyright (c) Facebook, Inc. and its affiliates.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow strict-local
+ */
+
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+import type {
+  TimePickerOptions,
+  TimePickerResult,
+} from './TimePickerAndroidTypes';
+
+const TimePickerAndroid = {
+  async open(options: TimePickerOptions): Promise<TimePickerResult> {
+    return Promise.reject({
+      message: 'TimePickerAndroid is not supported on this platform.',
+    });
+  },
+};
+
+module.exports = TimePickerAndroid;
