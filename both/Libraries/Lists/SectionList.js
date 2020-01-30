diff --git a/E:/github/ms-react-native-forpatch/Libraries/Lists/SectionList.js b/E:/github/fb-react-native-forpatch/Libraries/Lists/SectionList.js
index 1840d921c..076fb0e29 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Lists/SectionList.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Lists/SectionList.js
@@ -46,7 +46,6 @@ type OptionalProps<SectionT: SectionBase<any>> = {
   renderItem?: (info: {
     item: Item,
     index: number,
-    isSelected?: boolean, // TODO(macOS ISS#2323203)
     section: SectionT,
     separators: {
       highlight: () => void,
