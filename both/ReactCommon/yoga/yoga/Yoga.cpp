diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.cpp
index e13f66d37..f7322980f 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.cpp
@@ -1608,14 +1608,6 @@ static void YGNodeWithMeasureFuncSetMeasuredDimensions(
       : YGFloatMax(
             0, availableHeight - marginAxisColumn - paddingAndBorderAxisColumn);
 
-  // Measure the text under the current constraints.
-  const YGSize measuredSize = node->measure(
-      innerWidth,
-      widthMeasureMode,
-      innerHeight,
-      heightMeasureMode,
-      layoutContext);
-
   if (widthMeasureMode == YGMeasureModeExactly &&
       heightMeasureMode == YGMeasureModeExactly) {
     // Don't bother sizing the text if both dimensions are already defined.
@@ -1636,6 +1628,16 @@ static void YGNodeWithMeasureFuncSetMeasuredDimensions(
             ownerWidth),
         YGDimensionHeight);
   } else {
+    // Measure the text under the current constraints.
+    const YGSize measuredSize = marker::MarkerSection<YGMarkerMeasure>::wrap(
+        node,
+        &YGNode::measure,
+        innerWidth,
+        widthMeasureMode,
+        innerHeight,
+        heightMeasureMode,
+        layoutContext);
+
     node->setLayoutMeasuredDimension(
         YGNodeBoundAxis(
             node,
