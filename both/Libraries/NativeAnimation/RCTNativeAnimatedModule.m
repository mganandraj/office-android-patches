diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedModule.m b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedModule.m
index 08deab3e5..69bf078f8 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedModule.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedModule.m
@@ -268,13 +268,13 @@ RCT_EXPORT_METHOD(removeAnimatedEventFromView:(nonnull NSNumber *)viewTag
   _preOperations = [NSMutableArray new];
   _operations = [NSMutableArray new];
 
-  [uiManager prependUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [uiManager prependUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     for (AnimatedOperation operation in preOperations) {
       operation(self->_nodesManager);
     }
   }];
 
-  [uiManager addUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [uiManager addUIBlock:^(__unused RCTUIManager *manager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     for (AnimatedOperation operation in operations) {
       operation(self->_nodesManager);
     }
