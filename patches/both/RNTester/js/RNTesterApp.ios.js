diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterApp.ios.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterApp.ios.js"
index e13178d..ddfa588 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterApp.ios.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterApp.ios.js"
@@ -61,13 +61,21 @@ const Header = ({onBack, title}: {onBack?: () => mixed, title: string}) => (
 );
 
 class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
+  _mounted: boolean; // TODO(OSS Candidate ISS#2710739)
+
   UNSAFE_componentWillMount() {
     BackHandler.addEventListener('hardwareBackPress', this._handleBack);
   }
 
   componentDidMount() {
+    this._mounted = true; // TODO(OSS Candidate ISS#2710739)
     Linking.getInitialURL().then(url => {
       AsyncStorage.getItem(APP_STATE_KEY, (err, storedString) => {
+        // [TODO(OSS Candidate ISS#2710739)
+        if (!this._mounted) {
+          return;
+        }
+        // ]TODO(OSS Candidate ISS#2710739)
         const exampleAction = URIActionMap(
           this.props.exampleFromAppetizeParams,
         );
@@ -83,6 +91,12 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
     });
   }
 
+  // [TODO(OSS Candidate ISS#2710739)
+  componentWillUnmount() {
+    this._mounted = false;
+  }
+  // ]TODO(OSS Candidate ISS#2710739)
+
   _handleBack = () => {
     this._handleAction(RNTesterActions.Back());
   };
@@ -131,8 +145,8 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
 const styles = StyleSheet.create({
   headerContainer: {
     borderBottomWidth: StyleSheet.hairlineWidth,
-    borderBottomColor: '#96969A',
-    backgroundColor: '#F5F5F6',
+    borderBottomColor: {semantic: 'separatorColor'}, // TODO(OSS Candidate ISS#2710739)
+    backgroundColor: {semantic: 'tertiarySystemBackgroundColor'}, // TODO(OSS Candidate ISS#2710739)
   },
   header: {
     height: 40,
@@ -151,6 +165,7 @@ const styles = StyleSheet.create({
     fontSize: 19,
     fontWeight: '600',
     textAlign: 'center',
+    color: {dynamic: {light: 'black', dark: 'white'}}, // TODO(OSS Candidate ISS#2710739)
   },
   exampleContainer: {
     flex: 1,
@@ -174,7 +189,10 @@ RNTesterList.ComponentExamples.concat(RNTesterList.APIExamples).forEach(
         render() {
           return (
             <SnapshotViewIOS>
-              <RNTesterExampleContainer module={ExampleModule} />
+              <RNTesterExampleContainer
+                module={ExampleModule}
+                displayFilter={false}
+              />
             </SnapshotViewIOS>
           );
         }
