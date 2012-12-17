//
//  AppDelegate.h
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllEventsViewController.h"
#import "TabBarViewController.h"
#import "SplashViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SplashViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

-(void)switchViewController:(UIViewController *)cnt;

@end
