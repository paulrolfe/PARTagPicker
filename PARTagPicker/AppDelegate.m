//
//  AppDelegate.m
//  PARTagPicker
//
//  Created by Paul Rolfe on 7/21/15.
//  Copyright (c) 2015 Paul Rolfe. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *home = [[ViewController alloc] initWithNibName:nil bundle:nil];
    //UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:home];
    self.window.rootViewController = home;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
