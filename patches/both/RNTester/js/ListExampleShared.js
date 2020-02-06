--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ListExampleShared.js"	2020-01-30 13:55:48.078610900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\ListExampleShared.js"	2020-01-29 14:10:09.174888900 -0800
@@ -51,6 +51,7 @@
 class ItemComponent extends React.PureComponent<{
   fixedHeight?: ?boolean,
   horizontal?: ?boolean,
+  isSelected?: ?boolean,
   item: Item,
   onPress: (key: string) => void,
   onShowUnderlay?: () => void,
@@ -63,6 +64,7 @@
     const {fixedHeight, horizontal, item} = this.props;
     const itemHash = Math.abs(hashCode(item.title));
     const imgSource = THUMB_URLS[itemHash % THUMB_URLS.length];
+    const rowStyle = this.props.isSelected ? styles.selectedRow : styles.row;
     return (
       <TouchableHighlight
         onPress={this._onPress}
@@ -71,10 +73,11 @@
         tvParallaxProperties={{
           pressMagnification: 1.1,
         }}
+        acceptsKeyboardFocus={false} // TODO(macOS ISS#2323203)
         style={horizontal ? styles.horizItem : styles.item}>
         <View
           style={[
-            styles.row,
+            rowStyle,
             horizontal && {width: HORIZ_WIDTH},
             fixedHeight && {height: ITEM_HEIGHT},
           ]}>
@@ -300,6 +303,11 @@
     padding: 10,
     backgroundColor: 'white',
   },
+  selectedRow: {
+    flexDirection: 'row',
+    padding: 10,
+    backgroundColor: '#DDECF8',
+  },
   searchTextInput: {
     backgroundColor: 'white',
     borderColor: '#cccccc',
@@ -326,6 +334,12 @@
       margin: -10,
       transform: [{scale: 0.5}],
     },
+    macos: {
+      top: 4,
+      left: 12,
+      margin: -10,
+      transform: [{scale: 0.5}],
+    },
   }),
   stacked: {
     alignItems: 'center',
