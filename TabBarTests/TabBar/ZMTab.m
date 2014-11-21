#import "ZMTab.h"
#import "BadgeView.h"
#import "UIView+CornerRadius.h"

NSString *const kZMTabBackgroundImageNormalState = @"ZMTabBackgroundImageNormalState";
NSString *const kZMTabBackgroundImageHighlightedState = @"ZMTabBackgroundImageHighlightedState";

NSString *const kZMTabImageHighlightedState = @"ZMTabImageHighlightedState";
NSString *const kZMTabImageNormalState = @"ZMTabImageNormalState";

@interface ZMTab ()

@property (nonatomic, strong) BadgeView *badgeView;
@property (nonatomic, strong) UIView *badgePlaceHolderView;

@end

@implementation ZMTab

- (instancetype)initWithDictionary:(NSDictionary *)styleInfo
{
    self = [super init];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.backgroundColor = [UIColor clearColor];
        self.exclusiveTouch = YES;
        
        [self setBackgroundImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabBackgroundImageNormalState]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabBackgroundImageHighlightedState]] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabBackgroundImageHighlightedState]] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabBackgroundImageHighlightedState]] forState:UIControlStateHighlighted | UIControlStateSelected];
        
        [self setImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabImageNormalState]] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabImageHighlightedState]] forState:UIControlStateSelected];
        [self setImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabImageHighlightedState]] forState:UIControlStateHighlighted];
        [self setImage:[UIImage imageNamed:[styleInfo objectForKey:kZMTabImageHighlightedState]] forState:UIControlStateHighlighted | UIControlStateSelected];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if ([_badgeValue isEqualToString:badgeValue] == NO) {
        _badgeValue = badgeValue;
        
        if ([badgeValue length] == 0) {
            [self.badgeView removeFromSuperview];
            self.badgeView = nil;
            return;
        }
        else if (self.badgeView == nil) {
            [self createBadge];
        }
        self.badgeView.badgeValue = badgeValue;
    }
}

- (void)createBadge
{
    self.badgePlaceHolderView = [[UIView alloc] init];
    [self.badgePlaceHolderView setCornerRadius:3];
    self.badgePlaceHolderView.backgroundColor = RGB_COLOR(240, 240, 240); // Hard Coded Colors
    self.badgePlaceHolderView.userInteractionEnabled = NO;
    [self addSubview:self.badgePlaceHolderView];
    
    self.badgeView = [[BadgeView alloc] init];
    self.badgeView.gradientColors = @[RGB_COLOR(226, 61, 44), RGB_COLOR(226, 61, 44)]; // Hard Coded Colors
    self.badgeView.userInteractionEnabled = NO;
    [self.badgePlaceHolderView addSubview:self.badgeView];
    
    UIView *badge = self.badgeView;
    UIView *badgeHolder = self.badgePlaceHolderView;
    [badgeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-6);
        make.trailing.equalTo(@-14);
    }];
    
    [badge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-2);
        make.trailing.equalTo(@-2);
        make.top.equalTo(@2);
        make.leading.equalTo(@2);
    }];
}

@end
