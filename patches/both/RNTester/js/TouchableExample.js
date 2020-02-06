--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\TouchableExample.js"	2020-01-30 13:55:48.095611800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\TouchableExample.js"	2020-01-29 14:10:09.197887500 -0800
@@ -391,6 +391,105 @@
   }
 }
 
+// [TODO(macOS ISS#2323203)
+class TouchableHover extends React.Component<{}, $FlowFixMeState> {
+  state = {
+    hoverOver: false,
+  };
+  render() {
+    return (
+      <View>
+        <TouchableOpacity
+          onMouseEnter={this._handlePress}
+          onMouseLeave={this._handlePress}
+          style={[styles.row, styles.block]}>
+          <Text style={this.state.hoverOver ? {color: 'red'} : {color: 'blue'}}>
+            Touchable Opacity with mouse enter/exit events
+          </Text>
+        </TouchableOpacity>
+
+        <TouchableHighlight
+          onMouseEnter={() => console.log('Mouse Enter')}
+          onMouseLeave={() => console.log('Mouse Exit')}
+          activeOpacity={1}
+          disabled={true}
+          underlayColor="rgb(210, 230, 255)"
+          style={[styles.row, styles.block]}
+          onPress={() => console.log('custom THW text - highlight')}>
+          <Text style={styles.disabledButton}>
+            Touchable Highlight with mouse event logging
+          </Text>
+        </TouchableHighlight>
+      </View>
+    );
+  }
+  _handlePress = () => {
+    this.setState({hoverOver: !this.state.hoverOver});
+  };
+}
+
+class TouchableMouseEvents extends React.Component<{}, $FlowFixMeState> {
+  state = {
+    eventLog: [],
+  };
+
+  render() {
+    return (
+      <View testID="touchable_feedback_mouse_events">
+        <View style={[styles.row, {justifyContent: 'center'}]}>
+          <TouchableOpacity
+            style={styles.wrapper}
+            testID="touchable_feedback_mouse_events_button"
+            accessibilityLabel="touchable feedback mouse events"
+            onPressIn={e => this._appendEvent('MouseIn', e.nativeEvent)}
+            onPressOut={e => this._appendEvent('MouseOut', e.nativeEvent)}>
+            <Text style={styles.button}>Click Me</Text>
+          </TouchableOpacity>
+        </View>
+        <View
+          testID="touchable_feedback_mouse_events_console"
+          style={styles.eventLogBox}>
+          {this.state.eventLog.map((e, ii) => (
+            <Text key={ii}>{e}</Text>
+          ))}
+        </View>
+      </View>
+    );
+  }
+
+  _appendEvent = (eventName, nativeEvent) => {
+    var limit = 6;
+    var eventLog = this.state.eventLog.slice(0, limit - 1);
+
+    var eventType = '';
+    if (nativeEvent.button === 0) {
+      eventType = 'left';
+    } else if (nativeEvent.button === 2) {
+      eventType = 'right';
+    }
+    var modifier = '';
+    if (nativeEvent.shiftKey) {
+      modifier += 'shift, ';
+    }
+    if (nativeEvent.ctrlKey) {
+      modifier += 'ctrl, ';
+    }
+    if (nativeEvent.altKey) {
+      modifier += 'alt, ';
+    }
+    if (nativeEvent.metaKey) {
+      modifier += 'meta, ';
+    }
+    if (modifier.length > 0) {
+      modifier = ' - ' + modifier.slice(0, -2) + ' pressed';
+    }
+
+    eventLog.unshift(eventType + eventName + modifier);
+    this.setState({eventLog});
+  };
+}
+// ]TODO(macOS ISS#2323203)
+
 const heartImage = {
   uri: 'https://pbs.twimg.com/media/BlXBfT3CQAA6cVZ.png:small',
 };
@@ -567,4 +666,25 @@
       return <TouchableDisabled />;
     },
   },
+  {
+    // [TODO(macOS ISS#2323203)
+    title: 'Touchable Hover',
+    description:
+      '<Touchable*> components reacts to mouse enter ' +
+      'and mouse exit events',
+    render: function(): React.Element<any> {
+      return <TouchableHover />;
+    },
+    platform: 'macos',
+  },
+  {
+    title: 'Touchable feedback mouse events',
+    description:
+      '<Touchable*> components reacts to mouse events ' +
+      'and mouse exit events',
+    render: function(): React.Element<any> {
+      return <TouchableMouseEvents />;
+    },
+    platform: 'macos',
+  }, // ]TODO(macOS ISS#2323203)
 ];
