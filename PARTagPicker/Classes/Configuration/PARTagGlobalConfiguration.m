//
//  PARTagGlobalConfiguration.m
//  PARTagPicker
//
//  Created by Manuel Gomes on 18/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTagGlobalConfiguration.h"

@implementation PARTagGlobalConfiguration

@synthesize borderWidth;
@synthesize cornerRadius;

#pragma mark Singleton Methods

+ (PARTagGlobalConfiguration *) sharedManager {
    static PARTagGlobalConfiguration *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        cornerRadius = 8;
        borderWidth = 2;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
