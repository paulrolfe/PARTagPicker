//
//  ViewController.m
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import "ViewController.h"
#import "PARTagPickerViewController.h"
#import "PARTagColorReference.h"
#import "PARTag.h"
#import "PARTagGlobalConfiguration.h"

@interface ViewController () <PARTagPickerDelegate>

@property (nonatomic, strong) PARTagPickerViewController *tagPicker;
@property (nonatomic, strong) NSArray *allTags;
@property (nonatomic, strong) NSArray *preChosenTags;

@property (nonatomic, strong) NSMutableArray<PARTag *> *allTagsCreated;
@property (nonatomic, strong) NSMutableArray<PARTag *> *allTagsPreChosen;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDummyData];
    [self addTagPickerToView];
}

- (void)initDummyData {
    
    NSArray *allTags = @[@"one fish", @"two fish", @"red fish", @"blue fish", @"the cat in the hat", @"Seuss", @"in a box", @"with a fox", @"thing 1", @"thing 2"];

    _allTagsCreated = [[NSMutableArray alloc] initWithCapacity:allTags.count];
    _allTagsPreChosen
    = [NSMutableArray new];
    
    __weak ViewController *weakSelf = self;
    
    [allTags enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == 2){
            PARTag *tag = [[PARTag alloc] init:[[NSUUID UUID] UUIDString] withText:obj andColorReference: [weakSelf useCustomColors]];
            [_allTagsCreated addObject:tag];
        } else {
            PARTag *tag = [[PARTag alloc] init:[[NSUUID UUID] UUIDString] withText:obj]; // Add andColorReference: [weakSelf useCustomColors] for a custom COlor scheme for the tag
            [_allTagsCreated addObject:tag];
        }
        
        
    }];
    
    [_allTagsPreChosen insertObject:_allTagsCreated[0] atIndex:0];
    [_allTagsPreChosen insertObject:_allTagsCreated[2] atIndex:1];
    [_allTagsPreChosen insertObject:_allTagsCreated[3] atIndex:2];
    
    self.allTags = _allTagsCreated;
    self.preChosenTags = _allTagsPreChosen;
    
}

- (void)addTagPickerToView {
    
    [PARTagGlobalConfiguration sharedManager].cornerRadius = 2.0;
    
    self.tagPicker = [PARTagPickerViewController new];
    self.tagPicker.view.backgroundColor = [UIColor darkGrayColor];
    self.tagPicker.view.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), COLLECTION_VIEW_HEIGHT); //78 is the fully expanded height.
    self.tagPicker.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tagPicker.delegate = self;
    self.tagPicker.allTags = self.allTags;
    
    //optionally allow new tags to be made
    self.tagPicker.allowsNewTags = YES;
    
    //optionally set some chosen tags
    self.tagPicker.chosenTags = [self.preChosenTags mutableCopy];
    
    //optionally use custom colors using PARTagColorReference
    //self.tagPicker.tagColorRef = [self useCustomColors];
    
    //optionally set the font for all the cells
    //self.tagPicker.font = [UIFont fontWithName:@"Menlo-Regular" size:14];
    
    //optionally set default placeholder text
    //self.tagPicker.placeholderText = @"";
    
    //optionally disable the tap to remove tags
    //self.tagPicker.tapToEraseTags = NO;
    
    //optionally disable all editing
    //self.tagPicker.textfieldEnabled = NO;
    
    //optionally take control of when the bottom row shows and hides, manually.
    //self.tagPicker.shouldAutomaticallyChangeVisibilityState = NO;
    
    [self addChildViewController:self.tagPicker];
    [self.view addSubview:self.tagPicker.view];
}

- (PARTagColorReference *)useCustomColors {
    PARTagColorReference *myColors = [PARTagColorReference new];
    
    myColors.chosenTagBorderColor = [UIColor blueColor];
    myColors.chosenTagBackgroundColor = [UIColor purpleColor];
    myColors.chosenTagTextColor = [UIColor whiteColor];
    
    myColors.defaultTagBorderColor = [UIColor greenColor];
    myColors.defaultTagBackgroundColor = [UIColor orangeColor];
    myColors.defaultTagTextColor = [UIColor blackColor];
    
    myColors.highlightedTagBorderColor = [UIColor magentaColor];
    myColors.highlightedTagBackgroundColor = [UIColor yellowColor];
    myColors.highlightedTagTextColor = [UIColor blackColor];
    
    //self.tagPicker.tagColorRef = myColors;
    return myColors;
}
    
#pragma mark - PARTagPickerDelegate
- (void)tagPicker:(PARTagPickerViewController *)tagPicker visibilityChangedToState:(PARTagPickerVisibilityState)state {
    //you can adjust this view controller's view to change with the tagPicker's size change, if needed.
    CGFloat newHeight = 0;
    if (state == PARTagPickerVisibilityStateTopAndBottom) {
        newHeight = 2 * COLLECTION_VIEW_HEIGHT;
    } else if (state == PARTagPickerVisibilityStateTopOnly) {
        newHeight = COLLECTION_VIEW_HEIGHT;
    }
    CGRect frame = self.tagPicker.view.frame;
    frame.size.height = newHeight;
    
    [UIView animateWithDuration:.5 animations:^{
        self.tagPicker.view.frame = frame;
    }];
}

- (void)chosenTagsWereUpdatedInTagPicker:(PARTagPickerViewController *)tagPicker {
    //access chosen tags with tagPicker.chosenTags
}

#pragma mark - IBActions

- (IBAction)hideAllTags:(id)sender {
    self.tagPicker.visibilityState = PARTagPickerVisibilityStateHidden;
}

- (IBAction)showAllTags:(id)sender {
    self.tagPicker.visibilityState = PARTagPickerVisibilityStateTopAndBottom;
}

- (IBAction)showChosenTagsOnly:(id)sender {
    self.tagPicker.visibilityState = PARTagPickerVisibilityStateTopOnly;
}

- (IBAction)addAll:(id)sender {
    [_tagPicker setChosenTags:[self.allTags mutableCopy]];
}
- (IBAction)clearAll:(id)sender {
    [_tagPicker setChosenTags:[@[] mutableCopy]];
}

- (IBAction)setRandom:(id)sender {
    /*self.allTags = _allTagsCreated;
    self.preChosenTags = _allTagsPreChosen;*/
    [_tagPicker setChosenTags: [self.preChosenTags mutableCopy]];
}


@end
