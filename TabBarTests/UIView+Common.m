
#import "UIView+Common.h"

@implementation UIView (Common)

+ (instancetype)loadFromDefaultNib
{
    return [self loadFromNibWithName:[self className] bundle:nil owner:self options:nil];
}

+ (instancetype)loadFromNibWithName:(NSString *)nibName
{
    return [self loadFromNibWithName:nibName bundle:nil owner:self options:nil];
}

+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    return [self loadFromNibWithName:nibName bundle:bundle owner:self options:nil];
}

+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundle owner:(id)owner
{
    return [self loadFromNibWithName:nibName bundle:bundle owner:owner options:nil];
}

+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundleOrNil owner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil
{
    return [[[UINib nibWithNibName:nibName bundle:bundleOrNil] instantiateWithOwner:ownerOrNil options:optionsOrNil] firstObject];
}

@end
