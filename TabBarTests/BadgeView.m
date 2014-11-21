
#import "BadgeView.h"
#import "GeneralDefines.h"
#import "UIView+CornerRadius.h"

@interface BadgeView ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation BadgeView

@dynamic badgeValue;

- (void)setupUIAfterInitWithoutNib
{
    [self createTitleLabel];
    self.hidden = YES;
    self.badgeHeight = 13;
    self.backgroundCornerRadius = 3;
    self.gradientColors = [NSArray arrayWithObjects:RGB_COLOR(255, 90, 121), RGB_COLOR(255, 46, 85), nil];
    self.badgeSymbolFont = [UIFont textDefaultFontWithSize:10];
    self.badgeSymbolColor = [UIColor whiteColor];
}

- (void)createTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)customizeUI
{
    [self setCornerRadius:self.backgroundCornerRadius];
    self.colors = self.gradientColors;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = self.badgeSymbolColor;
    self.titleLabel.font = self.badgeSymbolFont;
    UILabel *title = self.titleLabel;
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

- (CGSize)intrinsicContentSize
{
    if (self.hidden) {
        return CGSizeZero;
    }
    
    CGSize labelSize = [self.titleLabel intrinsicContentSize];
    labelSize.height = self.badgeHeight;
    labelSize.width = MAX(labelSize.width + 4.0f, 13.0f);
    return labelSize;
}

- (UIView *)viewForBaselineLayout
{
    return self.titleLabel;
}

#pragma mark - badge value

- (void)setBadgeValue:(NSString *)bagdeValue
{
    self.hidden = bagdeValue.length == 0;
    self.titleLabel.text = bagdeValue;
    [self invalidateIntrinsicContentSize];
}

- (NSString *)badgeValue
{
    return self.titleLabel.text;
}


#pragma mark - corner radius

- (void)setBackgroundCornerRadius:(NSInteger)bgCornerRadius
{
    _backgroundCornerRadius = bgCornerRadius;
    [self setCornerRadius:bgCornerRadius];
}


#pragma mark - gradient

- (void)setGradientColors:(NSArray *)gradientColors
{
    _gradientColors = gradientColors;
    self.colors = gradientColors;
}


#pragma mark - badhe color

- (void)setBadgeSymbolColor:(UIColor *)badgeSymbolColor
{
    _badgeSymbolColor = badgeSymbolColor;
    self.titleLabel.textColor = badgeSymbolColor;
}

#pragma mark - font

- (void)setBadgeSymbolFont:(UIFont *)badgeSymbolFont
{
    _badgeSymbolFont = badgeSymbolFont;
    self.titleLabel.font = badgeSymbolFont;
    [self invalidateIntrinsicContentSize];
}

@end
