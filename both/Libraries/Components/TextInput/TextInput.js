diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/TextInput/TextInput.js b/E:/github/fb-react-native-forpatch/Libraries/Components/TextInput/TextInput.js
index 09d52b835..44999222b 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/TextInput/TextInput.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/TextInput/TextInput.js
@@ -41,10 +41,7 @@ let RCTSinglelineTextInputView;
 
 if (Platform.OS === 'android') {
   AndroidTextInput = requireNativeComponent('AndroidTextInput');
-} else if (
-  Platform.OS === 'ios' ||
-  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-) {
+} else if (Platform.OS === 'ios') {
   RCTMultilineTextInputView = requireNativeComponent(
     'RCTMultilineTextInputView',
   );
@@ -127,24 +124,12 @@ export type EditingEvent = SyntheticEvent<
 >;
 
 const DataDetectorTypes = [
-  // iOS+macOS
   'phoneNumber',
   'link',
   'address',
   'calendarEvent',
-  // iOS-only
   'none',
   'all',
-  // macOS-only // [TODO(macOS ISS#2323203)
-  'ortography',
-  'spelling',
-  'grammar',
-  'quote',
-  'dash',
-  'replacement',
-  'correction',
-  'regularExpression',
-  'transitInformation', // ]TODO(macOS ISS#2323203)
 ];
 
 type DataDetectorTypesType =
@@ -813,7 +798,6 @@ const TextInput = createReactClass({
      * multiline fields. Note that for multiline fields, setting `blurOnSubmit`
      * to `true` means that pressing return will blur the field and trigger the
      * `onSubmitEditing` event instead of inserting a newline into the field.
-     * Ignored on Android, if Hardware Keyboard is connected. // TODO(android ISS)
      */
     blurOnSubmit: PropTypes.bool,
     /**
@@ -877,34 +861,14 @@ const TextInput = createReactClass({
      *
      * Possible values for `dataDetectorTypes` are:
      *
-     * *iOS + macOS*
-     *
      * - `'phoneNumber'`
      * - `'link'`
      * - `'address'`
      * - `'calendarEvent'`
-     *
-     * *iOS Only*
-     *
-     * The following values work on iOS only:
-     *
      * - `'none'`
      * - `'all'`
      *
-     * *macOS Only*
-     *
-     * The following values work on macOS only:
-     *
-     * - `'ortography'`
-     * - `'spelling'`
-     * - `'grammar'`
-     * - `'quote'`
-     * - `'dash'`
-     * - `'replacement'`
-     * - `'correction'`
-     * - `'regularExpression'`
-     * - `'transitInformation'`
-     *
+     * @platform ios
      */
     dataDetectorTypes: PropTypes.oneOfType([
       PropTypes.oneOf(DataDetectorTypes),
@@ -985,14 +949,6 @@ const TextInput = createReactClass({
     );
   },
 
-  /**
-   * Returns the native `TextView` node.
-   */
-  getTextViewHandle: function(): any {
-    // [TODO(OSS Candidate ISS#2710739)
-    return ReactNative.findNodeHandle(this._inputRef);
-  }, // ]TODO(OSS Candidate ISS#2710739)
-
   _inputRef: (undefined: any),
   _focusSubscription: (undefined: ?Function),
   _lastNativeText: (undefined: ?string),
@@ -1035,8 +991,7 @@ const TextInput = createReactClass({
 
   render: function() {
     let textInput;
-    if (Platform.OS === 'ios' || Platform.OS === 'macos') {
-      // TODO(macOS ISS#2323203)
+    if (Platform.OS === 'ios') {
       textInput = UIManager.getViewManagerConfig('RCTVirtualText')
         ? this._renderIOS()
         : this._renderIOSLegacy();
@@ -1146,7 +1101,6 @@ const TextInput = createReactClass({
         rejectResponderTermination={true}
         accessible={props.accessible}
         accessibilityLabel={props.accessibilityLabel}
-        accessibilityHint={props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole={props.accessibilityRole}
         accessibilityStates={props.accessibilityStates}
         nativeID={this.props.nativeID}
@@ -1256,7 +1210,6 @@ const TextInput = createReactClass({
         onPress={this._onPress}
         accessible={this.props.accessible}
         accessibilityLabel={this.props.accessibilityLabel}
-        accessibilityHint={this.props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole={this.props.accessibilityRole}
         accessibilityStates={this.props.accessibilityStates}
         nativeID={this.props.nativeID}
@@ -1267,15 +1220,6 @@ const TextInput = createReactClass({
   },
 
   _onFocus: function(event: FocusEvent) {
-    // [TODO(android ISS)
-    // Set the focused TextInput field info in TextInputState.
-    // Delaying this to onFocus native event ensures that -
-    // 1. The state is updated only after the native code completes setting focus on the view
-    // 2. In case the focus is moving from one TextInput(A) to another TextInput(B), the state of
-    //    A needs to be updated (blurred) before info about B is updated in TestInputState.
-    TextInputState.setFocusedTextInput(
-      ReactNative.findNodeHandle(this._inputRef),
-    ); // ]TODO(android ISS)
     if (this.props.onFocus) {
       this.props.onFocus(event);
     }
@@ -1371,17 +1315,7 @@ const TextInput = createReactClass({
   _onBlur: function(event: BlurEvent) {
     // This is a hack to fix https://fburl.com/toehyir8
     // @todo(rsnara) Figure out why this is necessary.
-    // this.blur();
-    // [TODO(android ISS) removed: this.blur();
-    // Set the focused TextInput field info in TextInputState.
-    // Delaying this to onBlur native event ensures that -
-    // 1. The state is updated only after the native code completes clearing focus on the view
-    // 2. In case the focus is moving from one TextInput(A) to another TextInput(B), the state of
-    //    A needs to be updated (blurred) before info about B is updated in TestInputState.
-    TextInputState.clearFocusedTextInput(
-      ReactNative.findNodeHandle(this._inputRef),
-    ); // ]TODO(android ISS)
-
+    this.blur();
     if (this.props.onBlur) {
       this.props.onBlur(event);
     }
