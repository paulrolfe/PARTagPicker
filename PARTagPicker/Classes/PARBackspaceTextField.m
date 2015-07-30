//
//  RBBackspaceTextField.m
//  ResourceBooking
//
//  Created by Anbita Siregar on 6/26/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "PARBackspaceTextField.h"

@implementation PARBackspaceTextField

- (void)deleteBackward {
    [self.backspaceDelegate textFieldDidBackspace:self];
    [super deleteBackward];
}

@end
