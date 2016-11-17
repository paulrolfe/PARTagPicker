//
//  PARTag+Comparison.m
//  PARTagPicker
//
//  Created by Manuel Gomes on 17/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTag+Comparison.h"

@implementation PARTag (Comparison)

- (PARTag *)similarStringFromArray:(NSArray<PARTag *> *)strings{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"self LIKE %@", self];
    NSArray *similarStrings = [strings filteredArrayUsingPredicate:pred];
    return similarStrings.firstObject;
}

@end
