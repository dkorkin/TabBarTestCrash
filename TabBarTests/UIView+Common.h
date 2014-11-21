

#import <UIKit/UIKit.h>

@interface UIView (Common)

+ (instancetype)loadFromDefaultNib;
+ (instancetype)loadFromNibWithName:(NSString *)nibName;
+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundle;
+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundle owner:(id)owner;
+ (instancetype)loadFromNibWithName:(NSString *)nibName bundle:(NSBundle *)bundleOrNil owner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil;

@end
