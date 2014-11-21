
#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@end

@interface BaseTableViewCell (PrivateUIWorking)

- (void)setupUIAfterInitWithoutNib;
- (void)setupUIAfterNib;
- (void)customizeUI;

@end
