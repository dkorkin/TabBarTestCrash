

#import "BaseView.h"
#import "ZMTab.h"

@protocol ZMTabBarDelegate

- (void)tabBar:(ZMTab *)aTab didSelectTabAtIndex:(NSInteger)index;

@end

@interface ZMTabBar : BaseView

@property (nonatomic, weak) id <ZMTabBarDelegate> delegate;
@property (nonatomic, strong) NSArray *tabs;
@property (nonatomic, strong) ZMTab *selectedTab;

- (void)setupBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)setupSeparatorConstraintsForState:(BOOL)isHidden;

@end

