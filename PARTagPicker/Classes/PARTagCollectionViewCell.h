//
//  RBTagCollectionViewCell.h
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/24/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PARTagCollectionViewCell, PARBackspaceTextField, PARTagColorReference;

@protocol PARTagCollectionViewCellDelegate <NSObject>

@optional

- (void)editingDidChangeInTagCollectionViewCell:(PARTagCollectionViewCell *)cell;

@end

@interface PARTagCollectionViewCell : UICollectionViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet PARBackspaceTextField *phantomTextField;
@property (weak, nonatomic) id<PARTagCollectionViewCellDelegate> delegate;

@property (strong, nonatomic) PARTagColorReference *tagColorRef;


- (void)showAsChosen:(BOOL)chosen;

@end
