--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m"	2020-01-30 13:55:47.989608600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.m"	2020-01-29 14:10:08.993882600 -0800
@@ -126,7 +126,7 @@
       CGFloat fontSize = MAX(MIN(font.pointSize * ratio, maximumFontSize), minimumFontSize);
 
       [self addAttribute:NSFontAttributeName
-                   value:[font fontWithSize:fontSize]
+                   value:UIFontWithSize(font, fontSize) // TODO(macOS ISS#2323203)
                    range:range];
     }
   ];
