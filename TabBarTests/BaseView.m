

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUIAfterInitWithoutNib];
        [self customizeUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUIAfterNib];
    [self customizeUI];
}

- (void)setupUIAfterInitWithoutNib
{
    
}

- (void)setupUIAfterNib
{
    
}

- (void)customizeUI
{
    
}

@end
