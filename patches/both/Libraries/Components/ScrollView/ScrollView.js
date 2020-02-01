diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ScrollView\\ScrollView.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ScrollView\\ScrollView.js"
index 260bc0f..5180153 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ScrollView\\ScrollView.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ScrollView\\ScrollView.js"
@@ -281,6 +281,20 @@ type IOSProps = $ReadOnly<{|
     | 'never'
     | 'always'
   ),
+  /**
+   * Experimental: specifies how much to adjust the content view by when using
+   * the keyboard to scroll. This value adjusts the content's horizontal offset.
+   *
+   * @platform macos
+   */
+  horizontalLineScroll?: number, // TODO(macOS ISS#2323203)
+  /**
+   * Experimental: specifies how much to adjust the content view by when using
+   * the keyboard to scroll. This value adjusts the content's vertical offset.
+   *
+   * @platform macos
+   */
+  verticalLineScroll?: number, // TODO(macOS ISS#2323203)
   /**
    * When true, ScrollView will emit updateChildFrames data in scroll events,
    * otherwise will not compute or emit child frame data.  This only exists
@@ -867,12 +881,89 @@ class ScrollView extends React.Component<Props, State> {
     }
   }
 
+  // [TODO(macOS ISS#2323203)
+  _handleKeyDown = (event: ScrollEvent) => {
+    if (this.props.onScrollKeyDown) {
+      this.props.onScrollKeyDown(event);
+    } else {
+      if (Platform.OS === 'macos') {
+        const nativeEvent = event.nativeEvent;
+        const key = nativeEvent.key;
+        const kMinScrollOffset = 10;
+        if (key === 'PAGE_UP') {
+          this._handleScrollByKeyDown(event, {
+            x: nativeEvent.contentOffset.x,
+            y:
+              nativeEvent.contentOffset.y +
+              -nativeEvent.layoutMeasurement.height,
+          });
+        } else if (key === 'PAGE_DOWN') {
+          this._handleScrollByKeyDown(event, {
+            x: nativeEvent.contentOffset.x,
+            y:
+              nativeEvent.contentOffset.y +
+              nativeEvent.layoutMeasurement.height,
+          });
+        } else if (key === 'LEFT_ARROW') {
+          this._handleScrollByKeyDown(event, {
+            x:
+              nativeEvent.contentOffset.x +
+              -(this.props.horizontalLineScroll !== undefined
+                ? this.props.horizontalLineScroll
+                : kMinScrollOffset),
+            y: nativeEvent.contentOffset.y,
+          });
+        } else if (key === 'RIGHT_ARROW') {
+          this._handleScrollByKeyDown(event, {
+            x:
+              nativeEvent.contentOffset.x +
+              (this.props.horizontalLineScroll !== undefined
+                ? this.props.horizontalLineScroll
+                : kMinScrollOffset),
+            y: nativeEvent.contentOffset.y,
+          });
+        } else if (key === 'DOWN_ARROW') {
+          this._handleScrollByKeyDown(event, {
+            x: nativeEvent.contentOffset.x,
+            y:
+              nativeEvent.contentOffset.y +
+              (this.props.verticalLineScroll !== undefined
+                ? this.props.verticalLineScroll
+                : kMinScrollOffset),
+          });
+        } else if (key === 'UP_ARROW') {
+          this._handleScrollByKeyDown(event, {
+            x: nativeEvent.contentOffset.x,
+            y:
+              nativeEvent.contentOffset.y +
+              -(this.props.verticalLineScroll !== undefined
+                ? this.props.verticalLineScroll
+                : kMinScrollOffset),
+          });
+        }
+      }
+    }
+  };
+
+  _handleScrollByKeyDown = (event: ScrollEvent, newOffset) => {
+    const maxX =
+      event.nativeEvent.contentSize.width -
+      event.nativeEvent.layoutMeasurement.width;
+    const maxY =
+      event.nativeEvent.contentSize.height -
+      event.nativeEvent.layoutMeasurement.height;
+    this.scrollTo({
+      x: Math.max(0, Math.min(maxX, newOffset.x)),
+      y: Math.max(0, Math.min(maxY, newOffset.y)),
+    });
+  }; // ]TODO(macOS ISS#2323203)
+
   _handleScroll = (e: ScrollEvent) => {
     if (__DEV__) {
       if (
         this.props.onScroll &&
         this.props.scrollEventThrottle == null &&
-        Platform.OS === 'ios'
+        (Platform.OS === 'ios' || Platform.OS === 'macos') // TODO(macOS ISS#2323203)
       ) {
         console.log(
           'You specified `onScroll` on a <ScrollView> but not ' +
@@ -1046,6 +1137,7 @@ class ScrollView extends React.Component<Props, State> {
       // Override the onContentSizeChange from props, since this event can
       // bubble up from TextInputs
       onContentSizeChange: null,
+      onScrollKeyDown: this._handleKeyDown, // TODO(macOS ISS#2323203)
       onLayout: this._handleLayout,
       onMomentumScrollBegin: this._scrollResponder
         .scrollResponderHandleMomentumScrollBegin,
@@ -1096,6 +1188,11 @@ class ScrollView extends React.Component<Props, State> {
           this.props.pagingEnabled === true &&
           this.props.snapToInterval == null &&
           this.props.snapToOffsets == null,
+        // [TODO(macOS ISS#2323203)
+        macos:
+          this.props.pagingEnabled === true &&
+          this.props.snapToInterval == null &&
+          this.props.snapToOffsets == null, // ]TODO(macOS ISS#2323203)
         // on Android, pagingEnabled must be set to true to have snapToInterval / snapToOffsets work
         android:
           this.props.pagingEnabled === true ||
