

#import <UIKit/UIKit.h>

extern NSString *const kZMTabBackgroundImageNormalState;
extern NSString *const kZMTabBackgroundImageHighlightedState;

extern NSString *const kZMTabImageNormalState;
extern NSString *const kZMTabImageHighlightedState;

@interface ZMTab : UIButton

@property(nonatomic, strong) NSString *badgeValue;
@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithDictionary:(NSDictionary *)styleInfo;

@end
