diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/NSTextStorage+FontScaling.m b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/NSTextStorage+FontScaling.m
index 4bdeb269c..01f6c8a1a 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/NSTextStorage+FontScaling.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/NSTextStorage+FontScaling.m
@@ -126,7 +126,7 @@ typedef NS_OPTIONS(NSInteger, RCTTextSizeComparisonOptions) {
       CGFloat fontSize = MAX(MIN(font.pointSize * ratio, maximumFontSize), minimumFontSize);
 
       [self addAttribute:NSFontAttributeName
-                   value:UIFontWithSize(font, fontSize) // TODO(macOS ISS#2323203)
+                   value:[font fontWithSize:fontSize]
                    range:range];
     }
   ];
