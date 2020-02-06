--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\SliderExample.js"	2020-01-30 13:55:48.088612500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\SliderExample.js"	2020-01-29 14:10:09.187887900 -0800
@@ -130,21 +130,21 @@
   },
   {
     title: 'Custom thumb image',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render(): React.Element<any> {
       return <SliderExample thumbImage={require('./uie_thumb_big.png')} />;
     },
   },
   {
     title: 'Custom track image',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render(): React.Element<any> {
       return <SliderExample trackImage={require('./slider.png')} />;
     },
   },
   {
     title: 'Custom min/max track image',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render(): React.Element<any> {
       return (
         <SliderExample
