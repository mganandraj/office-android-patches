--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\StatusBar\\StatusBarIOS.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\StatusBar\\StatusBarIOS.macos.js"	2020-01-29 14:10:08.865882000 -0800
@@ -0,0 +1,23 @@
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
+const NativeEventEmitter = require('../../EventEmitter/NativeEventEmitter');
+const {StatusBarManager} = require('../../BatchedBridge/NativeModules');
+
+/**
+ * Use `StatusBar` for mutating the status bar.
+ */
+class StatusBarIOS extends NativeEventEmitter {}
+
+module.exports = new StatusBarIOS(StatusBarManager);
