diff --git a/E:/github/ms-react-native-forpatch/scripts/circleci/check_license.sh b/E:/github/fb-react-native-forpatch/scripts/circleci/check_license.sh
index 5874a336d..cd2def252 100644
--- a/E:/github/ms-react-native-forpatch/scripts/circleci/check_license.sh
+++ b/E:/github/fb-react-native-forpatch/scripts/circleci/check_license.sh
@@ -7,11 +7,7 @@
 set -e
 
 # Make sure we don't introduce accidental references to PATENTS.
-EXPECTED='Folly/folly/experimental/DynamicParser-inl.h
-Folly/folly/experimental/DynamicParser.cpp
-Folly/folly/experimental/DynamicParser.h
-Folly/folly/experimental/test/DynamicParserTest.cpp
-scripts/circleci/check_license.sh'
+EXPECTED='scripts/circleci/check_license.sh'
 ACTUAL=$(git grep -l PATENTS)
 
 if [ "$EXPECTED" != "$ACTUAL" ]; then
