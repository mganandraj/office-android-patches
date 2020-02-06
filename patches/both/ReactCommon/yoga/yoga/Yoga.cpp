--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.cpp"	2020-01-30 13:55:48.632608500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.cpp"	2020-01-29 14:10:09.849895300 -0800
@@ -1608,6 +1608,14 @@
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
@@ -1628,16 +1636,6 @@
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
