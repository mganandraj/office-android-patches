diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Types\\CoreEventTypes.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Types\\CoreEventTypes.js"
index abe3ca1..a83bac3 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Types\\CoreEventTypes.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Types\\CoreEventTypes.js"
@@ -84,13 +84,18 @@ export type TextLayoutEvent = SyntheticEvent<
 
 export type PressEvent = ResponderSyntheticEvent<
   $ReadOnly<{|
+    altKey: ?boolean, // TODO(macOS)
+    button: ?number, // TODO(macOS)
     changedTouches: $ReadOnlyArray<$PropertyType<PressEvent, 'nativeEvent'>>,
+    ctrlKey: ?boolean,
     force: number,
     identifier: number,
     locationX: number,
     locationY: number,
+    metaKey: ?boolean, // TODO(macOS)
     pageX: number,
     pageY: number,
+    shiftKey: ?boolean, // TODO(macOS)
     target: ?number,
     timestamp: number,
     touches: $ReadOnlyArray<$PropertyType<PressEvent, 'nativeEvent'>>,
@@ -127,6 +132,7 @@ export type ScrollEvent = SyntheticEvent<
     |}>,
     zoomScale?: number,
     responderIgnoreScroll?: boolean,
+    key?: string, // TODO(macOS)
   |}>,
 >;
 
