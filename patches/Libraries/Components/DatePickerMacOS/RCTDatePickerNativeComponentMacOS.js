--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DatePickerMacOS\\RCTDatePickerNativeComponentMacOS.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DatePickerMacOS\\RCTDatePickerNativeComponentMacOS.js"	2020-01-29 14:10:08.838883900 -0800
@@ -0,0 +1,41 @@
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
+// TODO(macOS ISS#2323203)
+
+'use strict';
+
+const requireNativeComponent = require('../../ReactNative/requireNativeComponent');
+
+import type {SyntheticEvent} from '../../Types/CoreEventTypes';
+import type {ViewProps} from '../View/ViewPropTypes';
+import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+
+type Event = SyntheticEvent<
+  $ReadOnly<{|
+    timestamp: number,
+  |}>,
+>;
+
+type NativeProps = $ReadOnly<{|
+  ...ViewProps,
+  date?: ?number,
+  maximumDate?: ?number,
+  minimumDate?: ?number,
+  mode?: ?('single' | 'range'),
+  onDateChange?: ?(event: Event) => void,
+  pickerStyle?: ?['textfield-stepper', 'clock-calendar', 'textfield'],
+  timeZoneOffsetInMinutes?: ?number,
+|}>;
+type RCTDatePickerNativeType = Class<NativeComponent<NativeProps>>;
+
+module.exports = ((requireNativeComponent(
+  'RCTDatePicker',
+): any): RCTDatePickerNativeType);
