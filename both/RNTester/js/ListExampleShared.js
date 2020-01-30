diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ListExampleShared.js b/E:/github/fb-react-native-forpatch/RNTester/js/ListExampleShared.js
index dae79e1a8..03d2f8222 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ListExampleShared.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ListExampleShared.js
@@ -51,7 +51,6 @@ const ITEM_HEIGHT = 72;
 class ItemComponent extends React.PureComponent<{
   fixedHeight?: ?boolean,
   horizontal?: ?boolean,
-  isSelected?: ?boolean,
   item: Item,
   onPress: (key: string) => void,
   onShowUnderlay?: () => void,
@@ -64,7 +63,6 @@ class ItemComponent extends React.PureComponent<{
     const {fixedHeight, horizontal, item} = this.props;
     const itemHash = Math.abs(hashCode(item.title));
     const imgSource = THUMB_URLS[itemHash % THUMB_URLS.length];
-    const rowStyle = this.props.isSelected ? styles.selectedRow : styles.row;
     return (
       <TouchableHighlight
         onPress={this._onPress}
@@ -73,11 +71,10 @@ class ItemComponent extends React.PureComponent<{
         tvParallaxProperties={{
           pressMagnification: 1.1,
         }}
-        acceptsKeyboardFocus={false} // TODO(macOS ISS#2323203)
         style={horizontal ? styles.horizItem : styles.item}>
         <View
           style={[
-            rowStyle,
+            styles.row,
             horizontal && {width: HORIZ_WIDTH},
             fixedHeight && {height: ITEM_HEIGHT},
           ]}>
@@ -303,11 +300,6 @@ const styles = StyleSheet.create({
     padding: 10,
     backgroundColor: 'white',
   },
-  selectedRow: {
-    flexDirection: 'row',
-    padding: 10,
-    backgroundColor: '#DDECF8',
-  },
   searchTextInput: {
     backgroundColor: 'white',
     borderColor: '#cccccc',
@@ -334,12 +326,6 @@ const styles = StyleSheet.create({
       margin: -10,
       transform: [{scale: 0.5}],
     },
-    macos: {
-      top: 4,
-      left: 12,
-      margin: -10,
-      transform: [{scale: 0.5}],
-    },
   }),
   stacked: {
     alignItems: 'center',
