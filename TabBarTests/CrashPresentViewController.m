

#import "CrashPresentViewController.h"

#import "NearbyLocationTutorView.h"

@interface CrashPresentViewController ()

@property (nonatomic, weak) NearbyLocationTutorView *viewLocationTutor;

@end


@implementation CrashPresentViewController

- (void)loadView
{
    [super loadView];
    [self createNearbyLocationTutorView];
}

- (void)createNearbyLocationTutorView
{
    NearbyLocationTutorView *tutorView = [[NearbyLocationTutorView alloc] init];
    [self.view addSubview:tutorView];
    self.viewLocationTutor = tutorView;
    
    UIView *superView = self.view;
    [tutorView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(0);
        make.leading.equalTo(superView.mas_leading).offset(0);
        make.bottom.equalTo(superView.mas_bottom).offset(-50);
        make.trailing.equalTo(superView.mas_trailing).offset(0);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#warning with line is cause of app crash at IOS less than 8.0
    self.topLayoutGuide; // CRASH ITEM
}

@end
