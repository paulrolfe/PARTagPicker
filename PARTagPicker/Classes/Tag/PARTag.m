//
//  PARTag.m
//  PARTagPicker
//
//  Created by Manuel Gomes on 17/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTag.h"

@implementation PARTag

- (instancetype) initWithText:(NSString *)text{

    self = [super init];
    if (self) {
        self.text = text;
        self.tagID = [[NSUUID UUID] UUIDString];
        //self.colorReference = [[PARTagColorReference alloc] initWithDefaultColors];
    }
    return self;
    
}

- (instancetype) init:(NSString *) tagID withText:(NSString *)text{
    
    self = [super init];
    if (self) {
        self.text = text;
        self.tagID = tagID;
        //self.colorReference = [[PARTagColorReference alloc] initWithDefaultColors];
    }
    return self;
    
}

- (instancetype) init:(NSString *) tagID withText:(NSString *)text andColorReference:(PARTagColorReference *) colorReference{
    
    self = [super init];
    if (self) {
        self.tagID = tagID;
        self.text = text;
        self.colorReference = colorReference;
    }
    return self;
    
}

@end
