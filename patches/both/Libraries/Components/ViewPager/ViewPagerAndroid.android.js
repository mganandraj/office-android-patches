diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js"
index 0ffb242..1763a0c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js"
@@ -178,6 +178,8 @@ class ViewPagerAndroid extends React.Component<Props> {
     // Override styles so that each page will fill the parent. Native component
     // will handle positioning of elements, so it's not important to offset
     // them correctly.
+    /* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was found
+     * when making Flow check .android.js files. */
     return React.Children.map(this.props.children, function(child) {
       if (!child) {
         return null;
@@ -264,6 +266,8 @@ class ViewPagerAndroid extends React.Component<Props> {
       <NativeAndroidViewPager
         {...this.props}
         ref={VIEWPAGER_REF}
+        /* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */
         style={this.props.style}
         onPageScroll={this._onPageScroll}
         onPageScrollStateChanged={this._onPageScrollStateChanged}
