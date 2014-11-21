

#import <UIKit/UIKit.h>

#define RGB_COLOR(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//TODO: 85, 85, 85? (555555) color

@interface UIColor (ApplicationColors)

+ (instancetype)colorWihtR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;
+ (instancetype)colorWihtR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a;

+ (instancetype)applicationDefaultColor;
+ (instancetype)applicationLightColor;

+ (instancetype)barSeparatorColor;
+ (instancetype)barBackgoundColor;

+ (instancetype)cellSelectedColor;
+ (instancetype)cellSeparatorColor;

+ (instancetype)defaultBackgroundColor;
+ (instancetype)tabBarBackgroundColor;

+ (instancetype)textApplicationColor;
+ (instancetype)textDefaultColor;
+ (instancetype)textDarkColor;
+ (instancetype)textLightColor;
+ (instancetype)textPostCountersColor;

+ (instancetype)errorDefaultColor;
+ (instancetype)errorLightColor;

@end
