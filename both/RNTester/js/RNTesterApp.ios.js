diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterApp.ios.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterApp.ios.js
index ddfa5888c..e13178d02 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterApp.ios.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterApp.ios.js
@@ -61,21 +61,13 @@ const Header = ({onBack, title}: {onBack?: () => mixed, title: string}) => (
 );
 
 class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
-  _mounted: boolean; // TODO(OSS Candidate ISS#2710739)
-
   UNSAFE_componentWillMount() {
     BackHandler.addEventListener('hardwareBackPress', this._handleBack);
   }
 
   componentDidMount() {
-    this._mounted = true; // TODO(OSS Candidate ISS#2710739)
     Linking.getInitialURL().then(url => {
       AsyncStorage.getItem(APP_STATE_KEY, (err, storedString) => {
-        // [TODO(OSS Candidate ISS#2710739)
-        if (!this._mounted) {
-          return;
-        }
-        // ]TODO(OSS Candidate ISS#2710739)
         const exampleAction = URIActionMap(
           this.props.exampleFromAppetizeParams,
         );
@@ -91,12 +83,6 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
     });
   }
 
-  // [TODO(OSS Candidate ISS#2710739)
-  componentWillUnmount() {
-    this._mounted = false;
-  }
-  // ]TODO(OSS Candidate ISS#2710739)
-
   _handleBack = () => {
     this._handleAction(RNTesterActions.Back());
   };
@@ -145,8 +131,8 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
 const styles = StyleSheet.create({
   headerContainer: {
     borderBottomWidth: StyleSheet.hairlineWidth,
-    borderBottomColor: {semantic: 'separatorColor'}, // TODO(OSS Candidate ISS#2710739)
-    backgroundColor: {semantic: 'tertiarySystemBackgroundColor'}, // TODO(OSS Candidate ISS#2710739)
+    borderBottomColor: '#96969A',
+    backgroundColor: '#F5F5F6',
   },
   header: {
     height: 40,
@@ -165,7 +151,6 @@ const styles = StyleSheet.create({
     fontSize: 19,
     fontWeight: '600',
     textAlign: 'center',
-    color: {dynamic: {light: 'black', dark: 'white'}}, // TODO(OSS Candidate ISS#2710739)
   },
   exampleContainer: {
     flex: 1,
@@ -189,10 +174,7 @@ RNTesterList.ComponentExamples.concat(RNTesterList.APIExamples).forEach(
         render() {
           return (
             <SnapshotViewIOS>
-              <RNTesterExampleContainer
-                module={ExampleModule}
-                displayFilter={false}
-              />
+              <RNTesterExampleContainer module={ExampleModule} />
             </SnapshotViewIOS>
           );
         }
