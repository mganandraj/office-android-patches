--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Lists\\VirtualizedSectionList.js"	2020-01-30 13:55:47.925608600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Lists\\VirtualizedSectionList.js"	2020-01-29 14:10:08.926884100 -0800
@@ -12,11 +12,16 @@
 const React = require('react');
 const View = require('../Components/View/View');
 const VirtualizedList = require('./VirtualizedList');
+const Platform = require('../Utilities/Platform'); // TODO(macOS ISS#2323203)
 
 const invariant = require('invariant');
 
 import type {ViewToken} from './ViewabilityHelper';
-import type {Props as VirtualizedListProps} from './VirtualizedList';
+import type {
+  Props as VirtualizedListProps,
+  SelectedRowIndexPathType, // TODO(macOS ISS#2323203)
+} from './VirtualizedList';
+import type {ScrollEvent} from '../Types/CoreEventTypes'; // TODO(macOS ISS#2323203)
 
 type Item = any;
 
@@ -35,6 +40,7 @@
   renderItem?: ?(info: {
     item: SectionItemT,
     index: number,
+    isSelected?: boolean, // TODO(macOS ISS#2323203)
     section: SectionBase<SectionItemT>,
     separators: {
       highlight: () => void,
@@ -52,6 +58,12 @@
 
 type OptionalProps<SectionT: SectionBase<any>> = {
   /**
+   * Handles key down events and updates selection based on the key event
+   *
+   * @platform macos
+   */
+  enableSelectionOnKeyPress?: ?boolean, // TODO(macOS ISS#2323203)
+  /**
    * Rendered after the last item in the last section.
    */
   ListFooterComponent?: ?(React.ComponentType<any> | React.Element<any>),
@@ -65,6 +77,7 @@
   renderItem?: (info: {
     item: Item,
     index: number,
+    isSelected?: boolean, // TODO(macOS ISS#2323203)
     section: SectionT,
     separators: {
       highlight: () => void,
@@ -103,6 +116,19 @@
    */
   onRefresh?: ?() => void,
   /**
+   * If provided, processes key press and mouse click events to update selection state
+   * and invokes the provided function to notify of selection state changes.
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
+  /**
    * Called when the viewability of rows changes, as defined by the
    * `viewabilityConfig` prop.
    */
@@ -123,7 +149,10 @@
 type DefaultProps = typeof VirtualizedList.defaultProps & {
   data: $ReadOnlyArray<Item>,
 };
-type State = {childProps: VirtualizedListProps};
+type State = {
+  childProps: VirtualizedListProps,
+  selectedRowIndexPath: SelectedRowIndexPathType, // TODO(macOS ISS#2323203)
+};
 
 /**
  * Right now this just flattens everything into one list and uses VirtualizedList under the
@@ -203,12 +232,127 @@
           ? stickyHeaderIndices
           : undefined,
       },
+      selectedRowIndexPath: {sectionIndex: 0, rowIndex: -1}, // TODO(macOS ISS#2323203)
     };
   }
+  // [TODO(macOS ISS#2323203)
+  _selectRowAboveIndexPath = rowIndexPath => {
+    let sectionIndex = rowIndexPath.sectionIndex;
+    if (sectionIndex >= this.props.sections.length) {
+      return rowIndexPath;
+    }
+
+    const count = this.props.sections[sectionIndex].data.length;
+    let row = rowIndexPath.rowIndex;
+    let rowAbove = row - 1;
+
+    if (rowAbove < 0) {
+      if (sectionIndex > 0) {
+        sectionIndex = sectionIndex - 1;
+        rowAbove = Math.max(
+          0,
+          this.props.sections[sectionIndex].data.length - 1,
+        );
+      } else {
+        rowAbove = row;
+      }
+    }
+    const nextIndexPath = {sectionIndex: sectionIndex, rowIndex: rowAbove};
+    this.setState(state => {
+      return {selectedRowIndexPath: nextIndexPath};
+    });
+    return nextIndexPath;
+  };
+
+  _selectRowBelowIndexPath = rowIndexPath => {
+    let sectionIndex = rowIndexPath.sectionIndex;
+    if (sectionIndex >= this.props.sections.length) {
+      return rowIndexPath;
+    }
+
+    const count = this.props.sections[sectionIndex].data.length;
+    let row = rowIndexPath.rowIndex;
+    let rowBelow = row + 1;
+
+    if (rowBelow > count - 1) {
+      if (sectionIndex < this.props.sections.length - 1) {
+        sectionIndex = sectionIndex + 1;
+        rowBelow = 0;
+      } else {
+        rowBelow = row;
+      }
+    }
+    const nextIndexPath = {sectionIndex: sectionIndex, rowIndex: rowBelow};
+    this.setState(state => {
+      return {selectedRowIndexPath: nextIndexPath};
+    });
+    return nextIndexPath;
+  };
+
+  _ensureItemAtIndexPathIsVisible = rowIndexPath => {
+    let index = rowIndexPath.rowIndex + 1;
+    for (let ii = 0; ii < rowIndexPath.sectionIndex; ii++) {
+      index += this.props.sections[ii].data.length + 2;
+    }
+    this._listRef.ensureItemAtIndexIsVisible(index);
+  };
+
+  _handleKeyDown = (e: ScrollEvent) => {
+    if (Platform.OS === 'macos') {
+      const event = e.nativeEvent;
+      const key = event.key;
+      let prevIndexPath = this.state.selectedRowIndexPath;
+      let nextIndexPath = null;
+      const sectionIndex = this.state.selectedRowIndexPath.sectionIndex;
+      const rowIndex = this.state.selectedRowIndexPath.rowIndex;
+
+      if (key === 'DOWN_ARROW') {
+        nextIndexPath = this._selectRowBelowIndexPath(prevIndexPath);
+        this._ensureItemAtIndexPathIsVisible(nextIndexPath);
+
+        if (this.props.onSelectionChanged) {
+          const item = this.props.sections[sectionIndex].data[rowIndex];
+          this.props.onSelectionChanged({
+            previousSelection: prevIndexPath,
+            newSelection: nextIndexPath,
+            item: item,
+          });
+        }
+      } else if (key === 'UP_ARROW') {
+        nextIndexPath = this._selectRowAboveIndexPath(prevIndexPath);
+        this._ensureItemAtIndexPathIsVisible(nextIndexPath);
+
+        if (this.props.onSelectionChanged) {
+          const item = this.props.sections[sectionIndex].data[rowIndex];
+          this.props.onSelectionChanged({
+            previousSelection: prevIndexPath,
+            newSelection: nextIndexPath,
+            item: item,
+          });
+        }
+      } else if (key === 'ENTER') {
+        if (this.props.onSelectionEntered) {
+          const item = this.props.sections[sectionIndex].data[rowIndex];
+          this.props.onSelectionEntered(item);
+        }
+      }
+    }
+  }; // ]TODO(macOS ISS#2323203)
 
   render() {
+    let keyEventHandler = this.props.onScrollKeyDown; // [TODO(macOS ISS#2323203)
+    if (!keyEventHandler) {
+      keyEventHandler = this.props.enableSelectionOnKeyPress
+        ? this._handleKeyDown
+        : null;
+    } // ]TODO(macOS ISS#2323203)
     return (
-      <VirtualizedList {...this.state.childProps} ref={this._captureRef} />
+      <VirtualizedList
+        {...this.state.childProps}
+        ref={this._captureRef}
+        onScrollKeyDown={keyEventHandler}
+        {...this.state.selectedRowIndexPath}
+      /> // TODO(macOS ISS#2323203)
     );
   }
 
@@ -305,6 +449,24 @@
     }
   };
 
+  // [TODO(macOS ISS#2323203)
+  _isItemSelected = (item: Item): boolean => {
+    let isSelected = false;
+    if (this.state.selectedRowIndexPath) {
+      const selection = this.state.selectedRowIndexPath;
+      const sections = this.props.sections;
+      if (sections && selection.sectionIndex < sections.length) {
+        const section = sections[selection.sectionIndex];
+        if (selection.rowIndex < section.data.length) {
+          const selectedItem = section.data[selection.rowIndex];
+          isSelected = item === selectedItem;
+        }
+      }
+    }
+    return isSelected;
+  };
+  // ]TODO(macOS ISS#2323203)
+
   _renderItem = ({item, index}: {item: Item, index: number}) => {
     const info = this._subExtractor(index);
     if (!info) {
@@ -332,6 +494,7 @@
           }
           cellKey={info.key}
           index={infoIndex}
+          isSelected={this._isItemSelected(item)} // TODO(macOS ISS#2323203)
           item={item}
           leadingItem={info.leadingItem}
           leadingSection={info.leadingSection}
@@ -402,6 +565,7 @@
   cellKey: string,
   index: number,
   item: Item,
+  isSelected: boolean,
   onUpdateSeparator: (cellKey: string, newProps: Object) => void,
   prevCellKey?: ?string,
   renderItem: Function,
@@ -503,11 +667,13 @@
       SeparatorComponent,
       item,
       index,
+      isSelected, // TODO(macOS ISS#2323203)
       section,
     } = this.props;
     const element = this.props.renderItem({
       item,
       index,
+      isSelected, // TODO(macOS ISS#2323203)
       section,
       separators: this._separators,
     });
