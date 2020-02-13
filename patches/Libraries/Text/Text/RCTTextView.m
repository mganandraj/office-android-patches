--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextView.m"	2020-01-30 13:55:47.990609500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextView.m"	2020-01-29 14:10:08.995883600 -0800
@@ -7,13 +7,17 @@
 
 #import "RCTTextView.h"
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/UTCoreTypes.h>
+#else
+#import <Quartz/Quartz.h> // TODO(macOS ISS#2323203) for CATiledLayer
+#endif // TODO(macOS ISS#2323203)
 
+#import <React/RCTAssert.h> // TODO(macOS ISS#2323203)
 #import <React/RCTUtils.h>
 #import <React/UIView+React.h>
 
 #import "RCTTextShadowView.h"
-#import "RCTTextRenderer.h"
 
 @interface RCTTextTiledLayer : CATiledLayer
 
@@ -28,35 +32,58 @@
 
 @end
 
+#import <QuartzCore/QuartzCore.h> // TODO(macOS ISS#2323203)
+
 @implementation RCTTextView
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UILongPressGestureRecognizer *_longPressGestureRecognizer;
+#endif // TODO(macOS ISS#2323203)
 
-  NSArray<UIView *> *_Nullable _descendantViews;
+  CAShapeLayer *_highlightLayer;
+  NSArray<RCTUIView *> *_Nullable _descendantViews; // TODO(macOS ISS#3536887)
   NSTextStorage *_Nullable _textStorage;
   CGRect _contentFrame;
-  RCTTextRenderer *_renderer;
-  // For small amount of text avoid the overhead of CATiledLayer and
-  // make render text synchronously. For large amount of text, use
-  // CATiledLayer to chunk text rendering and avoid linear memory
-  // usage.
-  CALayer *_Nullable _syncLayer;
-  RCTTextTiledLayer *_Nullable _asyncTiledLayer;
-  CAShapeLayer *_highlightLayer;
 }
 
 - (instancetype)initWithFrame:(CGRect)frame
 {
   if (self = [super initWithFrame:frame]) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     self.isAccessibilityElement = YES;
     self.accessibilityTraits |= UIAccessibilityTraitStaticText;
+#else // [TODO(macOS ISS#2323203)
+    self.accessibilityRole = NSAccessibilityStaticTextRole;
+#endif // ]TODO(macOS ISS#2323203)
     self.opaque = NO;
-    self.contentMode = UIViewContentModeRedraw;
-    _renderer = [RCTTextRenderer new];
+    RCTUIViewSetContentModeRedraw(self); // TODO(macOS ISS#2323203) and TODO(macOS ISS#3536887)
   }
   return self;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (BOOL)canBecomeKeyView
