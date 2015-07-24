//
//  RBTagPickerViewController.h
//  ResourceBooking
//
//  Created by Paul Rolfe on 7/9/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PARTagPickerViewController, PARTagColorReference;

typedef NS_ENUM(NSUInteger, PARTagPickerVisibilityState) {
    PARTagPickerVisibilityStateHidden,
    PARTagPickerVisibilityStateTopAndBottom,
    PARTagPickerVisibilityStateTopOnly,
};

@protocol PARTagPickerDelegate <NSObject>

- (void)tagPicker:(PARTagPickerViewController *)tagPicker visibilityChangedToState:(PARTagPickerVisibilityState)state;

@optional

- (void)chosenTagsWereUpdatedInTagPicker:(PARTagPickerViewController *)tagPicker;

@end


@interface PARTagPickerViewController : UIViewController

@property (nonatomic, strong) NSArray *allTags;
@property (nonatomic, strong) NSMutableArray *chosenTags;
@property (nonatomic) BOOL allowsNewTags;
@property (nonatomic) PARTagPickerVisibilityState visibilityState;
@property (nonatomic, weak) id<PARTagPickerDelegate> delegate;

//TODO: conform to UIAppearance
//TODO: Set defaults for these.
@property (nonatomic, strong) UIColor *textfieldPlaceholderTextColor;
@property (nonatomic, strong) UIColor *textfieldRegularTextColor;
@property (nonatomic, strong) UIColor *textfieldCursorColor;

@property (nonatomic, strong) PARTagColorReference *tagColorRef;

- (void)becomeFirstResponder;

@end
