diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Touchable/TouchableOpacity.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Touchable/TouchableOpacity.js
index 31dcc6ff3..235d47ff9 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Touchable/TouchableOpacity.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Touchable/TouchableOpacity.js
@@ -308,21 +308,9 @@ const TouchableOpacity = ((createReactClass({
       <Animated.View
         accessible={this.props.accessible !== false}
         accessibilityLabel={this.props.accessibilityLabel}
-        accessibilityHint={this.props.accessibilityHint} // TODO(OSS Candidate ISS#2710739)
+        accessibilityHint={this.props.accessibilityHint}
         accessibilityRole={this.props.accessibilityRole}
         accessibilityStates={this.props.accessibilityStates}
-        onAccessibilityTap={this.props.onAccessibilityTap} // TODO(OSS Candidate ISS#2710739)
-        acceptsKeyboardFocus={
-          (this.props.acceptsKeyboardFocus === undefined ||
-            this.props.acceptsKeyboardFocus) &&
-          !this.props.disabled
-        } // TODO(macOS ISS#2323203)
-        enableFocusRing={
-          (this.props.enableFocusRing === undefined ||
-            this.props.enableFocusRing) &&
-          !this.props.disabled
-        } // TODO(macOS ISS#2323203)
-        tabIndex={this.props.tabIndex} // TODO(win ISS#2323203)
         style={[this.props.style, {opacity: this.state.anim}]}
         nativeID={this.props.nativeID}
         testID={this.props.testID}
@@ -347,16 +335,6 @@ const TouchableOpacity = ((createReactClass({
         onResponderGrant={this.touchableHandleResponderGrant}
         onResponderMove={this.touchableHandleResponderMove}
         onResponderRelease={this.touchableHandleResponderRelease}
-        tooltip={this.props.tooltip} // TODO(macOS/win ISS#2323203)
-        onMouseEnter={this.props.onMouseEnter} // [TODO(macOS ISS#2323203)
-        onMouseLeave={this.props.onMouseLeave}
-        onDragEnter={this.props.onDragEnter}
-        onDragLeave={this.props.onDragLeave}
-        onDrop={this.props.onDrop}
-        draggedTypes={this.props.draggedTypes} // ]TODO(macOS ISS#2323203)
-        /* $FlowFixMe(>=0.89.0 site=react_native_fb) This comment suppresses an
-         * error found when Flow v0.89 was deployed. To see the error, delete
-         * this comment and run Flow. */
         onResponderTerminate={this.touchableHandleResponderTerminate}>
         {this.props.children}
         {Touchable.renderDebugView({
