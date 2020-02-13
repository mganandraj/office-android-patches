--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactNativeRenderer-dev.js"	2020-01-30 13:55:47.970607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactNativeRenderer-dev.js"	2020-01-29 14:10:08.972883100 -0800
@@ -3827,6 +3827,19 @@
   }
 }
 
+var debugRenderPhaseSideEffects = false;
+var debugRenderPhaseSideEffectsForStrictMode = false;
+var enableUserTimingAPI = true;
+var replayFailedUnitOfWorkWithInvokeGuardedCallback = true;
+var warnAboutDeprecatedLifecycles = false;
+var enableProfilerTimer = true;
+var enableSchedulerTracing = true;
+var enableSuspenseServerRenderer = false;
+
+var warnAboutDeprecatedSetNativeProps = false;
+
+// Only used in www builds.
+
 function _classCallCheck(instance, Constructor) {
   if (!(instance instanceof Constructor)) {
     throw new TypeError("Cannot call a class as a function");
@@ -16739,6 +16752,40 @@
         _workInProgress.effectTag |= ShouldCapture;
         _workInProgress.expirationTime = renderExpirationTime;
         return;
+      } else if (
+        enableSuspenseServerRenderer &&
+        _workInProgress.tag === DehydratedSuspenseComponent
+      ) {
+        attachPingListener(root, renderExpirationTime, thenable);
+
+        // Since we already have a current fiber, we can eagerly add a retry listener.
+        var retryCache = _workInProgress.memoizedState;
+        if (retryCache === null) {
+          retryCache = _workInProgress.memoizedState = new PossiblyWeakSet();
+          var _current = _workInProgress.alternate;
+          invariant(
+            _current,
+            "A dehydrated suspense boundary must commit before trying to render. " +
+              "This is probably a bug in React."
+          );
+          _current.memoizedState = retryCache;
+        }
+        // Memoize using the boundary fiber to prevent redundant listeners.
+        if (!retryCache.has(thenable)) {
+          retryCache.add(thenable);
+          var retry = resolveRetryThenable.bind(
+            null,
+            _workInProgress,
+            thenable
+          );
+          if (enableSchedulerTracing) {
+            retry = tracing.unstable_wrap(retry);
+          }
+          thenable.then(retry, retry);
+        }
+        _workInProgress.effectTag |= ShouldCapture;
+        _workInProgress.expirationTime = renderExpirationTime;
+        return;
       }
       // This boundary already captured during this render. Continue to the next
       // boundary.
@@ -17231,6 +17278,10 @@
       root.callbackExpirationTime = NoWork;
     }
   }
+  // Flush any sync work that was scheduled by effects
+  if (!isBatchingUpdates && !isRendering) {
+    performSyncWork();
+  }
 }
 
 function flushInteractiveUpdates$1() {
@@ -19413,6 +19464,17 @@
      * Manipulation](docs/direct-manipulation.html)).
      */
     setNativeProps: function(nativeProps) {
+      {
+        if (warnAboutDeprecatedSetNativeProps) {
+          warningWithoutStack$1(
+            false,
+            "Warning: Calling ref.setNativeProps(nativeProps) " +
+              "is deprecated and will be removed in a future release. " +
+              "Use the setNativeProps export from the react-native package instead." +
+              "\n\timport {setNativeProps} from 'react-native';\n\tsetNativeProps(ref, nativeProps);\n"
+          );
+        }
+      }
       // Class components don't have viewConfig -> validateAttributes.
       // Nor does it make sense to set native props on a non-native component.
       // Instead, find the nearest host component and set props on it.
@@ -19792,6 +19854,18 @@
     ReactNativeComponent.prototype.setNativeProps = function setNativeProps(
       nativeProps
     ) {
+      {
+        if (warnAboutDeprecatedSetNativeProps) {
+          warningWithoutStack$1(
+            false,
+            "Warning: Calling ref.setNativeProps(nativeProps) " +
+              "is deprecated and will be removed in a future release. " +
+              "Use the setNativeProps export from the react-native package instead." +
+              "\n\timport {setNativeProps} from 'react-native';\n\tsetNativeProps(ref, nativeProps);\n"
+          );
+        }
+      }
+
       // Class components don't have viewConfig -> validateAttributes.
       // Nor does it make sense to set native props on a non-native component.
       // Instead, find the nearest host component and set props on it.
