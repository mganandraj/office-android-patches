diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/view/ReactViewManager.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/view/ReactViewManager.java
index ff450ee51..69dce0166 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/view/ReactViewManager.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/view/ReactViewManager.java
@@ -10,9 +10,7 @@ package com.facebook.react.views.view;
 import android.annotation.TargetApi;
 import android.graphics.Rect;
 import android.os.Build;
-import android.view.FocusFinder;
 import android.view.View;
-import android.view.ViewGroup;
 import com.facebook.react.bridge.JSApplicationIllegalArgumentException;
 import com.facebook.react.bridge.ReactContext;
 import com.facebook.react.bridge.ReadableArray;
@@ -34,7 +32,6 @@ import com.facebook.yoga.YogaConstants;
 import java.util.Locale;
 import java.util.Map;
 import javax.annotation.Nullable;
-import javax.annotation.Nonnull;
 
 /**
  * View manager for AndroidViews (plain React Views).
@@ -54,14 +51,13 @@ public class ReactViewManager extends ViewGroupManager<ReactViewGroup> {
     Spacing.START,
     Spacing.END,
   };
+  private static final int CMD_HOTSPOT_UPDATE = 1;
+  private static final int CMD_SET_PRESSED = 2;
 
-  // Focus or blur call on native components (through NativeMethodsMixin) redirects to TextInputState.js
-  // which dispatches focusTextInput or blurTextInput commands. These commands are mapped to FOCUS_TEXT_INPUT=1
-  // and BLUR_TEXT_INPUT=2 in ReactTextInputManager, hence these constants value should be in sync with ReactTextInputManager.
-  private static final int FOCUS_TEXT_INPUT = 1;
-  private static final int BLUR_TEXT_INPUT = 2;
-  private static final int CMD_HOTSPOT_UPDATE = 3;
-  private static final int CMD_SET_PRESSED = 4;
+  @ReactProp(name = "accessible")
+  public void setAccessible(ReactViewGroup view, boolean accessible) {
+    view.setFocusable(accessible);
+  }
 
   @ReactProp(name = "hasTVPreferredFocus")
   public void setTVPreferredFocus(ReactViewGroup view, boolean hasTVPreferredFocus) {
@@ -126,35 +122,6 @@ public class ReactViewManager extends ViewGroupManager<ReactViewGroup> {
     }
   }
 
-  @Nullable
-  @Override
-  public Map<String, Object> getExportedCustomBubblingEventTypeConstants() {
-    return MapBuilder.<String, Object>builder()
-      .put(
-        "topOnFocusChange",
-        MapBuilder.of(
-          "phasedRegistrationNames",
-          MapBuilder.of("bubbled", "onFocusChange")))
-      .build();
-  }
-
-  @Override
-  protected void addEventEmitters(
-    final ThemedReactContext reactContext,
-    final ReactViewGroup reactViewGroup) {
-    reactViewGroup.setOnFocusChangeListener(
-      new View.OnFocusChangeListener() {
-        @Override
-        public void onFocusChange(View v, boolean hasFocus) {
-          EventDispatcher eventDispatcher =
-            reactContext.getNativeModule(UIManagerModule.class).getEventDispatcher();
-            eventDispatcher.dispatchEvent(
-              new ReactViewFocusEvent(reactViewGroup.getId(), hasFocus));
-        }
-      }
-    );
-  }
-
   @ReactProp(name = "borderStyle")
   public void setBorderStyle(ReactViewGroup view, @Nullable String borderStyle) {
     view.setBorderStyle(borderStyle);
@@ -314,7 +281,7 @@ public class ReactViewManager extends ViewGroupManager<ReactViewGroup> {
 
   @Override
   public Map<String, Integer> getCommandsMap() {
-    return MapBuilder.of("focusTextInput", FOCUS_TEXT_INPUT, "blurTextInput", BLUR_TEXT_INPUT, "hotspotUpdate", CMD_HOTSPOT_UPDATE, "setPressed", CMD_SET_PRESSED);
+    return MapBuilder.of("hotspotUpdate", CMD_HOTSPOT_UPDATE, "setPressed", CMD_SET_PRESSED);
   }
 
   @Override
@@ -340,14 +307,6 @@ public class ReactViewManager extends ViewGroupManager<ReactViewGroup> {
         root.setPressed(args.getBoolean(0));
         break;
       }
-      case FOCUS_TEXT_INPUT: {
-        root.requestFocus();
-        break;
-      }
-      case BLUR_TEXT_INPUT: {
-        root.clearFocus();
-        break;
-      }
     }
   }
 
@@ -391,44 +350,10 @@ public class ReactViewManager extends ViewGroupManager<ReactViewGroup> {
       }
       parent.removeViewWithSubviewClippingEnabled(child);
     } else {
-      // Prevent focus leaks due to removal of a focused View
-      if (parent.getChildAt(index).hasFocus()) {
-        giveFocusToAppropriateView(parent, parent.getChildAt(index));
-      }
       parent.removeViewAt(index);
     }
   }
 
-  private void giveFocusToAppropriateView(@Nonnull ViewGroup parent, @Nonnull View focusedView) {
-    // Search for appropriate sibling
-    View viewToTakeFocus = null;
-    while (parent != null) {
-      // Search DOWN
-      viewToTakeFocus = FocusFinder.getInstance().findNextFocus(parent, focusedView, View.FOCUS_DOWN);
-      if (viewToTakeFocus == null) {
-        // Search RIGHT
-        viewToTakeFocus = FocusFinder.getInstance().findNextFocus(parent, focusedView, View.FOCUS_RIGHT);
-        if (viewToTakeFocus == null) {
-          // Search UP
-          viewToTakeFocus = FocusFinder.getInstance().findNextFocus(parent, focusedView, View.FOCUS_UP);
-          if (viewToTakeFocus == null) {
-            // Search LEFT
-            viewToTakeFocus = FocusFinder.getInstance().findNextFocus(parent, focusedView, View.FOCUS_LEFT);
-          }
-        }
-      }
-      if (viewToTakeFocus != null || !(parent.getParent() instanceof ViewGroup)) {
-        break;
-      }
-      parent = (ViewGroup) parent.getParent();
-    }
-
-    // Give focus to View
-    if (viewToTakeFocus != null) {
-      viewToTakeFocus.requestFocus();
-    }
-  }
-
   @Override
   public void removeAllViews(ReactViewGroup parent) {
     boolean removeClippedSubviews = parent.getRemoveClippedSubviews();
