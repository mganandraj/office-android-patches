diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ViewExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/ViewExample.js
index 91b8a64ac..25dc2641f 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ViewExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ViewExample.js
@@ -402,29 +402,6 @@ exports.examples = [
       return <ZIndexExample />;
     },
   },
-  {
-    // [TODO(macOS ISS#2323203)
-    title: 'ToolTip',
-    render() {
-      return (
-        <View tooltip="Parent View">
-          <Text style={{fontSize: 11}}>
-            This Parent View has tooltip "Parent View"
-          </Text>
-          <View tooltip="Child View 1">
-            <Text style={{fontSize: 11}}>
-              This view has tooltip "Child View 1"
-            </Text>
-          </View>
-          <View tooltip="Child View 2">
-            <Text style={{fontSize: 11}}>
-              This view has tooltip "Child View 2"
-            </Text>
-          </View>
-        </View>
-      );
-    },
-  }, // ]TODO(macOS ISS#2323203)
   {
     title: 'BackfaceVisibility',
     render: function() {
