

#import "UIColor+ApplicationColors.h"

@implementation UIColor (ApplicationColors)

+ (instancetype)colorWihtR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b
{
    return [self colorWihtR:r G:g B:b A:1.0f];
}

+ (instancetype)colorWihtR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a
{
    return [[self alloc] initWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

+ (instancetype)applicationDefaultColor
{
    return [self colorWihtR:49.0f G:109.0f B:141.0f];
}

+ (instancetype)applicationLightColor
{
    return [self colorWihtR:152.0f G:182.0f B:198.0f];
}

+ (instancetype)barSeparatorColor
{
    return [self colorWihtR:178.0f G:178.0f B:178.0f];
}

+ (instancetype)barBackgoundColor
{
    return [self colorWihtR:247.0f G:247.0f B:247.0f];
}

+ (instancetype)cellSelectedColor
{
    return [self colorWihtR:232.0f G:244.0f B:248.0f];
}

+ (instancetype)cellSeparatorColor
{
    return [self colorWihtR:200.0f G:199.0f B:204.0f];
}

+ (instancetype)defaultBackgroundColor
{
    return [self colorWihtR:219.0f G:238.0f B:244.0f];
}

+ (instancetype)tabBarBackgroundColor
{
    return [self colorWihtR:51.0f G:51.0f B:51.0f];
}

+ (instancetype)textApplicationColor
{
    return [self colorWihtR:144.8f G:171.0f B:185.0f];
}
+ (instancetype)textDefaultColor
{
    return [self colorWihtR:0.0f G:0.0f B:0.0f];
}

+ (instancetype)textDarkColor
{
    return [self colorWihtR:51.0f G:51.0f B:51.0f];
}

+ (instancetype)textLightColor
{
    return [self colorWihtR:143.0f G:143.0f B:149.0f];
}

+ (instancetype)textPostCountersColor
{
    return [self colorWihtR:85.0f G:85.0f B:85.0f];
}

+ (instancetype)errorDefaultColor
{
    return [self colorWihtR:226.0f G:61.0f B:44.0f];
}

+ (instancetype)errorLightColor
{
    return [self colorWihtR:255.0f G:230.0f B:235.0f];
}

@end
