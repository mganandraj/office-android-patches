diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\textinput\\ReactTextInputManager.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\textinput\\ReactTextInputManager.java"
index 2927ab9..a6652ed 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\textinput\\ReactTextInputManager.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\textinput\\ReactTextInputManager.java"
@@ -71,6 +71,9 @@ public class ReactTextInputManager extends BaseViewManager<ReactEditText, Layout
       Spacing.ALL, Spacing.LEFT, Spacing.RIGHT, Spacing.TOP, Spacing.BOTTOM,
   };
 
+  // Focus or blur call on native components (through NativeMethodsMixin) redirects to TextInputState.js
+  // which dispatches focusTextInput or blurTextInput commands. These commands are mapped to FOCUS_TEXT_INPUT=1
+  // and BLUR_TEXT_INPUT=2 in ReactTextInputManager, hence these constants value should be in sync with other ViewManagers.
   private static final int FOCUS_TEXT_INPUT = 1;
   private static final int BLUR_TEXT_INPUT = 2;
 
@@ -715,6 +718,11 @@ public class ReactTextInputManager extends BaseViewManager<ReactEditText, Layout
     view.setBorderStyle(borderStyle);
   }
 
+  @ReactProp(name = "showSoftInputOnFocus", defaultBoolean = true)
+  public void showKeyboardOnFocus(ReactEditText view, boolean showKeyboardOnFocus) {
+    view.setShowSoftInputOnFocus(showKeyboardOnFocus);
+  }
+
   @ReactPropGroup(names = {
       ViewProps.BORDER_WIDTH,
       ViewProps.BORDER_LEFT_WIDTH,
