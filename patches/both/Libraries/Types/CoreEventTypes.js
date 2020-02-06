--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Types\\CoreEventTypes.js"	2020-01-30 13:55:48.003608400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Types\\CoreEventTypes.js"	2020-01-29 14:10:09.006883800 -0800
@@ -84,13 +84,18 @@
 
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
@@ -127,6 +132,7 @@
     |}>,
     zoomScale?: number,
     responderIgnoreScroll?: boolean,
+    key?: string, // TODO(macOS)
   |}>,
 >;
 
