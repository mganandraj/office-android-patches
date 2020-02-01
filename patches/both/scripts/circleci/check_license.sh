diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\circleci\\check_license.sh" "b/E:\\github\\ms-react-native-forpatch\\scripts\\circleci\\check_license.sh"
index cd2def2..5874a33 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\circleci\\check_license.sh"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\circleci\\check_license.sh"
@@ -7,7 +7,11 @@
 set -e
 
 # Make sure we don't introduce accidental references to PATENTS.
-EXPECTED='scripts/circleci/check_license.sh'
+EXPECTED='Folly/folly/experimental/DynamicParser-inl.h
+Folly/folly/experimental/DynamicParser.cpp
+Folly/folly/experimental/DynamicParser.h
+Folly/folly/experimental/test/DynamicParserTest.cpp
+scripts/circleci/check_license.sh'
 ACTUAL=$(git grep -l PATENTS)
 
 if [ "$EXPECTED" != "$ACTUAL" ]; then
