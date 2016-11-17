//
//  PARTag.h
//  PARTagPicker
//
//  Created by Manuel Gomes on 17/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARTagColorReference.h"

@interface PARTag : NSObject

- (instancetype) initWithText:(NSString *)text;

- (instancetype) init:(NSString *) tagID withText:(NSString *)text;

- (instancetype) init:(NSString *) tagID withText:(NSString *)text andColorReference:(PARTagColorReference *) colorReference;

@property (nonatomic, strong) NSString *tagID;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) PARTagColorReference *colorReference;

@end
