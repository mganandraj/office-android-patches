diff --git a/E:/github/ms-react-native-forpatch/Libraries/YellowBox/UI/YellowBoxList.js b/E:/github/fb-react-native-forpatch/Libraries/YellowBox/UI/YellowBoxList.js
index d5caa06ee..2620c3585 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/YellowBox/UI/YellowBoxList.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/YellowBox/UI/YellowBoxList.js
@@ -69,7 +69,6 @@ class YellowBoxList extends React.Component<Props, State> {
     }
 
     const listStyle = {
-      width: undefined,
       height:
         // Additional `0.5` so the (N + 1)th row can peek into view.
         Math.min(items.length, MAX_ITEMS + 0.5) *
