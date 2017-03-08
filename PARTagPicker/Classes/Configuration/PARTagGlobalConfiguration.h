//
//  PARTagGlobalConfiguration.h
//  PARTagPicker
//
//  Created by Manuel Gomes on 18/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PARTagGlobalConfiguration : NSObject{
    CGFloat borderWidth;
    CGFloat cornerRadius;
}

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) CGFloat cornerRadius;

+ (PARTagGlobalConfiguration *)sharedManager;

@end



