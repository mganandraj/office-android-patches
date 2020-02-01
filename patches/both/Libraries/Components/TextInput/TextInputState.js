diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\TextInput\\TextInputState.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\TextInput\\TextInputState.js"
index 5ce5595..61df6e0 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\TextInput\\TextInputState.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\TextInput\\TextInputState.js"
@@ -36,8 +36,11 @@ function currentlyFocusedField(): ?number {
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
@@ -58,7 +61,10 @@ function focusTextInput(textFieldID: ?number) {
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
@@ -71,6 +77,28 @@ function blurTextInput(textFieldID: ?number) {
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
@@ -85,6 +113,8 @@ function isTextInput(textFieldID: number) {
 
 module.exports = {
   currentlyFocusedField,
+  setFocusedTextInput, // TODO(android ISS)
+  clearFocusedTextInput, // TODO(android ISS)
   focusTextInput,
   blurTextInput,
   registerInput,