+{
+	// RCTText should not get any keyboard focus unless its `selectable` prop is true
+	return _selectable;
+}
+
+- (BOOL)enableFocusRing
+{
+  return _selectable;
+}
+
+- (void)drawFocusRingMask {
+  if ([self enableFocusRing]) {
+    NSRectFill([self bounds]);
+  }
+}
+
+- (NSRect)focusRingMaskBounds {
+  return [self bounds];
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 - (NSString *)description
 {
   NSString *superDescription = super.description;
@@ -73,23 +100,26 @@
 
   _selectable = selectable;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (_selectable) {
     [self enableContextMenu];
   }
   else {
     [self disableContextMenu];
   }
+#endif // TODO(macOS ISS#2323203)
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)reactSetFrame:(CGRect)frame
 {
   // Text looks super weird if its frame is animated.
   // This disables the frame animation, without affecting opacity, etc.
   [UIView performWithoutAnimation:^{
     [super reactSetFrame:frame];
-    [self configureLayer];
   }];
 }
+#endif // TODO(macOS ISS#2323203)
 
 - (void)didUpdateReactSubviews
 {
@@ -98,81 +128,51 @@
 
 - (void)setTextStorage:(NSTextStorage *)textStorage
           contentFrame:(CGRect)contentFrame
-       descendantViews:(NSArray<UIView *> *)descendantViews
+       descendantViews:(NSArray<RCTUIView *> *)descendantViews // TODO(macOS ISS#3536887)
 {
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  // On macOS when a large number of flex layouts are being performed, such
+  // as when a window is being resized, AppKit can throw an uncaught exception
+  // (-[NSConcretePointerArray pointerAtIndex:]: attempt to access pointer at index ...)
+  // during the dealloc of NSLayoutManager.  The _textStorage and its
+  // associated NSLayoutManager dealloc later in an autorelease pool.
+  // Manually removing the layout manager from _textStorage prior to release
+  // works around this issue in AppKit.
+  NSArray<NSLayoutManager *> *managers = [_textStorage layoutManagers];
+  for (NSLayoutManager *manager in managers) {
+    [_textStorage removeLayoutManager:manager];
+  }
+#endif // ]TODO(macOS ISS#2323203)
+
   _textStorage = textStorage;
   _contentFrame = contentFrame;
 
   // FIXME: Optimize this.
-  for (UIView *view in _descendantViews) {
+  for (RCTUIView *view in _descendantViews) { // TODO(macOS ISS#3536887)
     [view removeFromSuperview];
   }
 
   _descendantViews = descendantViews;
 
-  for (UIView *view in descendantViews) {
+  for (RCTUIView *view in descendantViews) { // TODO(macOS ISS#3536887)
     [self addSubview:view];
   }
 
-  [_renderer setTextStorage:textStorage contentFrame:contentFrame];
-  [self configureLayer];
-  [self setCurrentLayerNeedsDisplay];
+  [self setNeedsDisplay];
 }
 
-- (void)configureLayer
+- (void)drawRect:(CGRect)rect
 {
   if (!_textStorage) {
     return;
   }
 
-  CALayer *currentLayer;
-
-  CGSize screenSize = RCTScreenSize();
-  CGFloat textViewTileSize =  MAX(screenSize.width, screenSize.height) * 1.5;
-
-  if (self.frame.size.width > textViewTileSize || self.frame.size.height > textViewTileSize) {
-    // Cleanup sync layer
-    if (_syncLayer != nil) {
-      _syncLayer.delegate = nil;
-      [_syncLayer removeFromSuperlayer];
-      _syncLayer = nil;
-    }
-
-    if (_asyncTiledLayer == nil) {
-      RCTTextTiledLayer *layer = [RCTTextTiledLayer layer];
-      layer.delegate = _renderer;
-      layer.contentsScale = RCTScreenScale();
-      layer.tileSize = CGSizeMake(textViewTileSize, textViewTileSize);
-      _asyncTiledLayer = layer;
-      [self.layer addSublayer:layer];
-      [layer setNeedsDisplay];
-    }
-    _asyncTiledLayer.frame = self.bounds;
-    currentLayer = _asyncTiledLayer;
-  } else {
-    // Cleanup async tiled layer
-    if (_asyncTiledLayer != nil) {
-      _asyncTiledLayer.delegate = nil;
-      [_asyncTiledLayer removeFromSuperlayer];
-      _asyncTiledLayer = nil;
-    }
-
-    if (_syncLayer == nil) {
-      CALayer *layer = [CALayer layer];
-      layer.delegate = _renderer;
-      layer.contentsScale = RCTScreenScale();
-      _syncLayer = layer;
-      [self.layer addSublayer:layer];
-      [layer setNeedsDisplay];
-    }
-    _syncLayer.frame = self.bounds;
-    currentLayer = _syncLayer;
-  }
-
   NSLayoutManager *layoutManager = _textStorage.layoutManagers.firstObject;
   NSTextContainer *textContainer = layoutManager.textContainers.firstObject;
-  NSRange glyphRange =
-    [layoutManager glyphRangeForTextContainer:textContainer];
+  
+  NSRange glyphRange = [layoutManager glyphRangeForTextContainer:textContainer];
+  [layoutManager drawBackgroundForGlyphRange:glyphRange atPoint:_contentFrame.origin];
+  [layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:_contentFrame.origin];
 
   __block UIBezierPath *highlightPath = nil;
   NSRange characterRange = [layoutManager characterRangeForGlyphRange:glyphRange
@@ -182,52 +182,44 @@
                            inRange:characterRange
                            options:0
                         usingBlock:
-   ^(NSNumber *value, NSRange range, __unused BOOL *stop) {
-     if (!value.boolValue) {
-       return;
-     }
-
-     [layoutManager enumerateEnclosingRectsForGlyphRange:range
-                                withinSelectedGlyphRange:range
-                                         inTextContainer:textContainer
-                                              usingBlock:
-      ^(CGRect enclosingRect, __unused BOOL *anotherStop) {
+    ^(NSNumber *value, NSRange range, __unused BOOL *stop) {
+      if (!value.boolValue) {
+        return;
+      }
+
+      [layoutManager enumerateEnclosingRectsForGlyphRange:range
+                                 withinSelectedGlyphRange:range
+                                          inTextContainer:textContainer
+                                               usingBlock:
+        ^(CGRect enclosingRect, __unused BOOL *anotherStop) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#3536887)
         UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(enclosingRect, -2, -2) cornerRadius:2];
-        if (highlightPath) {
-          [highlightPath appendPath:path];
-        } else {
-          highlightPath = path;
+#else // TODO(macOS ISS#3536887)
+        NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:CGRectInset(enclosingRect, -2, -2) xRadius:2 yRadius:2];
+#endif // TODO(macOS ISS#3536887)
+          if (highlightPath) {
+            UIBezierPathAppendPath(highlightPath, path); // TODO(macOS ISS#2323203)
+          } else {
+            highlightPath = path;
+          }
         }
-      }
       ];
-   }];
+  }];
 
   if (highlightPath) {
     if (!_highlightLayer) {
       _highlightLayer = [CAShapeLayer layer];
-      _highlightLayer.fillColor = [UIColor colorWithWhite:0 alpha:0.25].CGColor;
-    }
-    if (![currentLayer.sublayers containsObject:_highlightLayer]) {
-      [currentLayer addSublayer:_highlightLayer];
+      _highlightLayer.fillColor = [RCTUIColor colorWithWhite:0 alpha:0.25].CGColor; // TODO(OSS Candidate ISS#2710739)
+      [self.layer addSublayer:_highlightLayer];
     }
     _highlightLayer.position = _contentFrame.origin;
-    _highlightLayer.path = highlightPath.CGPath;
+    _highlightLayer.path = UIBezierPathCreateCGPathRef(highlightPath); // TODO(macOS ISS#2323203)
   } else {
     [_highlightLayer removeFromSuperlayer];
     _highlightLayer = nil;
   }
 }
 
-- (void)setCurrentLayerNeedsDisplay
-{
-  if (_asyncTiledLayer != nil) {
-    [_asyncTiledLayer setNeedsDisplay];
-  } else if (_syncLayer != nil) {
-    [_syncLayer setNeedsDisplay];
-  }
-  [_highlightLayer setNeedsDisplay];
-}
-
 - (NSNumber *)reactTagAtPoint:(CGPoint)point
 {
   NSNumber *reactTag = self.reactTag;
@@ -252,18 +244,14 @@
 {
   [super didMoveToWindow];
 
-  // When an `RCTText` instance moves offscreen (possibly due to parent clipping),
-  // we unset the layer's contents until it comes onscreen again.
   if (!self.window) {
-    [_syncLayer removeFromSuperlayer];
-    _syncLayer = nil;
-    [_asyncTiledLayer removeFromSuperlayer];
-    _asyncTiledLayer = nil;
-    [_highlightLayer removeFromSuperlayer];
-    _highlightLayer = nil;
+    self.layer.contents = nil;
+    if (_highlightLayer) {
+      [_highlightLayer removeFromSuperlayer];
+      _highlightLayer = nil;
+    }
   } else if (_textStorage) {
-    [self configureLayer];
-    [self setCurrentLayerNeedsDisplay];
+    [self setNeedsDisplay];
   }
 }
 
@@ -280,6 +268,7 @@
 
 #pragma mark - Context Menu
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)enableContextMenu
 {
   _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
@@ -294,7 +283,8 @@
 
 - (void)handleLongPress:(UILongPressGestureRecognizer *)gesture
 {
-#if !TARGET_OS_TV
+  // TODO: Adopt showMenuFromRect (necessary for UIKitForMac)
+#if !TARGET_OS_TV && !TARGET_OS_UIKITFORMAC
   UIMenuController *menuController = [UIMenuController sharedMenuController];
 
   if (menuController.isMenuVisible) {
@@ -309,12 +299,48 @@
   [menuController setMenuVisible:YES animated:YES];
 #endif
 }
+#else // [TODO(macOS ISS#2323203)
+
+- (void)rightMouseDown:(NSEvent *)event
+{
+  if (_selectable == NO) {
+    [super rightMouseDown:event];
+    return;
+  }
+  NSText *fieldEditor = [self.window fieldEditor:YES forObject:self];
+  NSMenu *fieldEditorMenu = [fieldEditor menuForEvent:event];
+
+  RCTAssert(fieldEditorMenu, @"Unable to obtain fieldEditor's context menu");
+
+  if (fieldEditorMenu) {
+    NSMenu *menu = [[NSMenu alloc] initWithTitle:@""];
+
+    for (NSMenuItem *fieldEditorMenuItem in fieldEditorMenu.itemArray) {
+      if (fieldEditorMenuItem.action == @selector(copy:)) {
+        NSMenuItem *item = [fieldEditorMenuItem copy];
+
+        item.target = self;
+        [menu addItem:item];
+
+        break;
+      }
+    }
+
+    RCTAssert(menu.numberOfItems > 0, @"Unable to create context menu with \"Copy\" item");
+
+    if (menu.numberOfItems > 0) {
+      [NSMenu popUpContextMenu:menu withEvent:event forView:self];
+    }
+  }
+}
+#endif // ]TODO(macOS ISS#2323203)
 
 - (BOOL)canBecomeFirstResponder
 {
   return _selectable;
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (BOOL)canPerformAction:(SEL)action withSender:(id)sender
 {
   if (_selectable && action == @selector(copy:)) {
@@ -323,17 +349,18 @@
 
   return [self.nextResponder canPerformAction:action withSender:sender];
 }
+#endif // TODO(macOS ISS#2323203)
 
 - (void)copy:(id)sender
 {
 #if !TARGET_OS_TV
   NSAttributedString *attributedText = _textStorage;
 
-  NSMutableDictionary *item = [NSMutableDictionary new];
-
   NSData *rtf = [attributedText dataFromRange:NSMakeRange(0, attributedText.length)
                            documentAttributes:@{NSDocumentTypeDocumentAttribute: NSRTFDTextDocumentType}
                                         error:nil];
+#if TARGET_OS_IPHONE // TODO(macOS ISS#2323203)
+  NSMutableDictionary *item = [NSMutableDictionary new]; // TODO(macOS ISS#2323203)
 
   if (rtf) {
     [item setObject:rtf forKey:(id)kUTTypeFlatRTFD];
@@ -343,6 +370,11 @@
 
   UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
   pasteboard.items = @[item];
+#elif TARGET_OS_OSX // TODO(macOS ISS#2323203)
+  NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
+  [pasteboard clearContents];
+  [pasteboard writeObjects:[NSArray arrayWithObjects:attributedText.string, rtf, nil]];
+#endif // TODO(macOS ISS#2323203)
 #endif
 }
 
