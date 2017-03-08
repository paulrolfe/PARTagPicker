//
//  RBTagPickerViewController.h
//  ResourceBooking
//
//  Created by Paul Rolfe on 7/9/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PARTagPickerViewController, PARTagColorReference;

extern CGFloat const COLLECTION_VIEW_HEIGHT;

typedef NS_ENUM(NSUInteger, PARTagPickerVisibilityState) {
    PARTagPickerVisibilityStateHidden,
    PARTagPickerVisibilityStateTopAndBottom,
    PARTagPickerVisibilityStateTopOnly,
};

@protocol PARTagPickerDelegate <NSObject>

/**
 *  Delegate method is called when tagPicker shows or hides any portion of it's view via changing it's visibility state.
 *
 *  @param tagPicker The TagPickerViewController who sent the message
 *  @param state     You can extract from this the new size of the content to display. You may want to change the dimensions of the container displaying the tag picker. Each row has a default size of 39 points.
 */
- (void)tagPicker:(PARTagPickerViewController *)tagPicker visibilityChangedToState:(PARTagPickerVisibilityState)state;

@optional

/**
 *  The chosenTags array was added to or subtracted from. Access the array with tagPicker.chosenTags
 *
 *  @param tagPicker The TagPickerViewController who sent the message
 */
- (void)chosenTagsWereUpdatedInTagPicker:(PARTagPickerViewController *)tagPicker;

@optional
/**
 * Whenever the input of the textView is changed this method is fired.
 * @param searchString which is typed into the textView.
 */
- (void)searchStringDidChange:(NSString *)searchString;

@end

/**
 *  The main component to interact with in the PARTagPicker pod. This is a view controller that will manage the tags and collection views that hold them.
 */
@interface PARTagPickerViewController : UIViewController

/**
 *  Array of strings.
 */
@property (nonatomic, strong) NSArray *allTags;

/**
 *  Array of strings.
 */
@property (nonatomic, strong) NSMutableArray *chosenTags;

/**
 *  Boolean that determines if user is allowed to type in a new tag, and add it to the chosenTags array by hitting return.
 */
@property (nonatomic) BOOL allowsNewTags;

/**
 *  enum that will help you figure the view's content size.
 */
@property (nonatomic) PARTagPickerVisibilityState visibilityState;

@property (nonatomic, weak) id<PARTagPickerDelegate> delegate;

//TODO: conform to UIAppearance

/**
 *  Setting textfield placeholder text color. Changes take place only after the views are reloaded. (Which you can force using reloadCollectionViews)
 */
@property (nonatomic, strong) UIColor *textfieldPlaceholderTextColor;
/**
 *  Setting textfield text color. Changes take place only after the views are reloaded. (Which you can force using reloadCollectionViews)
 */
@property (nonatomic, strong) UIColor *textfieldRegularTextColor;
/**
 *  Setting textfield cursor color. Changes take place only after the views are reloaded. (Which you can force using reloadCollectionViews)
 */
@property (nonatomic, strong) UIColor *textfieldCursorColor;
/**
 *  Setting fonts on all tag cells. Changes take place only after the views are reloaded. (Which you can force using reloadCollectionViews)
 */
@property (nonatomic, strong) UIFont *font;

/**
 *  See PARTagColorReference for more details. This is a class of object that makes it easy to change the color of the tag cells.
 */
@property (nonatomic, strong) PARTagColorReference *tagColorRef;

/**
 *  The default text to have as placeholder text in each tag cell. Default value is @"Add a tag".
 */
@property (nonatomic, strong) NSString *placeholderText;

/**
 *  Defaults to YES. If set to NO, tapping a cell will just select it (not delete it).
 */
@property (nonatomic) BOOL tapToEraseTags;

/**
 *  Defaults to YES. If set to NO, the cells will not be non interactive. Scrolling will work, but tapping will have no effect and the textfield won't appear.
 */
@property (nonatomic) BOOL textfieldEnabled;

/**
 *  Defaults to YES. If set to NO, the bottom row of selectable options will not appear automatically. This can be used to allow you to take control of when rows are shown manually.
 
    When set to YES, if the top row is tapped. The bottom row of the `availableTags` will animate in and the top row of `chosenTags` will become editable by tapping or keyboard depending on other settings.
 
    When set to NO, changes will only happen when you explicitly change the visibilityState.
 */
@property (nonatomic) BOOL shouldAutomaticallyChangeVisibilityState;


/**
 *  Opens the visibility state to TopAndBottom and puts the cursor as active in the textfield cell.
 */
- (void)becomeFirstResponder;

/**
 *  Forces the collectionviews to reload. Intended use is primarily if the textfield colors are changed. 
 
 WARNING: Removes any text in the textfield cell.
 */
- (void)reloadCollectionViews;

@end
