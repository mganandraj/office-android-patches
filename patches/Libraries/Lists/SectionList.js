--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\SectionList.js"	2020-01-30 13:55:47.923608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\SectionList.js"	2020-01-29 14:10:08.924884400 -0800
@@ -46,6 +46,7 @@
   renderItem?: (info: {
     item: Item,
     index: number,
+    isSelected?: boolean, // TODO(macOS ISS#2323203)
     section: SectionT,
     separators: {
       highlight: () => void,
