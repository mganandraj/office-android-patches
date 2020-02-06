--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\Platform.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\Platform.macos.js"	2020-01-29 14:10:09.010917900 -0800
@@ -0,0 +1,42 @@
+/**
+ * Copyright (c) Facebook, Inc. and its affiliates.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow
+ */
+
+// TODO(macOS ISS#2323203) Copied from Platform.ios.js
+
+'use strict';
+
+const NativeModules = require('../BatchedBridge/NativeModules');
+
+export type PlatformSelectSpec<D, I> = {
+  default?: D,
+  macos?: I,
+};
+
+const Platform = {
+  OS: 'macos',
+  get Version() {
+    const constants = NativeModules.PlatformConstants;
+    return constants && constants.osVersion;
+  },
+  get isTesting(): boolean {
+    if (__DEV__) {
+      const constants = NativeModules.PlatformConstants;
+      return constants && constants.isTesting;
+    }
+    return false;
+  },
+  get isTV() {
+    return false;
+  },
+  select: <D, I>(spec: PlatformSelectSpec<D, I>): D | I =>
+    'macos' in spec ? spec.macos : spec.default,
+};
+
+module.exports = Platform;
