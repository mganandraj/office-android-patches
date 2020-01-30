diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Button.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Button.js
index 3c4117c21..5105ee1ba 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Button.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Button.js
@@ -87,10 +87,7 @@ type ButtonProps = $ReadOnly<{|
    * Text to display for blindness accessibility features
    */
   accessibilityLabel?: ?string,
-  /**
-   * Hint text to display blindness accessibility features
-   */
-  accessibilityHint?: ?string, // TODO(OSS Candidate ISS#2710739)
+
   /**
    * If true, disable all interactions for this component.
    */
@@ -134,7 +131,6 @@ class Button extends React.Component<ButtonProps> {
   render() {
     const {
       accessibilityLabel,
-      accessibilityHint, // TODO(OSS Candidate ISS#2710739)
       color,
       onPress,
       touchSoundDisabled,
@@ -151,10 +147,7 @@ class Button extends React.Component<ButtonProps> {
     const buttonStyles = [styles.button];
     const textStyles = [styles.text];
     if (color) {
-      if (
-        Platform.OS === 'ios' ||
-        Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-      ) {
+      if (Platform.OS === 'ios') {
         textStyles.push({color: color});
       } else {
         buttonStyles.push({backgroundColor: color});
@@ -177,7 +170,6 @@ class Button extends React.Component<ButtonProps> {
     return (
       <Touchable
         accessibilityLabel={accessibilityLabel}
-        accessibilityHint={accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole="button"
         accessibilityStates={accessibilityStates}
         hasTVPreferredFocus={hasTVPreferredFocus}
@@ -209,7 +201,6 @@ const styles = StyleSheet.create({
       backgroundColor: '#2196F3',
       borderRadius: 2,
     },
-    macos: {}, // TODO(macOS ISS#2323203)
   }),
   text: {
     textAlign: 'center',
@@ -224,11 +215,6 @@ const styles = StyleSheet.create({
         color: 'white',
         fontWeight: '500',
       },
-      macos: {
-        // [TODO(macOS ISS#2323203)
-        color: '#007AFF',
-        fontSize: 18,
-      }, // ]TODO(macOS ISS#2323203)
     }),
   },
   buttonDisabled: Platform.select({
@@ -237,16 +223,11 @@ const styles = StyleSheet.create({
       elevation: 0,
       backgroundColor: '#dfdfdf',
     },
-    macos: {}, // TODO(macOS ISS#2323203)
   }),
   textDisabled: Platform.select({
     ios: {
       color: '#cdcdcd',
     },
-    macos: {
-      // [TODO(macOS ISS#2323203)
-      color: '#cdcdcd',
-    }, // ]TODO(macOS ISS#2323203)
     android: {
       color: '#a1a1a1',
     },
