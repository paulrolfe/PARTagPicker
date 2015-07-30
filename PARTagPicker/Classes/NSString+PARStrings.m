//
//  NSString+PARStrings.m
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import "NSString+PARStrings.h"

@implementation NSString (PARStrings)

- (NSString *)similarStringFromArray:(NSArray *)strings {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"self LIKE %@", self];
    NSArray *similarStrings = [strings filteredArrayUsingPredicate:pred];
    return similarStrings.firstObject;
}

@end
