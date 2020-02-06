--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\RCTNativeAnimatedModule.m"	2020-01-30 13:55:47.946611100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\RCTNativeAnimatedModule.m"	2020-01-29 14:10:08.943882200 -0800
@@ -268,13 +268,13 @@
   _preOperations = [NSMutableArray new];
   _operations = [NSMutableArray new];
 
-  [uiManager prependUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [uiManager prependUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     for (AnimatedOperation operation in preOperations) {
       operation(self->_nodesManager);
     }
   }];
 
-  [uiManager addUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [uiManager addUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     for (AnimatedOperation operation in operations) {
       operation(self->_nodesManager);
     }
