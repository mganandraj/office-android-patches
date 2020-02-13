--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DatePickerMacOS\\DatePickerMacOS.android.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DatePickerMacOS\\DatePickerMacOS.android.js"	2020-01-29 14:10:08.837884800 -0800
@@ -0,0 +1,44 @@
+/**
+ * Copyright (c) 2015-present, Facebook, Inc.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ */
+
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+var React = require('React');
+var StyleSheet = require('StyleSheet');
+var Text = require('Text');
+var View = require('View');
+
+class DummyDatePickerMacOS extends React.Component {
+  render() {
+    return (
+      <View style={[styles.dummyDatePickerMacOS, this.props.style]}>
+        <Text style={styles.datePickerText}>DatePickerMacOS is not supported on this platform!</Text>
+      </View>
+    );
+  }
+}
+
+var styles = StyleSheet.create({
+  dummyDatePickerMacOS: {
+    height: 100,
+    width: 300,
+    backgroundColor: '#ffbcbc',
+    borderWidth: 1,
+    borderColor: 'red',
+    alignItems: 'center',
+    justifyContent: 'center',
+    margin: 10,
+  },
+  datePickerText: {
+    color: '#333333',
+    margin: 20,
+  },
+});
+
+module.exports = DummyDatePickerMacOS;
