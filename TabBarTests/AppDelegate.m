

#import "AppDelegate.h"
#import "ViewController.h"
#import "AnimatedViewController.h"
#import "CrashPresentViewController.h"

@interface AppDelegate () <ZMTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self createTabBarController];
    
    self.tabBarController.delegate = self;
//    self.tabBarController.selectedIndex = 0;
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)createTabBarController
{
    NSArray *viewControllersMeta =  @[@"CrashPresentViewController", @"ViewController", @"AnimatedViewController", @"ViewController", @"ViewController"];
    self.tabBarController = [[ZMTabBarController alloc] init];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (NSString *metaText in viewControllersMeta) {
        
        UIViewController *controller = [[NSClassFromString(metaText) alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        [viewControllers addObject:navController];
    }
        
    self.tabBarController.viewControllers = viewControllers;
}

- (BOOL)mh_tabBarController:(ZMTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index
{
//    NSLog(@"mh_tabBarController %@ shouldSelectViewController %@ at index %lu", tabBarController, viewController, (unsigned long)index);
    
    // Uncomment this to prevent "Tab 3" from being selected.
    //return (index != 2);
    
    return YES;
}

- (void)mh_tabBarController:(ZMTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index
{
//    NSLog(@"mh_tabBarController %@ didSelectViewController %@ at index %lu", tabBarController, viewController, (unsigned long)index);
}

@end
