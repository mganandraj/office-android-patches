diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.cpp"
index f732298..e13f66d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.cpp"
@@ -1608,6 +1608,14 @@ static void YGNodeWithMeasureFuncSetMeasuredDimensions(
       : YGFloatMax(
             0, availableHeight - marginAxisColumn - paddingAndBorderAxisColumn);
 
+  // Measure the text under the current constraints.
+  const YGSize measuredSize = node->measure(
+      innerWidth,
+      widthMeasureMode,
+      innerHeight,
+      heightMeasureMode,
+      layoutContext);
+
   if (widthMeasureMode == YGMeasureModeExactly &&
       heightMeasureMode == YGMeasureModeExactly) {
     // Don't bother sizing the text if both dimensions are already defined.
@@ -1628,16 +1636,6 @@ static void YGNodeWithMeasureFuncSetMeasuredDimensions(
             ownerWidth),
         YGDimensionHeight);
   } else {
-    // Measure the text under the current constraints.
-    const YGSize measuredSize = marker::MarkerSection<YGMarkerMeasure>::wrap(
-        node,
-        &YGNode::measure,
-        innerWidth,
-        widthMeasureMode,
-        innerHeight,
-        heightMeasureMode,
-        layoutContext);
-
     node->setLayoutMeasuredDimension(
         YGNodeBoundAxis(
             node,
