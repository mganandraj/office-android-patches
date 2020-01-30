diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/TextInput/TextInputState.js b/E:/github/fb-react-native-forpatch/Libraries/Components/TextInput/TextInputState.js
index 61df6e0f9..5ce5595c4 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/TextInput/TextInputState.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/TextInput/TextInputState.js
@@ -36,11 +36,8 @@ function currentlyFocusedField(): ?number {
  */
 function focusTextInput(textFieldID: ?number) {
   if (currentlyFocusedID !== textFieldID && textFieldID !== null) {
-    // TODO(android ISS) removed: currentlyFocusedID = textFieldID;
-    if (
-      Platform.OS === 'ios' ||
-      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-    ) {
+    currentlyFocusedID = textFieldID;
+    if (Platform.OS === 'ios') {
       UIManager.focus(textFieldID);
     } else if (Platform.OS === 'android') {
       UIManager.dispatchViewManagerCommand(
@@ -61,10 +58,7 @@ function focusTextInput(textFieldID: ?number) {
 function blurTextInput(textFieldID: ?number) {
   if (currentlyFocusedID === textFieldID && textFieldID !== null) {
     currentlyFocusedID = null;
-    if (
-      Platform.OS === 'ios' ||
-      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-    ) {
+    if (Platform.OS === 'ios') {
       UIManager.blur(textFieldID);
     } else if (Platform.OS === 'android') {
       UIManager.dispatchViewManagerCommand(
@@ -77,28 +71,6 @@ function blurTextInput(textFieldID: ?number) {
   }
 }
 
-/** [TODO(android ISS)
- * @param {number} TextInputID id of the text field that has received focus
- * Should be called after the view has received focus and fired the onFocus event
- * noop if the focused text field is same
- */
-function setFocusedTextInput(textFieldID: ?number) {
-  if (currentlyFocusedID !== textFieldID && textFieldID !== null) {
-    currentlyFocusedID = textFieldID;
-  }
-}
-
-/**
- * @param {number} TextInputID id of the text field whose focus has to be cleared
- * Should be called after the view has cleared focus and fired the onFocus event
- * noop if the focused text field is not same
- */
-function clearFocusedTextInput(textFieldID: ?number) {
-  if (currentlyFocusedID === textFieldID && textFieldID !== null) {
-    currentlyFocusedID = null;
-  }
-} // ]TODO(android ISS)
-
 function registerInput(textFieldID: number) {
   inputs.add(textFieldID);
 }
@@ -113,8 +85,6 @@ function isTextInput(textFieldID: number) {
 
 module.exports = {
   currentlyFocusedField,
-  setFocusedTextInput, // TODO(android ISS)
-  clearFocusedTextInput, // TODO(android ISS)
   focusTextInput,
   blurTextInput,
   registerInput,
