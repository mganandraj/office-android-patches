--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableBounce.js"	2020-01-30 13:55:47.881607100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableBounce.js"	2020-01-29 14:10:08.873882700 -0800
@@ -181,6 +181,18 @@
         accessibilityHint={this.props.accessibilityHint}
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
         nativeID={this.props.nativeID}
         testID={this.props.testID}
         hitSlop={this.props.hitSlop}
@@ -197,7 +209,18 @@
         onResponderGrant={this.touchableHandleResponderGrant}
         onResponderMove={this.touchableHandleResponderMove}
         onResponderRelease={this.touchableHandleResponderRelease}
-        onResponderTerminate={this.touchableHandleResponderTerminate}>
+        /* $FlowFixMe(>=0.89.0 site=react_native_fb) This comment suppresses an
+         * error found when Flow v0.89 was deployed. To see the error, delete
+         * this comment and run Flow. */
+        onResponderTerminate={this.touchableHandleResponderTerminate}
+        tooltip={this.props.tooltip} // TODO(macOS/win ISS#2323203)
+        onMouseEnter={this.props.onMouseEnter} // [TODO(macOS ISS#2323203)
+        onMouseLeave={this.props.onMouseLeave}
+        onDragEnter={this.props.onDragEnter}
+        onDragLeave={this.props.onDragLeave}
+        onDrop={this.props.onDrop}
+        draggedTypes={this.props.draggedTypes} // ]TODO(macOS ISS#2323203)
+      >
         {this.props.children}
         {Touchable.renderDebugView({
           color: 'orange',
