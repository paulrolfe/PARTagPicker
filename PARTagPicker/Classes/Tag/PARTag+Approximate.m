//
//  PARTag+Approximate.m
//  PARTagPicker
//
//  Created by Manuel Gomes on 25/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTag+Approximate.h"

@implementation PARTag (Approximate)

- (BOOL)isEqual:(PARTag *)other
{
    if (other == self) {
        return YES;
    } /*else if (![super isEqual:other]) {
        return NO;
    }*/ else {
        return self.tagID == other.tagID;
    }
}

@end
