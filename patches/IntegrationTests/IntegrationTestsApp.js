--- "e:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\IntegrationTestsApp.js"	2020-01-30 13:55:47.809606400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\IntegrationTests\\IntegrationTestsApp.js"	2020-01-29 14:10:08.789911700 -0800
@@ -25,15 +25,15 @@
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
