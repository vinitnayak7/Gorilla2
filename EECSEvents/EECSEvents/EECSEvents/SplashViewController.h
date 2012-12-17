//
//  SplashViewController.h
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"
#import "DataObjects.h"

@interface SplashViewController : UIViewController <NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableData* responseData;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@end
