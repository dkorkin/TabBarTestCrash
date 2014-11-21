

#import "OBGradientView.h"

@interface BadgeView : OBGradientView

@property (nonatomic, strong) NSString *badgeValue;

@property (nonatomic, assign) CGFloat badgeHeight;
@property (nonatomic, assign) NSInteger backgroundCornerRadius;

@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, strong) UIFont *badgeSymbolFont;
@property (nonatomic, strong) UIColor *badgeSymbolColor;

@end
