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

@interface ViewController () <PARTagPickerDelegate>

@property (nonatomic, strong) PARTagPickerViewController *tagPicker;
@property (nonatomic, strong) NSArray *allTags;
@property (nonatomic, strong) NSArray *preChosenTags;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDummyData];
    [self addTagPickerToView];
}

- (void)initDummyData {
    //Data for demo project
    self.allTags = @[@"one fish", @"two fish", @"red fish", @"blue fish", @"the cat in the hat", @"Seuss"];
    self.preChosenTags = @[@"in a box", @"with a fox", @"thing 1", @"thing 2"];
}

- (void)addTagPickerToView {
    self.tagPicker = [[PARTagPickerViewController alloc] init];
    self.tagPicker.view.backgroundColor = [UIColor darkGrayColor];
    self.tagPicker.view.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), COLLECTION_VIEW_HEIGHT); //78 is the fully expanded height.
    self.tagPicker.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tagPicker.delegate = self;
    self.tagPicker.allTags = self.allTags;
    
    //optionally allow new tags to be made
    //self.tagPicker.allowsNewTags = YES;
    
    //optionally set some chosen tags
    //self.tagPicker.chosenTags = [self.preChosenTags mutableCopy];
    
    //optionally use custom colors using PARTagColorReference
    //[self useCustomColors];
    
    //optionally set the font for all the cells
    //self.tagPicker.font = [UIFont fontWithName:@"Menlo-Regular" size:14];
    
    [self addChildViewController:self.tagPicker];
    [self.view addSubview:self.tagPicker.view];
}

- (void)useCustomColors {
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
    
    self.tagPicker.tagColorRef = myColors;
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

@end
