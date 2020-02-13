--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTNetworking.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTNetworking.js"	2020-01-29 14:10:08.947913700 -0800
@@ -0,0 +1,66 @@
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
+// TODO(macOS ISS#2323203) TODO(windows ISS): this file is RCTNetworking.ios.js in facebook's repo.  Renamed to RCTNetworking.js since it is shared here between ios, macos, and windows.
+
+'use strict';
+
+const NativeEventEmitter = require('../EventEmitter/NativeEventEmitter');
+const RCTNetworkingNative = require('../BatchedBridge/NativeModules')
+  .Networking;
+const convertRequestBody = require('./convertRequestBody');
+
+import type {RequestBody} from './convertRequestBody';
+
+import type {NativeResponseType} from './XMLHttpRequest';
+
+class RCTNetworking extends NativeEventEmitter {
+  constructor() {
+    super(RCTNetworkingNative);
+  }
+
+  sendRequest(
+    method: string,
+    trackingName: string,
+    url: string,
+    headers: Object,
+    data: RequestBody,
+    responseType: NativeResponseType,
+    incrementalUpdates: boolean,
+    timeout: number,
+    callback: (requestId: number) => any,
+    withCredentials: boolean,
+  ) {
+    const body = convertRequestBody(data);
+    RCTNetworkingNative.sendRequest(
+      {
+        method,
+        url,
+        data: {...body, trackingName},
+        headers,
+        responseType,
+        incrementalUpdates,
+        timeout,
+        withCredentials,
+      },
+      callback,
+    );
+  }
+
+  abortRequest(requestId: number) {
+    RCTNetworkingNative.abortRequest(requestId);
+  }
+
+  clearCookies(callback: (result: boolean) => any) {
+    RCTNetworkingNative.clearCookies(callback);
+  }
+}
+
+module.exports = new RCTNetworking();
