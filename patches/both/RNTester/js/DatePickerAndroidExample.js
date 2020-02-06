--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerAndroidExample.js"	2020-01-30 13:55:48.075613000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerAndroidExample.js"	2020-01-29 14:10:09.168887000 -0800
@@ -68,8 +68,9 @@
         newState[stateKey + 'Date'] = date;
       }
       this.setState(newState);
-    } catch ({code, message}) {
-      console.warn(`Error in example '${stateKey}': `, message);
+      // Change here can go away once we sync to 0.57
+    } catch (err) {
+      console.warn(`Error in example '${stateKey}': `, err.message);
     }
   };
 
