--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\TimePickerAndroidExample.js"	2020-01-30 13:55:48.094612700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\TimePickerAndroidExample.js"	2020-01-29 14:10:09.196886800 -0800
@@ -44,8 +44,9 @@
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
 
