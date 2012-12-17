//
//  AllEventsViewController.h
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataObjects.h"
#import "AllEventTableCell.h"

@interface AllEventsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *wednesdayView;
@property (strong, nonatomic) IBOutlet UIView *tuesdayView;
@property (strong, nonatomic) IBOutlet UIView *mondayView;
@property (strong, nonatomic) IBOutlet UIView *thursdayView;

@property (weak, nonatomic) NSString *todayDay;
@property (strong, nonatomic) UIView *todayView;
@property (strong, nonatomic) NSMutableDictionary *dayViewConenction;

@property (strong, nonatomic) IBOutlet UIView *fridayView;
@property (weak, nonatomic) IBOutlet UITableView *allEventsTable;
@property (strong, nonatomic) NSMutableArray* mondayArray;
@property (strong, nonatomic) NSMutableArray* tuesdayArray;
@property (strong, nonatomic) NSMutableArray* wednesdayArray;
@property (strong, nonatomic) NSMutableArray* thursdayArray;
@property (strong, nonatomic) NSMutableArray* fridayArray;
@end
