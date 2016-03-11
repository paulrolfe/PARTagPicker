#import "UIView+NibInitable.h"
#import "PARTagPickerViewController.h"

@implementation UIView (NibInitable)

- (instancetype)initWithNibNamed:(NSString *)nibNameOrNil {
    if (!nibNameOrNil) {
        nibNameOrNil = NSStringFromClass([self class]);
    }
    
    self = [self init]; // FIXME: Added this to appease the compiler in Xcode 7... does nothing.
    
    // To make this work with modules.
    NSString *bundlePath = [[NSBundle bundleForClass:[PARTagPickerViewController class]] pathForResource:@"PARTagPicker" ofType:@"bundle"];
    NSBundle *assetBundle = [NSBundle bundleWithPath:bundlePath];
    if (!assetBundle) {
        assetBundle = [NSBundle mainBundle];
    }
    
    NSArray *viewsInNib = [assetBundle loadNibNamed:nibNameOrNil
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
