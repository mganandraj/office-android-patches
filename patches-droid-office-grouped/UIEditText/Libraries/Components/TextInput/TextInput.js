--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\TextInput\\TextInput.js"	2020-01-30 13:55:47.877607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\TextInput\\TextInput.js"	2020-01-29 14:10:08.867882300 -0800
@@ -41,7 +41,10 @@
 
 if (Platform.OS === 'android') {
   AndroidTextInput = requireNativeComponent('AndroidTextInput');
-} else if (Platform.OS === 'ios') {
+} else if (
+  Platform.OS === 'ios' ||
+  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+) {
   RCTMultilineTextInputView = requireNativeComponent(
     'RCTMultilineTextInputView',
   );
@@ -124,12 +127,24 @@
 >;
 
 const DataDetectorTypes = [
+  // iOS+macOS
   'phoneNumber',
   'link',
   'address',
   'calendarEvent',
+  // iOS-only
   'none',
   'all',
+  // macOS-only // [TODO(macOS ISS#2323203)
+  'ortography',
+  'spelling',
+  'grammar',
+  'quote',
+  'dash',
+  'replacement',
+  'correction',
+  'regularExpression',
+  'transitInformation', // ]TODO(macOS ISS#2323203)
 ];
 
 type DataDetectorTypesType =
@@ -798,6 +813,7 @@
      * multiline fields. Note that for multiline fields, setting `blurOnSubmit`
      * to `true` means that pressing return will blur the field and trigger the
      * `onSubmitEditing` event instead of inserting a newline into the field.
+     * Ignored on Android, if Hardware Keyboard is connected. // TODO(android ISS)
      */
     blurOnSubmit: PropTypes.bool,
     /**
@@ -861,14 +877,34 @@
      *
      * Possible values for `dataDetectorTypes` are:
      *
+     * *iOS + macOS*
+     *
      * - `'phoneNumber'`
      * - `'link'`
      * - `'address'`
      * - `'calendarEvent'`
+     *
+     * *iOS Only*
+     *
+     * The following values work on iOS only:
+     *
      * - `'none'`
      * - `'all'`
      *
-     * @platform ios
+     * *macOS Only*
+     *
+     * The following values work on macOS only:
+     *
+     * - `'ortography'`
+     * - `'spelling'`
+     * - `'grammar'`
+     * - `'quote'`
+     * - `'dash'`
+     * - `'replacement'`
+     * - `'correction'`
+     * - `'regularExpression'`
+     * - `'transitInformation'`
+     *
      */
     dataDetectorTypes: PropTypes.oneOfType([
       PropTypes.oneOf(DataDetectorTypes),
@@ -949,6 +985,14 @@
     );
   },
 
+  /**
+   * Returns the native `TextView` node.
+   */
+  getTextViewHandle: function(): any {
+    // [TODO(OSS Candidate ISS#2710739)
+    return ReactNative.findNodeHandle(this._inputRef);
+  }, // ]TODO(OSS Candidate ISS#2710739)
+
   _inputRef: (undefined: any),
   _focusSubscription: (undefined: ?Function),
   _lastNativeText: (undefined: ?string),
@@ -991,7 +1035,8 @@
 
   render: function() {
     let textInput;
-    if (Platform.OS === 'ios') {
+    if (Platform.OS === 'ios' || Platform.OS === 'macos') {
+      // TODO(macOS ISS#2323203)
       textInput = UIManager.getViewManagerConfig('RCTVirtualText')
         ? this._renderIOS()
         : this._renderIOSLegacy();
@@ -1101,6 +1146,7 @@
         rejectResponderTermination={true}
         accessible={props.accessible}
         accessibilityLabel={props.accessibilityLabel}
+        accessibilityHint={props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole={props.accessibilityRole}
         accessibilityStates={props.accessibilityStates}
         nativeID={this.props.nativeID}
@@ -1210,6 +1256,7 @@
         onPress={this._onPress}
         accessible={this.props.accessible}
         accessibilityLabel={this.props.accessibilityLabel}
+        accessibilityHint={this.props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole={this.props.accessibilityRole}
         accessibilityStates={this.props.accessibilityStates}
         nativeID={this.props.nativeID}
@@ -1220,6 +1267,15 @@
   },
 
   _onFocus: function(event: FocusEvent) {
+    // [TODO(android ISS)
+    // Set the focused TextInput field info in TextInputState.
+    // Delaying this to onFocus native event ensures that -
+    // 1. The state is updated only after the native code completes setting focus on the view
+    // 2. In case the focus is moving from one TextInput(A) to another TextInput(B), the state of
+    //    A needs to be updated (blurred) before info about B is updated in TestInputState.
+    TextInputState.setFocusedTextInput(
+      ReactNative.findNodeHandle(this._inputRef),
+    ); // ]TODO(android ISS)
     if (this.props.onFocus) {
       this.props.onFocus(event);
     }
@@ -1315,7 +1371,17 @@
   _onBlur: function(event: BlurEvent) {
     // This is a hack to fix https://fburl.com/toehyir8
     // @todo(rsnara) Figure out why this is necessary.
-    this.blur();
+    // this.blur();
+    // [TODO(android ISS) removed: this.blur();
+    // Set the focused TextInput field info in TextInputState.
+    // Delaying this to onBlur native event ensures that -
+    // 1. The state is updated only after the native code completes clearing focus on the view
+    // 2. In case the focus is moving from one TextInput(A) to another TextInput(B), the state of
+    //    A needs to be updated (blurred) before info about B is updated in TestInputState.
+    TextInputState.clearFocusedTextInput(
+      ReactNative.findNodeHandle(this._inputRef),
+    ); // ]TODO(android ISS)
+
     if (this.props.onBlur) {
       this.props.onBlur(event);
     }
