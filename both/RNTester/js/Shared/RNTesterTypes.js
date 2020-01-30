diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/Shared/RNTesterTypes.js b/E:/github/fb-react-native-forpatch/RNTester/js/Shared/RNTesterTypes.js
index 815802df6..e451ccde3 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/Shared/RNTesterTypes.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/Shared/RNTesterTypes.js
@@ -26,7 +26,7 @@ export type RNTesterProps = $ReadOnly<{|
 
 export type RNTesterExampleModuleItem = $ReadOnly<{|
   title: string,
-  platform?: string | Array<string>,
+  platform?: string,
   description?: string,
   render: () => React.Node,
 |}>;
