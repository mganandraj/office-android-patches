diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m"
index 01f6c8a..4bdeb26 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m"
@@ -126,7 +126,7 @@ typedef NS_OPTIONS(NSInteger, RCTTextSizeComparisonOptions) {
       CGFloat fontSize = MAX(MIN(font.pointSize * ratio, maximumFontSize), minimumFontSize);
 
       [self addAttribute:NSFontAttributeName
-                   value:[font fontWithSize:fontSize]
+                   value:UIFontWithSize(font, fontSize) // TODO(macOS ISS#2323203)
                    range:range];
     }
   ];
