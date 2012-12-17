//
//  AllEventsViewController.m
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import "AllEventsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AllEventsViewController ()

@end

@implementation AllEventsViewController
@synthesize allEventsTable;
@synthesize mondayArray;
@synthesize tuesdayArray;
@synthesize wednesdayArray;
@synthesize thursdayArray;
@synthesize fridayArray;
@synthesize mondayView;
@synthesize tuesdayView;
@synthesize wednesdayView;
@synthesize thursdayView;
@synthesize fridayView;
@synthesize todayDay;
@synthesize todayView;
@synthesize dayViewConenction;

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
    mondayArray = [[NSMutableArray alloc] init];
    tuesdayArray = [[NSMutableArray alloc] init];
    wednesdayArray = [[NSMutableArray alloc] init];
    thursdayArray = [[NSMutableArray alloc] init];
    fridayArray = [[NSMutableArray alloc] init];
    dayViewConenction = [[NSMutableDictionary alloc] initWithCapacity:10];
    [mondayArray removeAllObjects];
    [tuesdayArray removeAllObjects];
    [wednesdayArray removeAllObjects];
    [thursdayArray removeAllObjects];
    [fridayArray removeAllObjects];
    [dayViewConenction removeAllObjects];
    [self sortIntoDays];
    [allEventsTable reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sortIntoDays {
    [dayViewConenction setObject:mondayView forKey:@"Monday"];
    [dayViewConenction setObject:tuesdayView forKey:@"Tuesday"];
    [dayViewConenction setObject:wednesdayView forKey:@"Wednesday"];
    [dayViewConenction setObject:thursdayView forKey:@"Thursday"];
    [dayViewConenction setObject:fridayView forKey:@"Friday"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE"];
    mondayView.layer.masksToBounds = YES;
    mondayView.layer.cornerRadius = 5;
    todayDay = [dateFormat stringFromDate:[[NSDate alloc] init]];
    todayView = [dayViewConenction objectForKey:todayDay];
    todayView.backgroundColor = [UIColor blackColor];
    CommonArrays *ca = [CommonArrays getCommonArrays];
    for (Event *tmpEvent in ca.allEventsArray) {
        [dateFormat setDateFormat:@"yyyy"];
        NSArray *arr = [tmpEvent.date componentsSeparatedByString:@" "];
        NSString *dateString = [NSString stringWithFormat:@"%@ %@, %@", [arr objectAtIndex:0], [arr objectAtIndex:1], [dateFormat stringFromDate:[[NSDate alloc] init]]];
        [dateFormat setDateFormat:@"LLLL dd, yyyy"];
        NSDate *theDate = [dateFormat dateFromString:dateString];
        [dateFormat setDateFormat:@"EEEE"];        
        NSLog(@"day %@", [dateFormat stringFromDate:theDate]);
        if ([[dateFormat stringFromDate:theDate] isEqualToString:@"Monday"]) {
            [mondayArray addObject:tmpEvent];
        } else if ([[dateFormat stringFromDate:theDate] isEqualToString:@"Tuesday"]) {
            [tuesdayArray addObject:tmpEvent];
        } else if ([[dateFormat stringFromDate:theDate] isEqualToString:@"Wednesday"]) {
            [wednesdayArray addObject:tmpEvent];
        } else if ([[dateFormat stringFromDate:theDate] isEqualToString:@"Thursday"]) {
            [thursdayArray addObject:tmpEvent];
        } else if ([[dateFormat stringFromDate:theDate] isEqualToString:@"Friday"]) {
            [fridayArray addObject:tmpEvent];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AllEventTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AllEventsTableCellView" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    CommonArrays *ca = [CommonArrays getCommonArrays];
    Event *tmpEvent = nil;
    switch (indexPath.section) {
        case 0:
            tmpEvent = [mondayArray objectAtIndex:indexPath.row];
            break;
        case 1:
            tmpEvent = [tuesdayArray objectAtIndex:indexPath.row];
            break;
        case 2:
            tmpEvent = [wednesdayArray objectAtIndex:indexPath.row];
            break;
        case 3:
            tmpEvent = [thursdayArray objectAtIndex:indexPath.row];
            break;
        case 4:
            tmpEvent = [fridayArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    NSLog(@"tit %@", tmpEvent.title);
    cell.titleLabel.text = tmpEvent.title;
    NSArray *timeArray = [tmpEvent.date componentsSeparatedByString:@" "];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@%@, %@", [timeArray objectAtIndex:2], [timeArray objectAtIndex:3], tmpEvent.location];
    if (tmpEvent.foodPresent) {
            cell.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 81;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

// custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return mondayView;
            break;
        case 1:
            return tuesdayView;
            break;
        case 2:
            return wednesdayView;
            break;
        case 3:
            return thursdayView;
            break;
        case 4:
            return fridayView;
            break;
        default:
            break;
    };
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [mondayArray count];
            break;
        case 1:
            return [tuesdayArray count];
            break;
        case 2:
            return [wednesdayArray count];
            break;
        case 3:
            return [thursdayArray count];
            break;
        case 4:
            return [fridayArray count];;
            break;
        default:
            break;
    };
}

@end
