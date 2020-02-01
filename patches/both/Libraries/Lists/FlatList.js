diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\FlatList.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\FlatList.js"
index 5d17580..cc91ae7 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\FlatList.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\FlatList.js"
@@ -601,7 +601,7 @@ class FlatList<ItemT> extends React.PureComponent<Props<ItemT>, void> {
   _renderItem = (info: Object): ?React.Node => {
     const {renderItem, numColumns, columnWrapperStyle} = this.props;
     if (numColumns > 1) {
-      const {item, index} = info;
+      const {item, index, isSelected} = info; // TODO(macOS ISS#2323203)
       invariant(
         Array.isArray(item),
         'Expected array of items with numColumns > 1',
@@ -616,6 +616,7 @@ class FlatList<ItemT> extends React.PureComponent<Props<ItemT>, void> {
             const element = renderItem({
               item: it,
               index: index * numColumns + kk,
+              isSelected: isSelected, // TODO(macOS ISS#2323203)
               separators: info.separators,
             });
             return element != null ? (
