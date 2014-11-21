
#import "ViewController.h"
#import "SecondViewController.h"
#import "AnimatedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)loadView
//{
//    [super loadView];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *colors = @[[UIColor yellowColor], [UIColor redColor], [UIColor grayColor], [UIColor blueColor]];
    UIColor *color = colors[arc4random() % 4];
    self.view.backgroundColor = color;
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
//    NSLog(@"%@ willMoveToParentViewController %@", self.title, parent);
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    [super didMoveToParentViewController:parent];
//    NSLog(@"%@ didMoveToParentViewController %@", self.title, parent);
}


- (IBAction)buttonPressed:(id)sender {
    AnimatedViewController *vc = [[AnimatedViewController alloc] init];
//    [AppDelegateAccessor.navigationControllerAnimationController ];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)buttonHidePressed:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}


@end
