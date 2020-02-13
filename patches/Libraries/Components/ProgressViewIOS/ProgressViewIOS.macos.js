--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ProgressViewIOS\\ProgressViewIOS.macos.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ProgressViewIOS\\ProgressViewIOS.macos.js"	2020-01-29 14:10:08.853885300 -0800
@@ -0,0 +1,92 @@
+/**
+ * Copyright (c) 2015-present, Facebook, Inc.
+ *
+ * This source code is licensed under the MIT license found in the
+ * LICENSE file in the root directory of this source tree.
+ *
+ * @format
+ * @flow
+ */
+
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+var React = require('React');
+var StyleSheet = require('StyleSheet');
+
+var requireNativeComponent = require('requireNativeComponent');
+
+import type {NativeComponent} from 'ReactNative';
+import type {ImageSource} from 'ImageSource';
+import type {ColorValue} from 'StyleSheetTypes';
+import type {ViewProps} from 'ViewPropTypes';
+
+type Props = $ReadOnly<{|
+  ...ViewProps,
+
+  /**
+   * The progress bar style.
+   */
+  progressViewStyle?: ?('default' | 'bar'),
+
+  /**
+   * The progress value (between 0 and 1).
+   */
+  progress?: ?number,
+
+  /**
+   * The tint color of the progress bar itself.
+   */
+  progressTintColor?: ?ColorValue,
+
+  /**
+   * The tint color of the progress bar track.
+   */
+  trackTintColor?: ?ColorValue,
+
+  /**
+   * A stretchable image to display as the progress bar.
+   */
+  progressImage?: ?ImageSource,
+
+  /**
+   * A stretchable image to display behind the progress bar.
+   */
+  trackImage?: ?ImageSource,
+|}>;
+
+type NativeProgressViewIOS = Class<NativeComponent<Props>>;
+
+const RCTProgressView = ((requireNativeComponent(
+  'RCTProgressView',
+): any): NativeProgressViewIOS);
+
+/**
+ * Use `ProgressViewIOS` to render a UIProgressView on iOS.
+ */
+const ProgressViewIOS = (
+  props: Props,
+  forwardedRef?: ?React.Ref<typeof RCTProgressView>,
+) => (
+  <RCTProgressView
+    {...props}
+    style={[styles.progressView, props.style]}
+    ref={forwardedRef}
+  />
+);
+
+const styles = StyleSheet.create({
+  progressView: {
+    height: 2,
+  },
+});
+
+// $FlowFixMe - TODO T29156721 `React.forwardRef` is not defined in Flow, yet.
+const ProgressViewIOSWithRef = React.forwardRef(ProgressViewIOS);
+
+/* $FlowFixMe(>=0.89.0 site=react_native_ios_fb) This comment suppresses an
+ * error found when Flow v0.89 was deployed. To see the error, delete this
+ * comment and run Flow. */
+// $FlowFixMe
+module.exports = (ProgressViewIOSWithRef: NativeProgressViewIOS);
