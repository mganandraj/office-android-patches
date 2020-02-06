--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ActionSheetIOS\\RCTActionSheetManager.m"	2020-01-30 13:55:47.826578300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ActionSheetIOS\\RCTActionSheetManager.m"	2020-01-29 14:10:08.802912100 -0800
@@ -13,7 +13,12 @@
 #import <React/RCTUIManager.h>
 #import <React/RCTUtils.h>
 
-@interface RCTActionSheetManager () <UIActionSheetDelegate>
+@interface RCTActionSheetManager ()
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+<UIActionSheetDelegate>
+#else
+<NSSharingServicePickerDelegate>
+#endif // ]TODO(macOS ISS#2323203)
 @end
 
 @implementation RCTActionSheetManager
@@ -21,6 +26,12 @@
   // Use NSMapTable, as UIAlertViews do not implement <NSCopying>
   // which is required for NSDictionary keys
   NSMapTable *_callbacks;
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  NSArray<NSSharingService*> *_excludedActivities;
+  NSString *_sharingSubject;
+  RCTResponseErrorBlock _failureCallback;
+  RCTResponseSenderBlock _successCallback;
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_MODULE()
@@ -32,6 +43,7 @@
   return dispatch_get_main_queue();
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)presentViewController:(UIViewController *)alertController
        onParentViewController:(UIViewController *)parentViewController
                 anchorViewTag:(NSNumber *)anchorViewTag
@@ -48,45 +60,53 @@
   alertController.popoverPresentationController.sourceRect = sourceView.bounds;
   [parentViewController presentViewController:alertController animated:YES completion:nil];
 }
