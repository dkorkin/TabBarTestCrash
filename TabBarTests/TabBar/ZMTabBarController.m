

#import "ZMTabBarController.h"

#define tabBarHeight 49

@interface ZMTabBarController () <ZMTabBarDelegate>

@property (nonatomic, strong) UIView *contentContainerView;

@end

@implementation ZMTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedIndex = NSNotFound;
    [self createTabBar];
    [self createContentController];
    if (![self selectedViewController] && self.viewControllers.count > 0) {
        self.selectedViewController = self.viewControllers[0];
    }
}

- (void)createTabBar
{
    NSMutableArray *tabs = [NSMutableArray new];
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"TabBarGraphics" ofType:@"plist"];
    NSArray *tabBarGraphics = [NSArray arrayWithContentsOfFile:plistPath];
    
    for (int i = 0; i < [tabBarGraphics count]; i++) {
        NSDictionary *tabStyle = tabBarGraphics[i];
        ZMTab *tab = [[ZMTab alloc] initWithDictionary:tabStyle];
        [tabs addObject:tab];
    }
    
    ZMTabBar *tabBar = [[ZMTabBar alloc] init];
    tabBar.delegate = self;
    self.tabBar = tabBar;
    [self.view addSubview:tabBar];
    UIView *view = self.view;
    [tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.height.equalTo(@(tabBarHeight));
        make.trailing.equalTo(view.mas_trailing).offset(0);
        make.leading.equalTo(view.mas_leading).offset(0);
    }];
    tabBar.tabs = tabs;
}

- (void)createContentController
{
    self.contentContainerView = [[UIView alloc] init];
    [self.view insertSubview:self.contentContainerView belowSubview:self.tabBar];
    //    self.contentContainerView.layer.borderColor = [UIColor blackColor].CGColor;
    //    self.contentContainerView.layer.borderWidth = 4.0;
    
//    UIView *topLayoutGuide = (id)self.topLayoutGuide;
    UIView *tabBar = self.tabBar;
    UIView *view = self.view;
    
    [self.contentContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(view.mas_trailing).offset(0);
        make.leading.equalTo(view.mas_leading).offset(0);
        make.top.equalTo(view.mas_top).offset(0);
        make.bottom.equalTo(tabBar.mas_top).offset(0);
    }];
    
    //    self.contentContainerView.backgroundColor = [UIColor greenColor];
}

