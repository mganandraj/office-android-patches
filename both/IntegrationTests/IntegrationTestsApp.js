diff --git a/E:/github/ms-react-native-forpatch/IntegrationTests/IntegrationTestsApp.js b/E:/github/fb-react-native-forpatch/IntegrationTests/IntegrationTestsApp.js
index de3d6004b..d1f736bd7 100644
--- a/E:/github/ms-react-native-forpatch/IntegrationTests/IntegrationTestsApp.js
+++ b/E:/github/fb-react-native-forpatch/IntegrationTests/IntegrationTestsApp.js
@@ -25,15 +25,15 @@ const {
 // Keep this list in sync with RNTesterIntegrationTests.m
 const TESTS = [
   require('./IntegrationTestHarnessTest'),
-  //  require('./TimersTest'),
+  require('./TimersTest'),
   require('./AsyncStorageTest'),
+  require('./LayoutEventsTest'),
   require('./AppEventsTest'),
-  // require('./ImageCachePolicyTest'),
-  // require('./ImageSnapshotTest'),
-  // require('./LayoutEventsTest'),
   require('./SimpleSnapshotTest'),
-  require('./SyncMethodTest'),
+  require('./ImageCachePolicyTest'),
+  require('./ImageSnapshotTest'),
   require('./PromiseTest'),
+  require('./SyncMethodTest'),
   require('./WebSocketTest'),
   require('./AccessibilityManagerTest'),
 ];
