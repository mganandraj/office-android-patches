diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\SegmentedControlIOSExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\SegmentedControlIOSExample.js"
index 64a277d..d6e69fc 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\SegmentedControlIOSExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\SegmentedControlIOSExample.js"
@@ -173,6 +173,7 @@ exports.examples = [
     render(): React.Element<any> {
       return <ColorSegmentedControlExample />;
     },
+    platform: 'ios',
   },
   {
     title: 'Change events can be detected',
