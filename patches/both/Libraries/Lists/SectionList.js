diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\SectionList.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\SectionList.js"
index 076fb0e..1840d92 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\SectionList.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\SectionList.js"
@@ -46,6 +46,7 @@ type OptionalProps<SectionT: SectionBase<any>> = {
   renderItem?: (info: {
     item: Item,
     index: number,
+    isSelected?: boolean, // TODO(macOS ISS#2323203)
     section: SectionT,
     separators: {
       highlight: () => void,
