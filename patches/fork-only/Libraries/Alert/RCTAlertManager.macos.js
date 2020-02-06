--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Alert\\RCTAlertManager.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Alert\\RCTAlertManager.macos.js"	2020-01-29 14:10:08.803916400 -0800
@@ -0,0 +1,17 @@
+/**
+ * Copyright (c) 2015-present, Facebook, Inc.
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
+var RCTAlertManager = require('NativeModules').AlertManager;
+
+module.exports = RCTAlertManager;
