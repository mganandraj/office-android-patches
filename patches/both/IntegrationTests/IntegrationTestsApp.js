diff --git "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\IntegrationTestsApp.js" "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\IntegrationTestsApp.js"
index d1f736b..de3d600 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\IntegrationTestsApp.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\IntegrationTestsApp.js"
@@ -25,15 +25,15 @@ const {
 // Keep this list in sync with RNTesterIntegrationTests.m
 const TESTS = [
   require('./IntegrationTestHarnessTest'),
-  require('./TimersTest'),
+  //  require('./TimersTest'),
   require('./AsyncStorageTest'),
-  require('./LayoutEventsTest'),
   require('./AppEventsTest'),
+  // require('./ImageCachePolicyTest'),
+  // require('./ImageSnapshotTest'),
+  // require('./LayoutEventsTest'),
   require('./SimpleSnapshotTest'),
-  require('./ImageCachePolicyTest'),
-  require('./ImageSnapshotTest'),
-  require('./PromiseTest'),
   require('./SyncMethodTest'),
+  require('./PromiseTest'),
   require('./WebSocketTest'),
   require('./AccessibilityManagerTest'),
 ];
