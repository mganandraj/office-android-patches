diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\YellowBox\\UI\\YellowBoxList.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\YellowBox\\UI\\YellowBoxList.js"
index 2620c35..d5caa06 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\YellowBox\\UI\\YellowBoxList.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\YellowBox\\UI\\YellowBoxList.js"
@@ -69,6 +69,7 @@ class YellowBoxList extends React.Component<Props, State> {
     }
 
     const listStyle = {
+      width: undefined,
       height:
         // Additional `0.5` so the (N + 1)th row can peek into view.
         Math.min(items.length, MAX_ITEMS + 0.5) *
