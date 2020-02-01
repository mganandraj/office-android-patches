diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\FlatListExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\FlatListExample.js"
index f858704..ba97a89 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\FlatListExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\FlatListExample.js"
@@ -130,6 +130,9 @@ class FlatListExample extends React.PureComponent<Props, State> {
             data={this.state.empty ? [] : filteredData}
             debug={this.state.debug}
             disableVirtualization={!this.state.virtualized}
+            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
+            enableSelectionOnKeyPress={true}
+            onSelectionEntered={this._handleSelectionEntered}
             getItemLayout={
               this.state.fixedHeight ? this._getItemLayout : undefined
             }
@@ -173,10 +176,11 @@ class FlatListExample extends React.PureComponent<Props, State> {
     }));
   };
   _onRefresh = () => Alert.alert('onRefresh: nothing to refresh :P');
-  _renderItemComponent = ({item, separators}) => {
+  _renderItemComponent = ({item, isSelected, separators}) => {
     return (
       <ItemComponent
         item={item}
+        isSelected={isSelected}
         horizontal={this.state.horizontal}
         fixedHeight={this.state.fixedHeight}
         onPress={this._pressItem}
@@ -208,6 +212,11 @@ class FlatListExample extends React.PureComponent<Props, State> {
     this._listRef.getNode().recordInteraction();
     pressItem(this, key);
   };
+  _handleSelectionEntered = item => {
+    const {key} = item;
+    this._listRef.getNode().recordInteraction();
+    pressItem(this, key);
+  };
   _listRef: Animated.FlatList;
 }
 
