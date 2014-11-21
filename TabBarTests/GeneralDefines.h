

#import "UIColor+ApplicationColors.h"
#import "UIFont+ApplicationFonts.h"
#import "UIImage+Additions.h"
#import "NSObject+Common.h"
#import "UIView+Common.h"
#import "UIView+KKToolKitAdditions.h"
#import "Masonry.h"

#import "AppDelegate.h"

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

//#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_SCALE [[UIScreen mainScreen] scale]

#define LocStr(str) NSLocalizedString(str, nil)

#define WEAK_SELF __block __typeof(self) __weak weakSelf = self