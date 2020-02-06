--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\Shared\\RNTesterTypes.js"	2020-01-30 13:55:48.088612500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\Shared\\RNTesterTypes.js"	2020-01-29 14:10:09.186887600 -0800
@@ -26,7 +26,7 @@
 
 export type RNTesterExampleModuleItem = $ReadOnly<{|
   title: string,
-  platform?: string,
+  platform?: string | Array<string>,
   description?: string,
   render: () => React.Node,
 |}>;
