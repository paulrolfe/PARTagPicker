//
//  PARTag+Comparison.m
//  PARTagPicker
//
//  Created by Manuel Gomes on 17/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTag+Comparison.h"

@implementation PARTag (Comparison)

- (PARTag *)similarTagFromArray:(NSArray<PARTag *> *)tags{
    /*NSPredicate *pred = [NSPredicate predicateWithFormat:@"self LIKE %@", self];
    NSArray *similarStrings = [strings filteredArrayUsingPredicate:pred];
    return similarStrings.firstObject;*/
    
    for (int i = 0; i< tags.count ; i++){
    
        if (tags[i].tagID == self.tagID){
            return tags[i];
        }
        
    }
    
    return nil;
}

@end
