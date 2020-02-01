diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\Shared\\RNTesterTypes.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\Shared\\RNTesterTypes.js"
index e451ccd..815802d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\Shared\\RNTesterTypes.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\Shared\\RNTesterTypes.js"
@@ -26,7 +26,7 @@ export type RNTesterProps = $ReadOnly<{|
 
 export type RNTesterExampleModuleItem = $ReadOnly<{|
   title: string,
-  platform?: string,
+  platform?: string | Array<string>,
   description?: string,
   render: () => React.Node,
 |}>;