+#endif // TODO(macOS ISS#2323203)
 
 RCT_EXPORT_METHOD(showActionSheetWithOptions:(NSDictionary *)options
                   callback:(RCTResponseSenderBlock)callback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (RCTRunningInAppExtension()) {
     RCTLogError(@"Unable to show action sheet from app extension");
     return;
   }
+#endif // TODO(macOS ISS#2323203)
 
   if (!_callbacks) {
     _callbacks = [NSMapTable strongToStrongObjectsMapTable];
   }
 
   NSString *title = [RCTConvert NSString:options[@"title"]];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   NSString *message = [RCTConvert NSString:options[@"message"]];
+#endif // TODO(macOS ISS#2323203)
   NSArray<NSString *> *buttons = [RCTConvert NSStringArray:options[@"options"]];
   NSInteger cancelButtonIndex = options[@"cancelButtonIndex"] ? [RCTConvert NSInteger:options[@"cancelButtonIndex"]] : -1;
   NSArray<NSNumber *> *destructiveButtonIndices;
   if ([options[@"destructiveButtonIndex"] isKindOfClass:[NSArray class]]) {
     destructiveButtonIndices = [RCTConvert NSArray:options[@"destructiveButtonIndex"]];
   } else {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     NSNumber *destructiveButtonIndex = options[@"destructiveButtonIndex"] ? [RCTConvert NSNumber:options[@"destructiveButtonIndex"]] : @-1;
     destructiveButtonIndices = @[destructiveButtonIndex];
+#endif // TODO(macOS ISS#2323203)
   }
-
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIViewController *controller = RCTPresentedViewController();
 
   if (controller == nil) {
     RCTLogError(@"Tried to display action sheet but there is no application window. options: %@", options);
     return;
   }
-
+#endif // TODO(macOS ISS#2323203)
   /*
    * The `anchor` option takes a view to set as the anchor for the share
    * popup to point to, on iPads running iOS 8. If it is not passed, it
    * defaults to centering the share popup on screen without any arrows.
    */
   NSNumber *anchorViewTag = [RCTConvert NSNumber:options[@"anchor"]];
-  
+
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIAlertController *alertController =
   [UIAlertController alertControllerWithTitle:title
                                       message:message
@@ -113,16 +133,52 @@
 
   alertController.view.tintColor = [RCTConvert UIColor:options[@"tintColor"]];
   [self presentViewController:alertController onParentViewController:controller anchorViewTag:anchorViewTag];
+
+#else // [TODO(macOS ISS#2323203)
+  NSMenu *menu = [[NSMenu alloc] initWithTitle:title ?: @""];
+  [_callbacks setObject:callback forKey:menu];
+  for (NSInteger index = 0; index < buttons.count; index++) {
+    if (index == cancelButtonIndex) {
+      //NSMenu doesn't require a cancel button
+      continue;
+    }
+    
+    NSString *option = buttons[index];
+    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:option action:@selector(menuItemDidTap:) keyEquivalent:@""];
+    item.tag = index;
+    item.target = self;
+    [menu addItem:item];
+  }
+  
+  NSPoint origin = NSZeroPoint;
+  NSEvent *event = nil;
+  RCTPlatformView *view = nil;
+  if (anchorViewTag) {
+    view = [self.bridge.uiManager viewForReactTag:anchorViewTag];
+    event = [view.window currentEvent];
+  }
+  if (event && view) {
+    origin = [view convertPoint:[event locationInWindow] fromView:nil];
+  } else if (view) {
+    origin = NSMakePoint(NSMidX(view.superview.frame), NSMidY(view.superview.frame));
+  } else {
+    origin = [NSEvent mouseLocation];
+  }
+  
+  [menu popUpMenuPositioningItem:menu.itemArray.firstObject atLocation:origin inView:view.superview];
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(showShareActionSheetWithOptions:(NSDictionary *)options
                   failureCallback:(RCTResponseErrorBlock)failureCallback
                   successCallback:(RCTResponseSenderBlock)successCallback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (RCTRunningInAppExtension()) {
     RCTLogError(@"Unable to show action sheet from app extension");
     return;
   }
+#endif // TODO(macOS ISS#2323203)
 
   NSMutableArray<id> *items = [NSMutableArray array];
   NSString *message = [RCTConvert NSString:options[@"message"]];
@@ -150,6 +206,7 @@
     return;
   }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIActivityViewController *shareController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
 
   NSString *subject = [RCTConvert NSString:options[@"subject"]];
@@ -173,8 +230,80 @@
 
   NSNumber *anchorViewTag = [RCTConvert NSNumber:options[@"anchor"]];
   shareController.view.tintColor = [RCTConvert UIColor:options[@"tintColor"]];
-  
   [self presentViewController:shareController onParentViewController:controller anchorViewTag:anchorViewTag];
+#else // [TODO(macOS ISS#2323203)
+  NSMutableArray<NSSharingService*> *excludedTypes = [NSMutableArray array];
+  for (NSString *excludeActivityType in [RCTConvert NSStringArray:options[@"excludedActivityTypes"]]) {
+    NSSharingService *sharingService = [NSSharingService sharingServiceNamed:excludeActivityType];
+    if (sharingService) {
+      [excludedTypes addObject:sharingService];
+    }
+  }
+  _excludedActivities = excludedTypes.copy;
+  _sharingSubject = [RCTConvert NSString:options[@"subject"]];
+  _failureCallback = failureCallback;
+  _successCallback = successCallback;
+  RCTPlatformView *view = nil;
+  NSNumber *anchorViewTag = [RCTConvert NSNumber:options[@"anchor"]];
+  if (anchorViewTag) {
+    view = [self.bridge.uiManager viewForReactTag:anchorViewTag];
+  }
+  NSView *contentView = view ?: NSApp.keyWindow.contentView;
+  NSSharingServicePicker *picker = [[NSSharingServicePicker alloc] initWithItems:items];
+  picker.delegate = self;
+  [picker showRelativeToRect:contentView.bounds ofView:contentView preferredEdge:0];
+#endif // ]TODO(macOS ISS#2323203)
+}
+
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+
+#pragma mark - NSSharingServicePickerDelegate methods
+
+- (void)menuItemDidTap:(NSMenuItem*)menuItem
+{
+  NSMenu *actionSheet = menuItem.menu;
+  NSInteger buttonIndex = menuItem.tag;
+  RCTResponseSenderBlock callback = [_callbacks objectForKey:actionSheet];
+  if (callback) {
+    callback(@[@(buttonIndex)]);
+    [_callbacks removeObjectForKey:actionSheet];
+  } else {
+    RCTLogWarn(@"No callback registered for action sheet: %@", actionSheet.title);
+  }
 }
 
+- (void)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker didChooseSharingService:(NSSharingService *)service
+{
+  if (service){
+    service.subject = _sharingSubject;
+  }
+}
+  
+- (void)sharingService:(NSSharingService *)sharingService didFailToShareItems:(NSArray *)items error:(NSError *)error
+{
+  _failureCallback(error);
+}
+
+- (void)sharingService:(NSSharingService *)sharingService didShareItems:(NSArray *)items
+{
+  NSRange range = [sharingService.description rangeOfString:@"\\[com.apple.share.*\\]" options:NSRegularExpressionSearch];
+  if (range.location == NSNotFound) {
+    _successCallback(@[@NO, (id)kCFNull]);
+    return;
+  }
+  range.location++; // Start after [
+  range.length -= 2; // Remove both [ and ]
+  NSString *activityType = [sharingService.description substringWithRange:range];
+  _successCallback(@[@YES, RCTNullIfNil(activityType)]);
+}
+  
+- (NSArray<NSSharingService *> *)sharingServicePicker:(__unused NSSharingServicePicker *)sharingServicePicker sharingServicesForItems:(__unused NSArray *)items proposedSharingServices:(NSArray<NSSharingService *> *)proposedServices
+{
+  return [proposedServices filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSSharingService *service, __unused NSDictionary<NSString *,id> * _Nullable bindings) {
+    return ![self->_excludedActivities containsObject:service];
+  }]];
+}
+  
+#endif // ]TODO(macOS ISS#2323203)
+  
 @end
