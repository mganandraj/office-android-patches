--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBaseTextInputViewManager.m"	2020-01-30 13:55:47.996608200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBaseTextInputViewManager.m"	2020-01-29 14:10:08.999885400 -0800
@@ -19,7 +19,9 @@
 
 #import "RCTBaseTextInputShadowView.h"
 #import "RCTBaseTextInputView.h"
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import "RCTConvert+Text.h"
+#endif // TODO(macOS ISS#2323203)
 
 @interface RCTBaseTextInputViewManager () <RCTUIManagerObserver>
 
@@ -34,26 +36,29 @@
 
 #pragma mark - Unified <TextInput> properties
 
-RCT_REMAP_VIEW_PROPERTY(autoCapitalize, backedTextInputView.autocapitalizationType, UITextAutocapitalizationType)
-RCT_REMAP_VIEW_PROPERTY(autoCorrect, backedTextInputView.autocorrectionType, UITextAutocorrectionType)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(autoCapitalize, backedTextInputView.autocapitalizationType, UITextAutocapitalizationType) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(autoCorrect, backedTextInputView.autocorrectionType, UITextAutocorrectionType) // TODO(macOS ISS#2323203)
+RCT_REMAP_OSX_VIEW_PROPERTY(autoCorrect, backedTextInputView.automaticTextReplacementEnabled, BOOL) // TODO(macOS ISS#2323203)
 RCT_REMAP_VIEW_PROPERTY(contextMenuHidden, backedTextInputView.contextMenuHidden, BOOL)
 RCT_REMAP_VIEW_PROPERTY(editable, backedTextInputView.editable, BOOL)
-RCT_REMAP_VIEW_PROPERTY(enablesReturnKeyAutomatically, backedTextInputView.enablesReturnKeyAutomatically, BOOL)
-RCT_REMAP_VIEW_PROPERTY(keyboardAppearance, backedTextInputView.keyboardAppearance, UIKeyboardAppearance)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(enablesReturnKeyAutomatically, backedTextInputView.enablesReturnKeyAutomatically, BOOL) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(keyboardAppearance, backedTextInputView.keyboardAppearance, UIKeyboardAppearance) // TODO(macOS ISS#2323203)
 RCT_REMAP_VIEW_PROPERTY(placeholder, backedTextInputView.placeholder, NSString)
 RCT_REMAP_VIEW_PROPERTY(placeholderTextColor, backedTextInputView.placeholderColor, UIColor)
-RCT_REMAP_VIEW_PROPERTY(returnKeyType, backedTextInputView.returnKeyType, UIReturnKeyType)
-RCT_REMAP_VIEW_PROPERTY(selectionColor, backedTextInputView.tintColor, UIColor)
-RCT_REMAP_VIEW_PROPERTY(spellCheck, backedTextInputView.spellCheckingType, UITextSpellCheckingType)
-RCT_REMAP_VIEW_PROPERTY(caretHidden, backedTextInputView.caretHidden, BOOL)
-RCT_REMAP_VIEW_PROPERTY(clearButtonMode, backedTextInputView.clearButtonMode, UITextFieldViewMode)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(returnKeyType, backedTextInputView.returnKeyType, UIReturnKeyType) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(secureTextEntry, backedTextInputView.secureTextEntry, BOOL) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(selectionColor, backedTextInputView.tintColor, UIColor) // TODO(macOS ISS#2323203)
+RCT_REMAP_OSX_VIEW_PROPERTY(selectionColor, backedTextInputView.selectionColor, UIColor) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(spellCheck, backedTextInputView.spellCheckingType, UITextSpellCheckingType) // TODO(macOS ISS#2323203)
+RCT_REMAP_OSX_VIEW_PROPERTY(spellCheck, backedTextInputView.automaticSpellingCorrectionEnabled, BOOL) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(caretHidden, backedTextInputView.caretHidden, BOOL) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(clearButtonMode, backedTextInputView.clearButtonMode, UITextFieldViewMode) // TODO(macOS ISS#2323203)
 RCT_REMAP_VIEW_PROPERTY(scrollEnabled, backedTextInputView.scrollEnabled, BOOL)
-RCT_EXPORT_VIEW_PROPERTY(secureTextEntry, BOOL)
 RCT_EXPORT_VIEW_PROPERTY(blurOnSubmit, BOOL)
-RCT_EXPORT_VIEW_PROPERTY(clearTextOnFocus, BOOL)
-RCT_EXPORT_VIEW_PROPERTY(keyboardType, UIKeyboardType)
+RCT_EXPORT_NOT_OSX_VIEW_PROPERTY(clearTextOnFocus, BOOL) // TODO(macOS ISS#2323203)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(keyboardType, backedTextInputView.keyboardType, UIKeyboardType) // TODO(macOS ISS#2323203)
 RCT_EXPORT_VIEW_PROPERTY(maxLength, NSNumber)
-RCT_EXPORT_VIEW_PROPERTY(selectTextOnFocus, BOOL)
+RCT_EXPORT_NOT_OSX_VIEW_PROPERTY(selectTextOnFocus, BOOL) // TODO(macOS ISS#2323203)
 RCT_EXPORT_VIEW_PROPERTY(selection, RCTTextSelection)
 RCT_EXPORT_VIEW_PROPERTY(inputAccessoryViewID, NSString)
 RCT_EXPORT_VIEW_PROPERTY(textContentType, NSString)
@@ -73,7 +78,9 @@
 - (RCTShadowView *)shadowView
 {
   RCTBaseTextInputShadowView *shadowView = [[RCTBaseTextInputShadowView alloc] initWithBridge:self.bridge];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   shadowView.textAttributes.fontSizeMultiplier = self.bridge.accessibilityManager.multiplier;
+#endif // TODO(macOS ISS#2323203)
   [_shadowViews addObject:shadowView];
   return shadowView;
 }
@@ -86,10 +93,12 @@
 
   [bridge.uiManager.observerCoordinator addObserver:self];
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(handleDidUpdateMultiplierNotification)
                                                name:RCTAccessibilityManagerDidUpdateMultiplierNotification
                                              object:bridge.accessibilityManager];
+#endif // TODO(macOS ISS#2323203)
 }
 
 - (void)dealloc
