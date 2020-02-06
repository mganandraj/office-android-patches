--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\shims\\ReactFeatureFlags.js"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\shims\\ReactFeatureFlags.js"	2020-01-29 14:10:08.974884500 -0800
@@ -0,0 +1,18 @@
+/**
+ * Copyright (c) 2013-present, Facebook, Inc.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @providesModule ReactFeatureFlags
+ */
+
+'use strict';
+
+const ReactFeatureFlags = {
+  debugRenderPhaseSideEffects: false,
+  debugRenderPhaseSideEffectsForStrictMode: false,
+  warnAboutDeprecatedLifecycles: false,
+};
+
+module.exports = ReactFeatureFlags;
