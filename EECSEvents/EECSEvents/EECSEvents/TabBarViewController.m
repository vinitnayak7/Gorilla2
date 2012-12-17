//
//  TabBarViewController.m
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
@synthesize tabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBarController.view.frame = self.view.frame;
    [self.view addSubview:self.tabBarController.view];
    UITabBar *tabBar = self.tabBarController.tabBar;
//    CGRect frame = tabBar.frame;
//    frame.size.height = 61;
//    tabBar.frame = frame;
    tabBar.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
