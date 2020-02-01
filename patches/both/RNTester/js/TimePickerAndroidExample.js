diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\TimePickerAndroidExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\TimePickerAndroidExample.js"
index 28c2558..3e6cc29 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\TimePickerAndroidExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\TimePickerAndroidExample.js"
@@ -44,8 +44,9 @@ class TimePickerAndroidExample extends React.Component {
         newState[stateKey + 'Text'] = 'dismissed';
       }
       this.setState(newState);
-    } catch ({code, message}) {
-      console.warn(`Error in example '${stateKey}': `, message);
+      // Change here can go away once we sync to 0.57
+    } catch (err) {
+      console.warn(`Error in example '${stateKey}': `, err.message);
     }
   };
 
