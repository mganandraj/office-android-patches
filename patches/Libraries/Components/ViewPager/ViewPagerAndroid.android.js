--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js"	2020-01-30 13:55:47.887609300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ViewPager\\ViewPagerAndroid.android.js"	2020-01-29 14:10:08.879882300 -0800
@@ -178,6 +178,8 @@
     // Override styles so that each page will fill the parent. Native component
     // will handle positioning of elements, so it's not important to offset
     // them correctly.
+    /* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was found
+     * when making Flow check .android.js files. */
     return React.Children.map(this.props.children, function(child) {
       if (!child) {
         return null;
@@ -264,6 +266,8 @@
       <NativeAndroidViewPager
         {...this.props}
         ref={VIEWPAGER_REF}
+        /* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */
         style={this.props.style}
         onPageScroll={this._onPageScroll}
         onPageScrollStateChanged={this._onPageScrollStateChanged}
