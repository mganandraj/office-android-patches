--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ToastAndroid\\ToastAndroid.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ToastAndroid\\ToastAndroid.macos.js"	2020-01-29 14:10:08.871884400 -0800
@@ -0,0 +1,23 @@
+/**
+ * Copyright (c) Facebook, Inc. and its affiliates.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @noflow
+ */
+
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+const warning = require('fbjs/lib/warning');
+
+const ToastAndroid = {
+  show: function(message: string, duration: number): void {
+    warning(false, 'ToastAndroid is not supported on this platform.');
+  },
+};
+
+module.exports = ToastAndroid;
