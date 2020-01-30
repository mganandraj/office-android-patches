diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/DatePickerAndroidExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/DatePickerAndroidExample.js
index 1b4f56b4d..23f16cb91 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/DatePickerAndroidExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/DatePickerAndroidExample.js
@@ -68,9 +68,8 @@ class DatePickerAndroidExample extends React.Component<Props, State> {
         newState[stateKey + 'Date'] = date;
       }
       this.setState(newState);
-      // Change here can go away once we sync to 0.57
-    } catch (err) {
-      console.warn(`Error in example '${stateKey}': `, err.message);
+    } catch ({code, message}) {
+      console.warn(`Error in example '${stateKey}': `, message);
     }
   };
 
