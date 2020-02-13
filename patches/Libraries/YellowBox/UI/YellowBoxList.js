--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\YellowBox\\UI\\YellowBoxList.js"	2020-01-30 13:55:48.027608900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\YellowBox\\UI\\YellowBoxList.js"	2020-01-29 14:10:09.032884000 -0800
@@ -69,6 +69,7 @@
     }
 
     const listStyle = {
+      width: undefined,
       height:
         // Additional `0.5` so the (N + 1)th row can peek into view.
         Math.min(items.length, MAX_ITEMS + 0.5) *
