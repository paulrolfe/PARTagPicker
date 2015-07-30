//
//  RBTagCollectionViewCell.m
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/24/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "PARTagCollectionViewCell.h"
#import "PARBackspaceTextField.h"
#import "PARTagColorReference.h"

@interface PARTagCollectionViewCell ()

@end

@implementation PARTagCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    self.layer.borderWidth = 2;
    self.selected = NO;
}

- (IBAction)textFieldEditingDidChange:(UITextField *)sender {
    [self.delegate editingDidChangeInTagCollectionViewCell:self];
    sender.text = @"";
}

- (void)showAsChosen:(BOOL)chosen {
    if (chosen) {
        self.tagLabel.textColor = self.tagColorRef.chosenTagTextColor;
        self.backgroundColor = self.tagColorRef.chosenTagBackgroundColor;
        self.layer.borderColor = self.tagColorRef.chosenTagBorderColor.CGColor;
    } else {
        self.tagLabel.textColor = self.tagColorRef.defaultTagTextColor;
        self.backgroundColor = self.tagColorRef.defaultTagBackgroundColor;
        self.layer.borderColor = self.tagColorRef.defaultTagBorderColor.CGColor;
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.tagLabel.textColor = self.tagColorRef.highlightedTagTextColor;
        self.backgroundColor = self.tagColorRef.highlightedTagBackgroundColor;
        self.layer.borderColor = self.tagColorRef.highlightedTagBorderColor.CGColor;
        [self.phantomTextField becomeFirstResponder];
    } else {
        [self showAsChosen:YES];
        [self.phantomTextField resignFirstResponder];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self setSelected:NO];
}


@end
