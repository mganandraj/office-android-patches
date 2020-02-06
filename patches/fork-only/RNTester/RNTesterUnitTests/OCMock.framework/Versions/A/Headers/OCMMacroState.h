--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\OCMock.framework\\Versions\\A\\Headers\\OCMMacroState.h"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\OCMock.framework\\Versions\\A\\Headers\\OCMMacroState.h"	2020-01-29 14:10:09.099883900 -0800
@@ -0,0 +1,48 @@
+/*
+ *  Copyright (c) 2014-2016 Erik Doernenburg and contributors
+ *
+ *  Licensed under the Apache License, Version 2.0 (the "License"); you may
+ *  not use these files except in compliance with the License. You may obtain
+ *  a copy of the License at
+ *
+ *      http://www.apache.org/licenses/LICENSE-2.0
+ *
+ *  Unless required by applicable law or agreed to in writing, software
+ *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
+ *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
+ *  License for the specific language governing permissions and limitations
+ *  under the License.
+ */
+
+#import <Foundation/Foundation.h>
+
+@class OCMLocation;
+@class OCMRecorder;
+@class OCMStubRecorder;
+@class OCMockObject;
+
+
+@interface OCMMacroState : NSObject
+{
+    OCMRecorder *recorder;
+}
+
++ (void)beginStubMacro;
++ (OCMStubRecorder *)endStubMacro;
+
++ (void)beginExpectMacro;
++ (OCMStubRecorder *)endExpectMacro;
+
++ (void)beginRejectMacro;
++ (OCMStubRecorder *)endRejectMacro;
+
++ (void)beginVerifyMacroAtLocation:(OCMLocation *)aLocation;
++ (void)endVerifyMacro;
+
++ (OCMMacroState *)globalState;
+
+- (OCMRecorder *)recorder;
+
+- (void)switchToClassMethod;
+
+@end
