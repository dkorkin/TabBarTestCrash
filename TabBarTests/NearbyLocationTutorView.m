

#import "NearbyLocationTutorView.h"
#import "LocationTutorCell.h"

@interface NearbyLocationTutorView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tutorTableView;

@property (nonatomic, strong) NSArray *tutorImages;
@property (nonatomic, strong) NSArray *tutorAttributedTexts;

@end

@implementation NearbyLocationTutorView

- (void)setupUIAfterInitWithoutNib
{
    [self createTutorTableView];
    [self createTableHeaderView];
    
    [self.tutorTableView registerClass:[LocationTutorCell class] forCellReuseIdentifier:[LocationTutorCell className]];
    
    [self fillTutorInfo];
}

- (void)createTutorTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.frame = self.bounds;
    tableView.rowHeight = 29;
    [self addSubview:tableView];
    self.tutorTableView = tableView;
}

- (void)createTableHeaderView
{
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
    
    UILabel *labelNote = [[UILabel alloc] init];
    labelNote.numberOfLines = 0;
    labelNote.lineBreakMode = NSLineBreakByWordWrapping;
    labelNote.font = [UIFont textDefaultFontWithSize:15];
    labelNote.text = @"Test Crash Situation";
    [tableHeaderView addSubview:labelNote];
    
    [labelNote mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.bottom.equalTo(@-20);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    self.tutorTableView.tableHeaderView = tableHeaderView;
}

- (void)fillTutorInfo
{
    NSDictionary *boldFontAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont textBoldFontWithSize:15], NSFontAttributeName,
                                        [UIColor blackColor], NSForegroundColorAttributeName, nil];
    
    NSString *openSettings = @"Open iPhone Settings";
    
    NSString *openSettingsBold = LocStr(@"Settings");
    
    NSMutableAttributedString *openSettingsAttributed = [[NSMutableAttributedString alloc] initWithString:openSettings];
    NSRange boldRangeForOpenSettings = [openSettings rangeOfString:openSettingsBold options:NSCaseInsensitiveSearch];
    [openSettingsAttributed setAttributes:boldFontAttributes range:boldRangeForOpenSettings];
    
    self.tutorAttributedTexts = @[openSettingsAttributed];
    self.tutorImages = @[[UIImage imageNamed:@"HomeNearByLocationTutorSettingsIcon"]];
}

- (void)customizeUI
{
    [super customizeUI];
    self.tutorTableView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    LocationTutorCell *tutorCell = [tableView dequeueReusableCellWithIdentifier:[LocationTutorCell className]];
    tutorCell.attributedTextTutor = self.tutorAttributedTexts[indexPath.row];
    tutorCell.imageTutor = self.tutorImages[indexPath.row];
    tutorCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tutorCell;
}


#pragma mark - UITableViewDelegate

@end
