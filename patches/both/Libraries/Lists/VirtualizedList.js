diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\VirtualizedList.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\VirtualizedList.js"
index b896b3b..eb7b794 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\VirtualizedList.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\VirtualizedList.js"
@@ -11,13 +11,13 @@
 
 const Batchinator = require('../Interaction/Batchinator');
 const FillRateHelper = require('./FillRateHelper');
+const Platform = require('../Utilities/Platform'); // TODO(macOS ISS#2323203)
 const PropTypes = require('prop-types');
 const React = require('react');
 const ReactNative = require('../Renderer/shims/ReactNative');
 const RefreshControl = require('../Components/RefreshControl/RefreshControl');
 const ScrollView = require('../Components/ScrollView/ScrollView');
 const StyleSheet = require('../StyleSheet/StyleSheet');
-const UIManager = require('../ReactNative/UIManager');
 const View = require('../Components/View/View');
 const ViewabilityHelper = require('./ViewabilityHelper');
 
@@ -34,6 +34,7 @@ import type {
   ViewToken,
   ViewabilityConfigCallbackPair,
 } from './ViewabilityHelper';
+import type {ScrollEvent} from '../Types/CoreEventTypes'; // TODO(macOS ISS#2323203)
 
 type Item = any;
 
@@ -47,6 +48,12 @@ type ViewabilityHelperCallbackTuple = {
   }) => void,
 };
 
