

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

+ (instancetype)imageFromColor:(UIColor *)color
{
    CGFloat screenScale = [UIScreen mainScreen].scale;
    
    BOOL opaque = CGColorGetAlpha(color.CGColor) == 1.0;
    CGRect rect = CGRectMake(0.0f, 0.0f, screenScale, screenScale);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)imageFromColor:(UIColor *)color byRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius
{
    CGFloat size = radius * 2.0f + [UIScreen mainScreen].scale * 2;
    
    BOOL opaque = CGColorGetAlpha(color.CGColor) == 1.0 && radius == 0.0;
    CGRect rect = CGRectMake(0.0f, 0.0f, size, size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, 0);
    [color setFill];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat inset = radius + [UIScreen mainScreen].scale;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(inset, inset, inset, inset)];
}

- (UIImage *)imageScaledToSize:(CGSize)size
{
    if (!self)
        return nil;
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)ovalImageScaledToSize:(CGSize)size
{
    CGRect drawingRect = (CGRect){.origin = CGPointZero, .size = size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:drawingRect];
    [path addClip];
    [self drawInRect:drawingRect];
    UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return maskedImage;
}

@end
