

#import <UIKit/UIKit.h>
#import "ZMTab.h"
#import "ZMTabBar.h"

@class ZMTabBarController;

@protocol ZMTabBarControllerDelegate <NSObject>
@optional
- (BOOL)mh_tabBarController:(ZMTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;
- (void)mh_tabBarController:(ZMTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;
@end

@interface ZMTabBarController : UIViewController

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, weak) UIViewController *selectedViewController;

@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, weak) id <ZMTabBarControllerDelegate> delegate;

@property (nonatomic, strong) ZMTabBar *tabBar;
@property (nonatomic, assign) BOOL isTabbarHidden;

@end