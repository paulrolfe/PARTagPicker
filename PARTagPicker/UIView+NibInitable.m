#import "UIView+NibInitable.h"

@implementation UIView (NibInitable)
- (instancetype)initWithNibNamed:(NSString *)nibNameOrNil {
    if (!nibNameOrNil) {
        nibNameOrNil = NSStringFromClass([self class]);
    }
    NSArray *viewsInNib = [[NSBundle mainBundle] loadNibNamed:nibNameOrNil
                                                        owner:nil
                                                      options:nil];
    for (id view in viewsInNib) {
        if ([view isKindOfClass:[self class]]) {
            self = view;
            break;
        }
    }
    
    NSAssert(self != nil,
             @"Unable to initialize view of class: %@ from nib named: %@", [self class], nibNameOrNil);
    return self;
}
@end
