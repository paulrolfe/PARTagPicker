//
//  RBTextFieldCollectionViewCell.h
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/25/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PARTextFieldCollectionViewCell, PARBackspaceTextField;

@protocol PARTextFieldCollectionViewCellDelegate <NSObject>

- (BOOL)shouldReturnFromTextFieldCollectionViewCell:(PARTextFieldCollectionViewCell *)cell;
- (void)editingDidChangeInTextFieldCollectionViewCell:(PARTextFieldCollectionViewCell *)cell;

@optional
- (void)editingInTextFieldCollectionViewCell:(PARTextFieldCollectionViewCell *)cell becameActive:(BOOL)active;

@end


@interface PARTextFieldCollectionViewCell : UICollectionViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet PARBackspaceTextField *tagTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagTextFieldWidthConstraint;
@property (weak, nonatomic) id<PARTextFieldCollectionViewCellDelegate> delegate;
@property (nonatomic) BOOL useFilteringColors;

- (void)useTextColor:(UIColor *)textColor tintColor:(UIColor *)tintColor;

@end
