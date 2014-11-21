

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    self.clipsToBounds = YES;
}

@end
