--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\TextInput\\TextInputState.js"	2020-01-30 13:55:47.878607300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\TextInput\\TextInputState.js"	2020-01-29 14:10:08.868885000 -0800
@@ -36,8 +36,11 @@
  */
 function focusTextInput(textFieldID: ?number) {
   if (currentlyFocusedID !== textFieldID && textFieldID !== null) {
-    currentlyFocusedID = textFieldID;
-    if (Platform.OS === 'ios') {
+    // TODO(android ISS) removed: currentlyFocusedID = textFieldID;
+    if (
+      Platform.OS === 'ios' ||
+      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+    ) {
       UIManager.focus(textFieldID);
     } else if (Platform.OS === 'android') {
       UIManager.dispatchViewManagerCommand(
@@ -58,7 +61,10 @@
 function blurTextInput(textFieldID: ?number) {
   if (currentlyFocusedID === textFieldID && textFieldID !== null) {
     currentlyFocusedID = null;
-    if (Platform.OS === 'ios') {
+    if (
+      Platform.OS === 'ios' ||
+      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+    ) {
       UIManager.blur(textFieldID);
     } else if (Platform.OS === 'android') {
       UIManager.dispatchViewManagerCommand(
@@ -71,6 +77,28 @@
   }
 }
 
+/** [TODO(android ISS)
+ * @param {number} TextInputID id of the text field that has received focus
+ * Should be called after the view has received focus and fired the onFocus event
+ * noop if the focused text field is same
+ */
+function setFocusedTextInput(textFieldID: ?number) {
+  if (currentlyFocusedID !== textFieldID && textFieldID !== null) {
+    currentlyFocusedID = textFieldID;
+  }
+}
+
+/**
+ * @param {number} TextInputID id of the text field whose focus has to be cleared
+ * Should be called after the view has cleared focus and fired the onFocus event
+ * noop if the focused text field is not same
+ */
+function clearFocusedTextInput(textFieldID: ?number) {
+  if (currentlyFocusedID === textFieldID && textFieldID !== null) {
+    currentlyFocusedID = null;
+  }
+} // ]TODO(android ISS)
+
 function registerInput(textFieldID: number) {
   inputs.add(textFieldID);
 }
@@ -85,6 +113,8 @@
 
 module.exports = {
   currentlyFocusedField,
+  setFocusedTextInput, // TODO(android ISS)
+  clearFocusedTextInput, // TODO(android ISS)
   focusTextInput,
   blurTextInput,
   registerInput,
