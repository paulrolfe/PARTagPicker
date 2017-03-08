//
//  PARTag+Comparison.h
//  PARTagPicker
//
//  Created by Manuel Gomes on 17/11/2016.
//  Copyright © 2016 Paul Rolfe. All rights reserved.
//

#import "PARTag.h"

@interface PARTag (Comparison)

- (PARTag *)similarTagFromArray:(NSArray<PARTag *> *)tags;

@end
