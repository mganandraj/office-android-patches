diff --git "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\AsyncStorageTest.js" "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\AsyncStorageTest.js"
index d22a611..e1a4de7 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\AsyncStorageTest.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\AsyncStorageTest.js"
@@ -137,18 +137,23 @@ function testRemoveItem() {
 }
 
 function testMerge() {
-  AsyncStorage.setItem(KEY_MERGE, JSON.stringify(VAL_MERGE_1), err1 => {
-    expectAsyncNoError('testMerge/setItem', err1);
-    AsyncStorage.mergeItem(KEY_MERGE, JSON.stringify(VAL_MERGE_2), err2 => {
-      expectAsyncNoError('testMerge/mergeItem', err2);
-      AsyncStorage.getItem(KEY_MERGE, (err3, result) => {
-        expectAsyncNoError('testMerge/setItem', err3);
-        expectEqual(JSON.parse(result), VAL_MERGE_EXPECT, 'testMerge');
-        updateMessage('objects deeply merged\nDone!');
-        runTestCase('multi set and get', testOptimizedMultiGet);
+  if (AsyncStorage.mergeItem) {
+    AsyncStorage.setItem(KEY_MERGE, JSON.stringify(VAL_MERGE_1), err1 => {
+      expectAsyncNoError('testMerge/setItem', err1);
+      AsyncStorage.mergeItem(KEY_MERGE, JSON.stringify(VAL_MERGE_2), err2 => {
+        expectAsyncNoError('testMerge/mergeItem', err2);
+        AsyncStorage.getItem(KEY_MERGE, (err3, result) => {
+          expectAsyncNoError('testMerge/setItem', err3);
+          expectEqual(JSON.parse(result), VAL_MERGE_EXPECT, 'testMerge');
+          updateMessage('objects deeply merged\nDone!');
+          runTestCase('multi set and get', testOptimizedMultiGet);
+        });
       });
     });
-  });
+  } else {
+    updateMessage('AsyncStorage does not support the mergeItem method');
+    runTestCase('multi set and get', testOptimizedMultiGet);
+  }
 }
 
 function testOptimizedMultiGet() {
