

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

+ (instancetype)imageFromColor:(UIColor *)color;
+ (instancetype)imageFromColor:(UIColor *)color byRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

- (UIImage *)imageScaledToSize:(CGSize)size;
- (UIImage *)ovalImageScaledToSize:(CGSize)size;

@end
