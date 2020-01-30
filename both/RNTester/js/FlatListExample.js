diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/FlatListExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/FlatListExample.js
index ba97a898b..f85870405 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/FlatListExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/FlatListExample.js
@@ -130,9 +130,6 @@ class FlatListExample extends React.PureComponent<Props, State> {
             data={this.state.empty ? [] : filteredData}
             debug={this.state.debug}
             disableVirtualization={!this.state.virtualized}
-            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
-            enableSelectionOnKeyPress={true}
-            onSelectionEntered={this._handleSelectionEntered}
             getItemLayout={
               this.state.fixedHeight ? this._getItemLayout : undefined
             }
@@ -176,11 +173,10 @@ class FlatListExample extends React.PureComponent<Props, State> {
     }));
   };
   _onRefresh = () => Alert.alert('onRefresh: nothing to refresh :P');
-  _renderItemComponent = ({item, isSelected, separators}) => {
+  _renderItemComponent = ({item, separators}) => {
     return (
       <ItemComponent
         item={item}
-        isSelected={isSelected}
         horizontal={this.state.horizontal}
         fixedHeight={this.state.fixedHeight}
         onPress={this._pressItem}
@@ -212,11 +208,6 @@ class FlatListExample extends React.PureComponent<Props, State> {
     this._listRef.getNode().recordInteraction();
     pressItem(this, key);
   };
-  _handleSelectionEntered = item => {
-    const {key} = item;
-    this._listRef.getNode().recordInteraction();
-    pressItem(this, key);
-  };
   _listRef: Animated.FlatList;
 }
 
