

#import <UIKit/UIKit.h>

@interface UIView (KKToolKitAdditions)

@property (nonatomic, readwrite) CGFloat x;
@property (nonatomic, readwrite) CGFloat y;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;

- (void)removeAllSubviews;

- (void)highlightWithGreenColor;

- (UIImage*)screenshotImage;

@end
