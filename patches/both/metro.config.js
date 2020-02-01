diff --git "a/E:\\github\\fb-react-native-forpatch-base\\metro.config.js" "b/E:\\github\\ms-react-native-forpatch\\metro.config.js"
index 92b626c..4950b56 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\metro.config.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\metro.config.js"
@@ -8,16 +8,58 @@
  * @format
  */
 'use strict';
-
+const path = require('path');
 const getPolyfills = require('./rn-get-polyfills');
 
+const fs = require('fs');
 /**
  * This cli config is needed for development purposes, e.g. for running
  * integration tests during local development or on CI services.
  */
-module.exports = {
-  extraNodeModules: {
-    'react-native': __dirname,
-  },
-  getPolyfills,
-};
+
+// In sdx repo we need to use metro-resources to handle all the rush symlinking
+if (
+  fs.existsSync(path.resolve(__dirname, '../../scripts/metro-resources.js'))
+) {
+  const sdxHelpers = require('../../scripts/metro-resources');
+
+  module.exports = sdxHelpers.createConfig({
+    extraNodeModules: {
+      'react-native': __dirname,
+    },
+    roots: [path.resolve(__dirname)],
+    projectRoot: path.resolve(__dirname, '../../'),
+
+    serializer: {
+      getModulesRunBeforeMainModule: () => [
+        require.resolve('./Libraries/Core/InitializeCore'),
+      ],
+      getPolyfills,
+    },
+    resolver: {
+      hasteImplModulePath: require.resolve('./jest/hasteImpl'),
+    },
+    transformer: {
+      assetRegistryPath: require.resolve('./Libraries/Image/AssetRegistry'),
+    },
+  });
+} else {
+  module.exports = {
+    extraNodeModules: {
+      'react-native': __dirname,
+    },
+    serializer: {
+      getModulesRunBeforeMainModule: () => [
+        require.resolve('./Libraries/Core/InitializeCore'),
+      ],
+      getPolyfills,
+    },
+    resolver: {
+      hasteImplModulePath: require.resolve('./jest/hasteImpl'),
+      platforms: ['ios', 'macos', 'android'],
+    },
+    transformer: {
+      assetRegistryPath: require.resolve('./Libraries/Image/AssetRegistry'),
+    },
+  };
+}
