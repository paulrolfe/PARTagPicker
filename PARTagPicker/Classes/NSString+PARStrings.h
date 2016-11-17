//
//  NSString+PARStrings.h
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PARTag.h"

@interface NSString (PARStrings)

- (BOOL)similarStringFromArray:(NSArray<PARTag *> *)strings;

@end
