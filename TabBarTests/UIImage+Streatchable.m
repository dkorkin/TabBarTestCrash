

#import "UIImage+Streatchable.h"


@implementation UIImage (Streatchable)

// -------------------------------------------------------------------------------

- (UIImage *) streatchableImageWithCapInsets:(UIEdgeInsets) insets {
    UIImage *image = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return image;
}

// -------------------------------------------------------------------------------

@end
