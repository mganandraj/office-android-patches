--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\FlatList.js"	2020-01-30 13:55:47.923608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\FlatList.js"	2020-01-29 14:10:08.923882800 -0800
@@ -601,7 +601,7 @@
   _renderItem = (info: Object): ?React.Node => {
     const {renderItem, numColumns, columnWrapperStyle} = this.props;
     if (numColumns > 1) {
-      const {item, index} = info;
+      const {item, index, isSelected} = info; // TODO(macOS ISS#2323203)
       invariant(
         Array.isArray(item),
         'Expected array of items with numColumns > 1',
@@ -616,6 +616,7 @@
             const element = renderItem({
               item: it,
               index: index * numColumns + kk,
+              isSelected: isSelected, // TODO(macOS ISS#2323203)
               separators: info.separators,
             });
             return element != null ? (
