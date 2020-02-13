--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ViewExample.js"	2020-01-30 13:55:48.096609000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\ViewExample.js"	2020-01-29 14:10:09.199887200 -0800
@@ -403,6 +403,29 @@
     },
   },
   {
+    // [TODO(macOS ISS#2323203)
+    title: 'ToolTip',
+    render() {
+      return (
+        <View tooltip="Parent View">
+          <Text style={{fontSize: 11}}>
+            This Parent View has tooltip "Parent View"
+          </Text>
+          <View tooltip="Child View 1">
+            <Text style={{fontSize: 11}}>
+              This view has tooltip "Child View 1"
+            </Text>
+          </View>
+          <View tooltip="Child View 2">
+            <Text style={{fontSize: 11}}>
+              This view has tooltip "Child View 2"
+            </Text>
+          </View>
+        </View>
+      );
+    },
+  }, // ]TODO(macOS ISS#2323203)
+  {
     title: 'BackfaceVisibility',
     render: function() {
       return (
