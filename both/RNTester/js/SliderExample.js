diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/SliderExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/SliderExample.js
index 1d5da71f3..5ca17c2ba 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/SliderExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/SliderExample.js
@@ -130,21 +130,21 @@ exports.examples = [
   },
   {
     title: 'Custom thumb image',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render(): React.Element<any> {
       return <SliderExample thumbImage={require('./uie_thumb_big.png')} />;
     },
   },
   {
     title: 'Custom track image',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render(): React.Element<any> {
       return <SliderExample trackImage={require('./slider.png')} />;
     },
   },
   {
     title: 'Custom min/max track image',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render(): React.Element<any> {
       return (
         <SliderExample