- (void)tabBar:(ZMTab *)aTab didSelectTabAtIndex:(NSInteger)index
{
    if (index == 2) {
        [self setSelectedIndex:index animated:YES];
    }
    [self setSelectedIndex:index animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    for (UIViewController *viewController in self.viewControllers) {
        if (![viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation]) {
            return NO;
        }
    }
    return YES;
}

- (void)setSelectedIndex:(NSUInteger)newSelectedIndex
{
    [self setSelectedIndex:newSelectedIndex animated:NO];
}


- (void)setSelectedIndex:(NSUInteger)newSelectedIndex animated:(BOOL)animated
{
    if (newSelectedIndex < [self.viewControllers count]) {
        if ([self.delegate respondsToSelector:@selector(mh_tabBarController:shouldSelectViewController:atIndex:)]) {
            UIViewController *toViewController = (self.viewControllers)[newSelectedIndex];
            if (![self.delegate mh_tabBarController:self shouldSelectViewController:toViewController atIndex:newSelectedIndex]) {
                return;
            }
        }
        
        if (![self isViewLoaded]) {
            _selectedIndex = newSelectedIndex;
        }
        else if (_selectedIndex != newSelectedIndex) {
            UIViewController *fromViewController;
            UIViewController *toViewController;
            
            if (_selectedIndex != NSNotFound) {
                fromViewController = self.selectedViewController;
            }
            _selectedIndex = newSelectedIndex;
            
            if (_selectedIndex != NSNotFound) {
                toViewController = self.selectedViewController;
            }
            
            if (toViewController == nil)  // don't animate
            {
                [fromViewController.view removeFromSuperview];
            }
            else if (fromViewController == nil)  // don't animate
            {
                [self.contentContainerView addSubview:toViewController.view];
                [self setInitialConstraintsToView:toViewController.view];
                
                if ([self.delegate respondsToSelector:@selector(mh_tabBarController:didSelectViewController:atIndex:)]) {
                    [self.delegate mh_tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
                }
            }
            else if (animated)
            {
                self.tabBar.userInteractionEnabled = NO;
                [self.contentContainerView addSubview:toViewController.view];
                [self setInitialConstraintsToView:toViewController.view];
                [self hideView:fromViewController.view];
                
                toViewController.view.alpha = 0.0;
                [UIView animateWithDuration:0.35 animations:^{
                    toViewController.view.alpha = 1.0;
                    [fromViewController.view layoutIfNeeded];
                } completion:^(BOOL finished) {
                    [fromViewController.view removeFromSuperview];
                    self.tabBar.userInteractionEnabled = YES;
                }];
            }
            else
            {
                [fromViewController.view removeFromSuperview];
                [self.contentContainerView addSubview:toViewController.view];
                [self setInitialConstraintsToView:toViewController.view];
                
                if ([self.delegate respondsToSelector:@selector(mh_tabBarController:didSelectViewController:atIndex:)]) {
                    [self.delegate mh_tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
                }
            }
        }
    }
    else {
        _selectedIndex = newSelectedIndex;
    }
}

- (void)setInitialConstraintsToView:(UIView *)view
{
    UIView *containerView = self.contentContainerView;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(containerView.mas_trailing).offset(0);
        make.leading.equalTo(containerView.mas_leading).offset(0);
        make.top.equalTo(containerView.mas_top).offset(0);
        make.bottom.equalTo(containerView.mas_bottom).offset(0);
    }];
}

- (void)hideView:(UIView *)view
{
    UIView *containerView = self.contentContainerView;
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(containerView.mas_trailing).offset(0);
        make.leading.equalTo(containerView.mas_leading).offset(0);
        make.top.equalTo(containerView.mas_bottom).offset(0);
    }];
    
}


#pragma mark - setters/getters

#pragma mark - controllers

- (void)setViewControllers:(NSArray *)newViewControllers
{
    NSAssert([newViewControllers count] >= 2, @"MHTabBarController requires at least two view controllers");
    
    UIViewController *oldSelectedViewController = self.selectedViewController;
    
    for (UIViewController *viewController in _viewControllers) {
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    
    _viewControllers = [newViewControllers copy];
    
    NSUInteger newIndex = [_viewControllers indexOfObject:oldSelectedViewController];
    if (newIndex != NSNotFound) {
        _selectedIndex = newIndex;
    } else if (newIndex < [_viewControllers count]) {
        _selectedIndex = newIndex;
    } else {
        _selectedIndex = 0;
    }
    
    for (UIViewController *viewController in _viewControllers) {
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
    }
}

#pragma mark - selected controller

- (UIViewController *)selectedViewController
{
    if (self.selectedIndex != NSNotFound) {
        return (self.viewControllers)[self.selectedIndex];
    }
    return nil;
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController
{
    [self setSelectedViewController:newSelectedViewController animated:NO];
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController animated:(BOOL)animated
{
    NSUInteger index = [self.viewControllers indexOfObject:newSelectedViewController];
    if (index != NSNotFound) {
        [self setSelectedIndex:index];
        [self.tabBar selectTabAtIndex:index];
    }
}

#pragma mark - tabbar hiden

- (void)setIsTabbarHidden:(BOOL)isTabbarHidden
{
    _isTabbarHidden = isTabbarHidden;
    UIView *tabBar = self.tabBar;
    self.tabBar.hidden = isTabbarHidden;
    if (isTabbarHidden) {
        [self.tabBar setupSeparatorConstraintsForState:isTabbarHidden];
    }
    
    self.tabBar.hidden = isTabbarHidden;
    
    [tabBar mas_updateConstraints:^(MASConstraintMaker *make) {
        if (isTabbarHidden) {
            make.height.equalTo(@0);
        }
        else {
            make.height.equalTo(@(tabBarHeight));
        }
    }];
    [self.view layoutIfNeeded];
    if (!isTabbarHidden) {
        [self.tabBar setupSeparatorConstraintsForState:isTabbarHidden];
    }
}

@end
