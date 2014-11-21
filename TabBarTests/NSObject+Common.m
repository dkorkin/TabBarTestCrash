

#import "NSObject+Common.h"

@implementation NSObject (Common)

+ (NSString *)className
{
    return NSStringFromClass(self);
}

- (NSString *)className
{
    return [[self class] className];
}

@end
