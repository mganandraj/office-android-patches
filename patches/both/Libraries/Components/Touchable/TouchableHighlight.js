diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableHighlight.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableHighlight.js"
index b9e5529..c7dd414 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableHighlight.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableHighlight.js"
@@ -405,9 +405,21 @@ const TouchableHighlight = ((createReactClass({
       <View
         accessible={this.props.accessible !== false}
         accessibilityLabel={this.props.accessibilityLabel}
-        accessibilityHint={this.props.accessibilityHint}
+        accessibilityHint={this.props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
         accessibilityRole={this.props.accessibilityRole}
         accessibilityStates={this.props.accessibilityStates}
+        onAccessibilityTap={this.props.onAccessibilityTap} // TODO(OSS Candidate ISS#2710739)
+        acceptsKeyboardFocus={
+          (this.props.acceptsKeyboardFocus === undefined ||
+            this.props.acceptsKeyboardFocus) &&
+          !this.props.disabled
+        } // TODO(macOS/win ISS#2323203)
+        enableFocusRing={
+          (this.props.enableFocusRing === undefined ||
+            this.props.enableFocusRing) &&
+          !this.props.disabled
+        } // TODO(macOS/win ISS#2323203)
+        tabIndex={this.props.tabIndex} // TODO(win ISS#2323203)
         style={StyleSheet.compose(
           this.props.style,
           this.state.extraUnderlayStyle,
@@ -434,6 +446,13 @@ const TouchableHighlight = ((createReactClass({
         onResponderMove={this.touchableHandleResponderMove}
         onResponderRelease={this.touchableHandleResponderRelease}
         onResponderTerminate={this.touchableHandleResponderTerminate}
+        tooltip={this.props.tooltip} // TODO(macOS/win ISS#2323203)
+        onMouseEnter={this.props.onMouseEnter} // [TODO(macOS/win ISS#2323203)
+        onMouseLeave={this.props.onMouseLeave}
+        onDragEnter={this.props.onDragEnter}
+        onDragLeave={this.props.onDragLeave}
+        onDrop={this.props.onDrop}
+        draggedTypes={this.props.draggedTypes} // ]TODO(macOS/win ISS#2323203)
         nativeID={this.props.nativeID}
         testID={this.props.testID}>
         {React.cloneElement(child, {
