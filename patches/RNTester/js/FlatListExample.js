--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\FlatListExample.js"	2020-01-30 13:55:48.076612100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\FlatListExample.js"	2020-01-29 14:10:09.170894200 -0800
@@ -130,6 +130,9 @@
             data={this.state.empty ? [] : filteredData}
             debug={this.state.debug}
             disableVirtualization={!this.state.virtualized}
+            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
+            enableSelectionOnKeyPress={true}
+            onSelectionEntered={this._handleSelectionEntered}
             getItemLayout={
               this.state.fixedHeight ? this._getItemLayout : undefined
             }
@@ -173,10 +176,11 @@
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
@@ -208,6 +212,11 @@
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
 
