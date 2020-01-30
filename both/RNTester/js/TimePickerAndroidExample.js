diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/TimePickerAndroidExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/TimePickerAndroidExample.js
index 3e6cc29a0..28c25582b 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/TimePickerAndroidExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/TimePickerAndroidExample.js
@@ -44,9 +44,8 @@ class TimePickerAndroidExample extends React.Component {
         newState[stateKey + 'Text'] = 'dismissed';
       }
       this.setState(newState);
-      // Change here can go away once we sync to 0.57
-    } catch (err) {
-      console.warn(`Error in example '${stateKey}': `, err.message);
+    } catch ({code, message}) {
+      console.warn(`Error in example '${stateKey}': `, message);
     }
   };
 
