--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterExampleList.js"	2020-01-30 13:55:48.083612100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterExampleList.js"	2020-01-29 14:10:09.181886200 -0800
@@ -36,6 +36,7 @@
 
 class RowComponent extends React.PureComponent<{
   item: Object,
+  isSelected?: ?boolean,
   onNavigate: Function,
   onPress?: Function,
   onShowUnderlay?: Function,
@@ -50,12 +51,15 @@
   };
   render() {
     const {item} = this.props;
+    const rowStyle = this.props.isSelected ? styles.selectedRow : styles.row;
     return (
       <TouchableHighlight
         onShowUnderlay={this.props.onShowUnderlay}
         onHideUnderlay={this.props.onHideUnderlay}
+        onAccessibilityTap={this._onPress}
+        acceptsKeyboardFocus={false} // TODO(macOS ISS#2323203)
         onPress={this._onPress}>
-        <View style={styles.row}>
+        <View style={rowStyle}>
           <Text style={styles.rowTitleText}>{item.module.title}</Text>
           <Text style={styles.rowDetailText}>{item.module.description}</Text>
         </View>
@@ -104,9 +108,17 @@
               enableEmptySections={true}
               itemShouldUpdate={this._itemShouldUpdate}
               keyboardShouldPersistTaps="handled"
+              acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
+              onSelectionEntered={this._handleOnSelectionEntered} // TODO(macOS ISS#2323203)
+              enableSelectionOnKeyPress={true} // TODO(macOS ISS#2323203)
               automaticallyAdjustContentInsets={false}
               keyboardDismissMode="on-drag"
               renderSectionHeader={renderSectionHeader}
+              backgroundColor={Platform.select({
+                macos: 'transparent',
+                ios: 'transparent',
+                default: undefined,
+              })} // TODO(macOS ISS#2323203)
             />
           )}
         />
@@ -114,13 +126,19 @@
     );
   }
 
+  _handleOnSelectionEntered = item => {
+    const {key} = item;
+    this.props.onNavigate(RNTesterActions.ExampleAction(key));
+  };
+
   _itemShouldUpdate(curr, prev) {
     return curr.item !== prev.item;
   }
 
-  _renderItem = ({item, separators}) => (
+  _renderItem = ({item, isSelected, separators}) => (
     <RowComponent
       item={item}
+      isSelected={isSelected}
       onNavigate={this.props.onNavigate}
       onShowUnderlay={separators.highlight}
       onHideUnderlay={separators.unhighlight}
@@ -164,35 +182,111 @@
     flex: 1,
   },
   list: {
-    backgroundColor: '#eeeeee',
+    ...Platform.select({
+      // [TODO(macOS ISS#2323203)
+      macos: {
+        backgroundColor: {semantic: 'controlBackgroundColor'},
+      },
+      ios: {
+        backgroundColor: {semantic: 'systemBackgroundColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: '#eeeeee',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
   },
   sectionHeader: {
-    backgroundColor: '#eeeeee',
+    ...Platform.select({
+      // [TODO(macOS ISS#2323203)
+      macos: {
+        backgroundColor: {
+          semantic: 'unemphasizedSelectedContentBackgroundColor',
+        },
+        color: {semantic: 'headerTextColor'},
+      },
+      ios: {
+        backgroundColor: {
+          semantic: 'systemGroupedBackgroundColor',
+        },
+        color: {semantic: 'secondaryLabelColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: '#eeeeee',
+        color: 'black',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
     padding: 5,
     fontWeight: '500',
     fontSize: 11,
   },
   row: {
-    backgroundColor: 'white',
+    ...Platform.select({
+      // [TODO(macOS ISS#2323203)
+      macos: {
+        backgroundColor: {semantic: 'controlBackgroundColor'},
+      },
+      ios: {
+        backgroundColor: {semantic: 'secondarySystemGroupedBackgroundColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: 'white',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
+    justifyContent: 'center',
+    paddingHorizontal: 15,
+    paddingVertical: 8,
+  },
+  selectedRow: {
+    backgroundColor: '#DDECF8',
     justifyContent: 'center',
     paddingHorizontal: 15,
     paddingVertical: 8,
   },
   separator: {
     height: StyleSheet.hairlineWidth,
-    backgroundColor: '#bbbbbb',
+    ...Platform.select({
+      // [TODO(macOS ISS#2323203)
+      macos: {
+        backgroundColor: {semantic: 'separatorColor'},
+      },
+      ios: {
+        backgroundColor: {semantic: 'separatorColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: '#bbbbbb',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
     marginLeft: 15,
   },
   separatorHighlighted: {
     height: StyleSheet.hairlineWidth,
     backgroundColor: 'rgb(217, 217, 217)',
   },
-  sectionListContentContainer: {
-    backgroundColor: 'white',
-  },
+  sectionListContentContainer: Platform.select({
+    macos: {backgroundColor: {semantic: 'separatorColor'}},
+    ios: {backgroundColor: {semantic: 'separatorColor'}},
+    default: {backgroundColor: 'white'},
+  }),
   rowTitleText: {
     fontSize: 17,
     fontWeight: '500',
+    ...Platform.select({
+      // [TODO(macOS ISS#2323203)
+      macos: {
+        color: {semantic: 'controlTextColor'},
+      },
+      ios: {
+        color: {semantic: 'labelColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        color: 'black',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
   },
   rowDetailText: {
     fontSize: 15,
