--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\SegmentedControlIOSExample.js"	2020-01-30 13:55:48.087609200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\SegmentedControlIOSExample.js"	2020-01-29 14:10:09.185886400 -0800
@@ -173,6 +173,7 @@
     render(): React.Element<any> {
       return <ColorSegmentedControlExample />;
     },
+    platform: 'ios',
   },
   {
     title: 'Change events can be detected',
