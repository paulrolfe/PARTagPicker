@import UIKit;

@interface UIView (NibInitable)

/*!
 *  Initialize a view with a specified nib in the main bundle
 *
 *  @param nibNameOrNil the name of the nib or nil.  If `nil`, will use class name.  In Swift, do not use `nil` or name spacing will conflict w/ nib name.
 *
 *  @return an initialized view with the specified nib name, or nil if the nib can't be found or nib class conflicts.
 */
- (instancetype)initWithNibNamed:(NSString *)nibNameOrNil;

@end
