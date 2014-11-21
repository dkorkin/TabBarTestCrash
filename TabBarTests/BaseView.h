

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@end

@interface BaseView (PrivateUIWorking)

- (void)setupUIAfterInitWithoutNib;
- (void)setupUIAfterNib;
- (void)customizeUI;

@end
