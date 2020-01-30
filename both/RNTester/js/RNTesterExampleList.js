diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterExampleList.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterExampleList.js
index 6421260ca..9082b7a05 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterExampleList.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterExampleList.js
@@ -36,7 +36,6 @@ type Props = {
 
 class RowComponent extends React.PureComponent<{
   item: Object,
-  isSelected?: ?boolean,
   onNavigate: Function,
   onPress?: Function,
   onShowUnderlay?: Function,
@@ -51,15 +50,12 @@ class RowComponent extends React.PureComponent<{
   };
   render() {
     const {item} = this.props;
-    const rowStyle = this.props.isSelected ? styles.selectedRow : styles.row;
     return (
       <TouchableHighlight
         onShowUnderlay={this.props.onShowUnderlay}
         onHideUnderlay={this.props.onHideUnderlay}
-        onAccessibilityTap={this._onPress}
-        acceptsKeyboardFocus={false} // TODO(macOS ISS#2323203)
         onPress={this._onPress}>
-        <View style={rowStyle}>
+        <View style={styles.row}>
           <Text style={styles.rowTitleText}>{item.module.title}</Text>
           <Text style={styles.rowDetailText}>{item.module.description}</Text>
         </View>
@@ -108,17 +104,9 @@ class RNTesterExampleList extends React.Component<Props, $FlowFixMeState> {
               enableEmptySections={true}
               itemShouldUpdate={this._itemShouldUpdate}
               keyboardShouldPersistTaps="handled"
-              acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
-              onSelectionEntered={this._handleOnSelectionEntered} // TODO(macOS ISS#2323203)
-              enableSelectionOnKeyPress={true} // TODO(macOS ISS#2323203)
               automaticallyAdjustContentInsets={false}
               keyboardDismissMode="on-drag"
               renderSectionHeader={renderSectionHeader}
-              backgroundColor={Platform.select({
-                macos: 'transparent',
-                ios: 'transparent',
-                default: undefined,
-              })} // TODO(macOS ISS#2323203)
             />
           )}
         />
@@ -126,19 +114,13 @@ class RNTesterExampleList extends React.Component<Props, $FlowFixMeState> {
     );
   }
 
-  _handleOnSelectionEntered = item => {
-    const {key} = item;
-    this.props.onNavigate(RNTesterActions.ExampleAction(key));
-  };
-
   _itemShouldUpdate(curr, prev) {
     return curr.item !== prev.item;
   }
 
-  _renderItem = ({item, isSelected, separators}) => (
+  _renderItem = ({item, separators}) => (
     <RowComponent
       item={item}
-      isSelected={isSelected}
       onNavigate={this.props.onNavigate}
       onShowUnderlay={separators.highlight}
       onHideUnderlay={separators.unhighlight}
@@ -182,111 +164,35 @@ const styles = StyleSheet.create({
     flex: 1,
   },
   list: {
-    ...Platform.select({
-      // [TODO(macOS ISS#2323203)
-      macos: {
-        backgroundColor: {semantic: 'controlBackgroundColor'},
-      },
-      ios: {
-        backgroundColor: {semantic: 'systemBackgroundColor'},
-      },
-      default: {
-        // ]TODO(macOS ISS#2323203)
-        backgroundColor: '#eeeeee',
-      }, // [TODO(macOS ISS#2323203)
-    }), // ]TODO(macOS ISS#2323203)
+    backgroundColor: '#eeeeee',
   },
   sectionHeader: {
-    ...Platform.select({
-      // [TODO(macOS ISS#2323203)
-      macos: {
-        backgroundColor: {
-          semantic: 'unemphasizedSelectedContentBackgroundColor',
-        },
-        color: {semantic: 'headerTextColor'},
-      },
-      ios: {
-        backgroundColor: {
-          semantic: 'systemGroupedBackgroundColor',
-        },
-        color: {semantic: 'secondaryLabelColor'},
-      },
-      default: {
-        // ]TODO(macOS ISS#2323203)
-        backgroundColor: '#eeeeee',
-        color: 'black',
-      }, // [TODO(macOS ISS#2323203)
-    }), // ]TODO(macOS ISS#2323203)
+    backgroundColor: '#eeeeee',
     padding: 5,
     fontWeight: '500',
     fontSize: 11,
   },
   row: {
-    ...Platform.select({
-      // [TODO(macOS ISS#2323203)
-      macos: {
-        backgroundColor: {semantic: 'controlBackgroundColor'},
-      },
-      ios: {
-        backgroundColor: {semantic: 'secondarySystemGroupedBackgroundColor'},
-      },
-      default: {
-        // ]TODO(macOS ISS#2323203)
-        backgroundColor: 'white',
-      }, // [TODO(macOS ISS#2323203)
-    }), // ]TODO(macOS ISS#2323203)
-    justifyContent: 'center',
-    paddingHorizontal: 15,
-    paddingVertical: 8,
-  },
-  selectedRow: {
-    backgroundColor: '#DDECF8',
+    backgroundColor: 'white',
     justifyContent: 'center',
     paddingHorizontal: 15,
     paddingVertical: 8,
   },
   separator: {
     height: StyleSheet.hairlineWidth,
-    ...Platform.select({
-      // [TODO(macOS ISS#2323203)
-      macos: {
-        backgroundColor: {semantic: 'separatorColor'},
-      },
-      ios: {
-        backgroundColor: {semantic: 'separatorColor'},
-      },
-      default: {
-        // ]TODO(macOS ISS#2323203)
-        backgroundColor: '#bbbbbb',
-      }, // [TODO(macOS ISS#2323203)
-    }), // ]TODO(macOS ISS#2323203)
+    backgroundColor: '#bbbbbb',
     marginLeft: 15,
   },
   separatorHighlighted: {
     height: StyleSheet.hairlineWidth,
     backgroundColor: 'rgb(217, 217, 217)',
   },
-  sectionListContentContainer: Platform.select({
-    macos: {backgroundColor: {semantic: 'separatorColor'}},
-    ios: {backgroundColor: {semantic: 'separatorColor'}},
-    default: {backgroundColor: 'white'},
-  }),
+  sectionListContentContainer: {
+    backgroundColor: 'white',
+  },
   rowTitleText: {
     fontSize: 17,
     fontWeight: '500',
-    ...Platform.select({
-      // [TODO(macOS ISS#2323203)
-      macos: {
-        color: {semantic: 'controlTextColor'},
-      },
-      ios: {
-        color: {semantic: 'labelColor'},
-      },
-      default: {
-        // ]TODO(macOS ISS#2323203)
-        color: 'black',
-      }, // [TODO(macOS ISS#2323203)
-    }), // ]TODO(macOS ISS#2323203)
   },
   rowDetailText: {
     fontSize: 15,
