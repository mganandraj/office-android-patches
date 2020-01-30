diff --git a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-dev.js b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-dev.js
index 412159878..5ea69a29f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-dev.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-dev.js
@@ -16411,40 +16411,6 @@ function throwException(
         _workInProgress.effectTag |= ShouldCapture;
         _workInProgress.expirationTime = renderExpirationTime;
         return;
-      } else if (
-        enableSuspenseServerRenderer &&
-        _workInProgress.tag === DehydratedSuspenseComponent
-      ) {
-        attachPingListener(root, renderExpirationTime, thenable);
-
-        // Since we already have a current fiber, we can eagerly add a retry listener.
-        var retryCache = _workInProgress.memoizedState;
-        if (retryCache === null) {
-          retryCache = _workInProgress.memoizedState = new PossiblyWeakSet();
-          var _current = _workInProgress.alternate;
-          invariant(
-            _current,
-            "A dehydrated suspense boundary must commit before trying to render. " +
-              "This is probably a bug in React."
-          );
-          _current.memoizedState = retryCache;
-        }
-        // Memoize using the boundary fiber to prevent redundant listeners.
-        if (!retryCache.has(thenable)) {
-          retryCache.add(thenable);
-          var retry = resolveRetryThenable.bind(
-            null,
-            _workInProgress,
-            thenable
-          );
-          if (enableSchedulerTracing) {
-            retry = tracing.unstable_wrap(retry);
-          }
-          thenable.then(retry, retry);
-        }
-        _workInProgress.effectTag |= ShouldCapture;
-        _workInProgress.expirationTime = renderExpirationTime;
-        return;
       }
       // This boundary already captured during this render. Continue to the next
       // boundary.
@@ -16967,10 +16933,6 @@ function resolveLocksOnRoot(root, expirationTime) {
   } else {
     return false;
   }
-  // Flush any sync work that was scheduled by effects
-  if (!isBatchingUpdates && !isRendering) {
-    performSyncWork();
-  }
 }
 
 function interactiveUpdates$1(fn, a, b, c) {
@@ -18228,7 +18190,6 @@ function checkForNestedUpdates() {
       );
     }
   }
-  performWork(NoWork, true);
 }
 
 function flushRenderPhaseStrictModeWarningsInDEV() {
@@ -19124,17 +19085,6 @@ var NativeMethodsMixin = function(findNodeHandle, findHostInstance) {
      * Manipulation](docs/direct-manipulation.html)).
      */
     setNativeProps: function(nativeProps) {
-      {
-        if (warnAboutDeprecatedSetNativeProps) {
-          warningWithoutStack$1(
-            false,
-            "Warning: Calling ref.setNativeProps(nativeProps) " +
-              "is deprecated and will be removed in a future release. " +
-              "Use the setNativeProps export from the react-native package instead." +
-              "\n\timport {setNativeProps} from 'react-native';\n\tsetNativeProps(ref, nativeProps);\n"
-          );
-        }
-      }
       // Class components don't have viewConfig -> validateAttributes.
       // Nor does it make sense to set native props on a non-native component.
       // Instead, find the nearest host component and set props on it.
@@ -19514,18 +19464,6 @@ var ReactNativeComponent = function(findNodeHandle, findHostInstance) {
     ReactNativeComponent.prototype.setNativeProps = function setNativeProps(
       nativeProps
     ) {
-      {
-        if (warnAboutDeprecatedSetNativeProps) {
-          warningWithoutStack$1(
-            false,
-            "Warning: Calling ref.setNativeProps(nativeProps) " +
-              "is deprecated and will be removed in a future release. " +
-              "Use the setNativeProps export from the react-native package instead." +
-              "\n\timport {setNativeProps} from 'react-native';\n\tsetNativeProps(ref, nativeProps);\n"
-          );
-        }
-      }
-
       // Class components don't have viewConfig -> validateAttributes.
       // Nor does it make sense to set native props on a non-native component.
       // Instead, find the nearest host component and set props on it.
@@ -19707,36 +19645,6 @@ var getInspectorDataForViewTag = void 0;
   };
 }
 
-// Module provided by RN:
-function setNativeProps(handle, nativeProps) {
-  if (handle._nativeTag == null) {
-    !(handle._nativeTag != null)
-      ? warningWithoutStack$1(
-          false,
-          "setNativeProps was called with a ref that isn't a " +
-            "native component. Use React.forwardRef to get access to the underlying native component"
-        )
-      : void 0;
-    return;
-  }
-
-  {
-    warnForStyleProps(nativeProps, handle.viewConfig.validAttributes);
-  }
-
-  var updatePayload = create(nativeProps, handle.viewConfig.validAttributes);
-  // Avoid the overhead of bridge calls if there's no update.
-  // This is an expensive no-op for Android, and causes an unnecessary
-  // view invalidation for certain components (eg RCTTextInput) on iOS.
-  if (updatePayload != null) {
-    UIManager.updateView(
-      handle._nativeTag,
-      handle.viewConfig.uiViewClassName,
-      updatePayload
-    );
-  }
-}
-
 var ReactCurrentOwner = ReactSharedInternals.ReactCurrentOwner;
 
 function findNodeHandle(componentOrHandle) {
@@ -19868,4 +19776,4 @@ var fabric = ReactFabric$3.default || ReactFabric$3;
 module.exports = fabric;
 
   })();
-}
\ No newline at end of file
+}
