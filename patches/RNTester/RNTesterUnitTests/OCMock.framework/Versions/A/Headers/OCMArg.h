--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\OCMock.framework\\Versions\\A\\Headers\\OCMArg.h"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\OCMock.framework\\Versions\\A\\Headers\\OCMArg.h"	2020-01-29 14:10:09.098903600 -0800
@@ -0,0 +1,58 @@
+/*
+ *  Copyright (c) 2009-2016 Erik Doernenburg and contributors
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
+@interface OCMArg : NSObject 
+
+// constraining arguments
+
++ (id)any;
++ (SEL)anySelector;
++ (void *)anyPointer;
++ (id __autoreleasing *)anyObjectRef;
++ (id)isNil;
++ (id)isNotNil;
++ (id)isEqual:(id)value;
++ (id)isNotEqual:(id)value;
++ (id)isKindOfClass:(Class)cls;
++ (id)checkWithSelector:(SEL)selector onObject:(id)anObject;
++ (id)checkWithBlock:(BOOL (^)(id obj))block;
+
+// manipulating arguments
+
++ (id *)setTo:(id)value;
++ (void *)setToValue:(NSValue *)value;
++ (id)invokeBlock;
++ (id)invokeBlockWithArgs:(id)first,... NS_REQUIRES_NIL_TERMINATION;
+
++ (id)defaultValue;
+
+// internal use only
+
++ (id)resolveSpecialValues:(NSValue *)value;
+
+@end
+
+#define OCMOCK_ANY [OCMArg any]
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+  #define OCMOCK_VALUE(variable) \
+    ({ __typeof__(variable) __v = (variable); [NSValue value:&__v withObjCType:@encode(__typeof__(__v))]; })
+#else
+  #define OCMOCK_VALUE(variable) [NSValue value:&variable withObjCType:@encode(__typeof__(variable))]
+#endif
+
