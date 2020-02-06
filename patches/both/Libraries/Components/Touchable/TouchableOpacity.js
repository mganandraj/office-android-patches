--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableOpacity.js"	2020-01-30 13:55:47.882607500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableOpacity.js"	2020-01-29 14:10:08.874883000 -0800
@@ -308,9 +308,21 @@
       <Animated.View
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
+        } // TODO(macOS ISS#2323203)
+        enableFocusRing={
+          (this.props.enableFocusRing === undefined ||
+            this.props.enableFocusRing) &&
+          !this.props.disabled
+        } // TODO(macOS ISS#2323203)
+        tabIndex={this.props.tabIndex} // TODO(win ISS#2323203)
         style={[this.props.style, {opacity: this.state.anim}]}
         nativeID={this.props.nativeID}
         testID={this.props.testID}
@@ -335,6 +347,16 @@
         onResponderGrant={this.touchableHandleResponderGrant}
         onResponderMove={this.touchableHandleResponderMove}
         onResponderRelease={this.touchableHandleResponderRelease}
+        tooltip={this.props.tooltip} // TODO(macOS/win ISS#2323203)
+        onMouseEnter={this.props.onMouseEnter} // [TODO(macOS ISS#2323203)
+        onMouseLeave={this.props.onMouseLeave}
+        onDragEnter={this.props.onDragEnter}
+        onDragLeave={this.props.onDragLeave}
+        onDrop={this.props.onDrop}
+        draggedTypes={this.props.draggedTypes} // ]TODO(macOS ISS#2323203)
+        /* $FlowFixMe(>=0.89.0 site=react_native_fb) This comment suppresses an
+         * error found when Flow v0.89 was deployed. To see the error, delete
+         * this comment and run Flow. */
         onResponderTerminate={this.touchableHandleResponderTerminate}>
         {this.props.children}
         {Touchable.renderDebugView({