+// [TODO(macOS ISS#2323203)
+export type SelectedRowIndexPathType = {
+  sectionIndex: number,
+  rowIndex: number,
+}; // ]TODO(macOS ISS#2323203)
+
 type RequiredProps = {
   // TODO: Conflicts with the optional `renderItem` in
   // `VirtualizedSectionList`'s props.
@@ -77,6 +84,12 @@ type OptionalProps = {
    * this for debugging purposes.
    */
   disableVirtualization?: ?boolean,
+  /**
+   * Handles key down events and updates selection based on the key event
+   *
+   * @platform macos
+   */
+  enableSelectionOnKeyPress?: ?boolean, // TODO(macOS ISS#2323203)
   /**
    * A marker property for telling the list to re-render (since it implements `PureComponent`). If
    * any of your `renderItem`, Header, Footer, etc. functions depend on anything outside of the
@@ -164,6 +177,19 @@ type OptionalProps = {
     highestMeasuredFrameIndex: number,
     averageItemLength: number,
   }) => void,
+  /**
+   * If provided, will be invoked whenever the selection on the list changes. Make sure to set
+   * the property enableSelectionOnKeyPress to true to change selection via keyboard (macOS).
+   *
+   * @platform macos
+   */
+  onSelectionChanged?: ?Function, // TODO(macOS ISS#2323203)
+  /**
+   * If provided, called when 'Enter' key is pressed on an item.
+   *
+   * @platform macos
+   */
+  onSelectionEntered?: ?Function, // TODO(macOS ISS#2323203)
   /**
    * Called when the viewability of rows changes, as defined by the
    * `viewabilityConfig` prop.
@@ -238,7 +264,11 @@ type ChildListState = {
   frames: {[key: number]: Frame},
 };
 
-type State = {first: number, last: number};
+type State = {
+  first: number,
+  last: number,
+  selectedRowIndex: number, // TODO(macOS ISS#2323203)
+};
 
 /**
  * Base implementation for the more convenient [`<FlatList>`](/react-native/docs/flatlist.html)
@@ -377,6 +407,25 @@ class VirtualizedList extends React.PureComponent<Props, State> {
     );
   }
 
+  // [TODO(macOS ISS#2323203)
+  ensureItemAtIndexIsVisible = (rowIndex: number) => {
+    const frame = this._getFrameMetricsApprox(rowIndex);
+    const visTop = this._scrollMetrics.offset;
+    const visLen = this._scrollMetrics.visibleLength;
+    const visEnd = visTop + visLen;
+    const contentLength = this._scrollMetrics.contentLength;
+    const frameEnd = frame.offset + frame.length;
+
+    if (frameEnd > visEnd) {
+      const newOffset = Math.min(contentLength, visTop + (frameEnd - visEnd));
+      this.scrollToOffset({offset: newOffset});
+    } else if (frame.offset < visTop) {
+      const newOffset = Math.max(0, visTop - frame.length);
+      this.scrollToOffset({offset: newOffset});
+    }
+  };
+  // ]TODO(macOS ISS#2323203)
+
   recordInteraction() {
     this._nestedChildLists.forEach(childList => {
       childList.ref && childList.ref.recordInteraction();
@@ -598,6 +647,7 @@ class VirtualizedList extends React.PureComponent<Props, State> {
           this.props.getItemCount(this.props.data),
           (this.props.initialScrollIndex || 0) + this.props.initialNumToRender,
         ) - 1,
+      selectedRowIndex: 0, // TODO(macOS ISS#2323203)
     };
 
     if (this._isNestedWithSameOrientation()) {
@@ -694,6 +744,7 @@ class VirtualizedList extends React.PureComponent<Props, State> {
           index={ii}
           inversionStyle={inversionStyle}
           item={item}
+          isSelected={this.state.selectedRowIndex === ii ? true : false} // TODO(macOS ISS#2323203)
           key={key}
           prevCellKey={prevCellKey}
           onUpdateSeparators={this._onUpdateSeparators}
@@ -1048,6 +1099,12 @@ class VirtualizedList extends React.PureComponent<Props, State> {
   }
 
   _defaultRenderScrollComponent = props => {
+    let keyEventHandler = this.props.onScrollKeyDown; // [TODO(macOS ISS#2323203)
+    if (!keyEventHandler) {
+      keyEventHandler = this.props.enableSelectionOnKeyPress
+        ? this._handleKeyDown
+        : null;
+    } // ]TODO(macOS ISS#2323203)
     const onRefresh = props.onRefresh;
     if (this._isNestedWithSameOrientation()) {
       // $FlowFixMe - Typing ReactNativeComponent revealed errors
@@ -1063,6 +1120,7 @@ class VirtualizedList extends React.PureComponent<Props, State> {
         // $FlowFixMe Invalid prop usage
         <ScrollView
           {...props}
+          onScrollKeyDown={keyEventHandler} // TODO(macOS ISS#2323203)
           refreshControl={
             props.refreshControl == null ? (
               <RefreshControl
@@ -1078,7 +1136,7 @@ class VirtualizedList extends React.PureComponent<Props, State> {
       );
     } else {
       // $FlowFixMe Invalid prop usage
-      return <ScrollView {...props} />;
+      return <ScrollView {...props} onScrollKeyDown={keyEventHandler} />; // TODO(macOS ISS#2323203)
     }
   };
 
@@ -1200,6 +1258,80 @@ class VirtualizedList extends React.PureComponent<Props, State> {
     this._headerLength = this._selectLength(e.nativeEvent.layout);
   };
 
+  // [TODO(macOS ISS#2323203)
+  _selectRowAboveIndex = rowIndex => {
+    const rowAbove = rowIndex > 0 ? rowIndex - 1 : rowIndex;
+    this.setState(state => {
+      return {selectedRowIndex: rowAbove};
+    });
+    return rowAbove;
+  };
+
+  _selectRowBelowIndex = rowIndex => {
+    if (this.props.getItemCount) {
+      const {data} = this.props;
+      const itemCount = this.props.getItemCount(data);
+      const rowBelow = rowIndex < itemCount - 1 ? rowIndex + 1 : rowIndex;
+      this.setState(state => {
+        return {selectedRowIndex: rowBelow};
+      });
+      return rowBelow;
+    } else {
+      return rowIndex;
+    }
+  };
+
+  _handleKeyDown = (e: ScrollEvent) => {
+    if (this.props.onKeyDown) {
+      this.props.onKeyDown(e);
+    } else {
+      if (Platform.OS === 'macos') {
+        // $FlowFixMe Cannot get e.nativeEvent because property nativeEvent is missing in Event
+        const event = e.nativeEvent;
+        const key = event.key;
+
+        let prevIndex = -1;
+        let newIndex = -1;
+        if ('selectedRowIndex' in this.state) {
+          prevIndex = this.state.selectedRowIndex;
+        }
+
+        const {data, getItem} = this.props;
+        if (key === 'DOWN_ARROW') {
+          newIndex = this._selectRowBelowIndex(prevIndex);
+          this.ensureItemAtIndexIsVisible(newIndex);
+
+          if (this.props.onSelectionChanged && prevIndex !== newIndex) {
+            const item = getItem(data, newIndex);
+            this.props.onSelectionChanged({
+              previousSelection: prevIndex,
+              newSelection: newIndex,
+              item: item,
+            });
+          }
+        } else if (key === 'UP_ARROW') {
+          newIndex = this._selectRowAboveIndex(prevIndex);
+          this.ensureItemAtIndexIsVisible(newIndex);
+
+          if (this.props.onSelectionChanged && prevIndex !== newIndex) {
+            const item = getItem(data, newIndex);
+            this.props.onSelectionChanged({
+              previousSelection: prevIndex,
+              newSelection: newIndex,
+              item: item,
+            });
+          }
+        } else if (key === 'ENTER') {
+          if (this.props.onSelectionEntered) {
+            const item = getItem(data, prevIndex);
+            this.props.onSelectionEntered(item);
+          }
+        }
+      }
+    }
+  };
+  // ]TODO(macOS ISS#2323203)
+
   _renderDebugOverlay() {
     const normalize =
       this._scrollMetrics.visibleLength /
@@ -1658,6 +1790,7 @@ class CellRenderer extends React.Component<
     horizontal: ?boolean,
     index: number,
     inversionStyle: ViewStyleProp,
+    isSelected: ?boolean, // TODO(macOS ISS#2323203)
     item: Item,
     onLayout: (event: Object) => void, // This is extracted by ScrollViewStickyHeader
     onUnmount: (cellKey: string) => void,
@@ -1734,6 +1867,7 @@ class CellRenderer extends React.Component<
       item,
       index,
       inversionStyle,
+      isSelected, // TODO(macOS ISS#2323203)
       parentProps,
     } = this.props;
     const {renderItem, getItemLayout} = parentProps;
@@ -1741,6 +1875,7 @@ class CellRenderer extends React.Component<
     const element = renderItem({
       item,
       index,
+      isSelected, // TODO(macOS ISS#2323203)
       separators: this._separators,
     });
     const onLayout =
