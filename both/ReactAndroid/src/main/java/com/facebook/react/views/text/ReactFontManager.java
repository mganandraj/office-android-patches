diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactFontManager.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactFontManager.java
index 5bc87a3c4..21d4c1753 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactFontManager.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactFontManager.java
@@ -14,7 +14,6 @@ import android.content.Context;
 import android.content.res.AssetManager;
 import android.graphics.Typeface;
 import android.os.Build;
-import android.util.Pair;
 import android.util.SparseArray;
 
 import androidx.annotation.NonNull;
@@ -42,7 +41,7 @@ public class ReactFontManager {
   private static ReactFontManager sReactFontManagerInstance;
 
   final private Map<String, FontFamily> mFontCache;
-  final private Map<Pair<String, Integer>, Typeface> mCustomTypefaceCache;
+  final private Map<String, Typeface> mCustomTypefaceCache;
 
   private ReactFontManager() {
     mFontCache = new HashMap<>();
@@ -68,18 +67,12 @@ public class ReactFontManager {
       int style,
       int weight,
       AssetManager assetManager) {
-    Pair key = Pair.create(fontFamilyName, weight);
-    if(mCustomTypefaceCache.containsKey(key)) {
-      return Typeface.create(mCustomTypefaceCache.get(key), style);
-    } else {
-      key = Pair.create(fontFamilyName, null);
-      if(mCustomTypefaceCache.containsKey(key)) {
-        Typeface typeface = mCustomTypefaceCache.get(key);
-        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && weight >= 100 && weight <= 1000) {
-          return Typeface.create(typeface, weight, (style & Typeface.ITALIC) != 0);
-        }
-        return Typeface.create(typeface, style);
+    if(mCustomTypefaceCache.containsKey(fontFamilyName)) {
+      Typeface typeface = mCustomTypefaceCache.get(fontFamilyName);
+      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && weight >= 100 && weight <= 1000) {
+        return Typeface.create(typeface, weight, (style & Typeface.ITALIC) != 0);
       }
+      return Typeface.create(typeface, style);
     }
 
     FontFamily fontFamily = mFontCache.get(fontFamilyName);
@@ -109,34 +102,10 @@ public class ReactFontManager {
   public void addCustomFont(@NonNull Context context, @NonNull String fontFamily, int fontId) {
     Typeface font = ResourcesCompat.getFont(context, fontId);
     if (font != null) {
-      addCustomFont(fontFamily, font);
+      mCustomTypefaceCache.put(fontFamily, font);
     }
   }
 
-/*
-   * This method allows you to load custom fonts from a custom Typeface object and register it as a specific 
-   * fontFamily and weight.  This can be used when fonts are delivered during runtime and cannot be included in
-   * the standard app resources.  Typeface's registered using a specific weight will take priority over ones
-   * registered without a specific weight.
-   *
-   * ReactFontManager.getInstance().addCustomFont("Srisakdi", 600, typeface);
-   */
-  public void addCustomFont(@NonNull String fontFamily, int weight, @NonNull Typeface typeface) {
-    mCustomTypefaceCache.put(Pair.create(fontFamily, weight), typeface);
-  }
-
-  /*
-   * This method allows you to load custom fonts from a custom Typeface object and register it as a specific 
-   * fontFamily.  This can be used when fonts are delivered during runtime and cannot be included in
-   * the standard app resources. Typeface's registered using a specific weight will take priority over ones
-   * registered without a specific weight.
-   *
-   * ReactFontManager.getInstance().addCustomFont("Srisakdi", typeface);
-   */
-  public void addCustomFont(@NonNull String fontFamily, @NonNull Typeface typeface) {
-    mCustomTypefaceCache.put(Pair.create(fontFamily, null), typeface);
-  }
-
   /**
    * Add additional font family, or replace the exist one in the font memory cache.
    * @param style
