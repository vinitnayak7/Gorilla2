//
//  SplashViewController.m
//  EECSEvents
//
//  Created by Vinit Nayak on 11/8/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import "SplashViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface SplashViewController ()

@end

@implementation SplashViewController
@synthesize responseData;
@synthesize titleView;

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
    CommonArrays *ca = [CommonArrays getCommonArrays];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://vinitnayak.heliohost.org/eecsevents/getAllEvents.php?"]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    titleView.layer.masksToBounds = YES;
    titleView.layer.cornerRadius = 10;
//    NSData *d = [[NSData alloc] initWithContentsOfFile:@"/Users/vinitnayak/Desktop/tmp/ios.txt"];
//    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:d options:kNilOptions error:nil];
//    NSArray *events = [jsonDict objectForKey:@"events"];
//    for (id x in events) {
//        Event *singleEvent = [[Event alloc] init];
//        singleEvent.title = [x objectForKey:@"title"];
//        if ([[[x objectForKey:@"title"] lowercaseString] rangeOfString:@"infoses"].location != NSNotFound ||
//            [[[x objectForKey:@"title"] lowercaseString] rangeOfString:@"tech talk"].location != NSNotFound) {
//            singleEvent.foodPresent = YES;
//        }
//        singleEvent.date = [x objectForKey:@"date"];
//        singleEvent.location = [x objectForKey:@"location"];
//        singleEvent.type = [x objectForKey:@"type"];
//        singleEvent.description = [x objectForKey:@"description"];
//        if ([[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"food"].location != NSNotFound ||
//            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"pizza"].location != NSNotFound ||
//            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"drinks"].location != NSNotFound ||
//            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"dinner"].location != NSNotFound) {
//            singleEvent.foodPresent = YES;
//        }
//        NSString *tmpString = [x objectForKey:@"speaker"];
//        if ([tmpString rangeOfString:@"Speaker/Performer"].location != NSNotFound) {
//            tmpString = [tmpString substringWithRange:NSMakeRange(18, [tmpString length]-18)];
//        } else if ([tmpString rangeOfString:@"Speaker"].location != NSNotFound) {
//            tmpString = [tmpString substringWithRange:NSMakeRange(8, [tmpString length]-8)];
//        }
//        singleEvent.speaker = tmpString;
//        [ca.allEventsArray addObject:singleEvent];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"didReceiveResponse");
    responseData = [[NSMutableData alloc] init];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
    [responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %d bytes of data",[responseData
                                                   length]);
    NSString *txt = [[NSString alloc] initWithData:responseData encoding: NSASCIIStringEncoding];
    NSError *jsonError;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
    if(jsonError) {
        // check the error description
        NSLog(@"json error : %@", [jsonError localizedDescription]);
    }// else {
//        NSLog(@"DICT %@", jsonDict);
//    }
    CommonArrays *ca = [CommonArrays getCommonArrays];
    NSArray *events = [jsonDict objectForKey:@"events"];
    for (id x in events) {
        Event *singleEvent = [[Event alloc] init];
        singleEvent.title = [x objectForKey:@"title"];
        if ([[[x objectForKey:@"title"] lowercaseString] rangeOfString:@"infoses"].location != NSNotFound ||
            [[[x objectForKey:@"title"] lowercaseString] rangeOfString:@"tech talk"].location != NSNotFound) {
            singleEvent.foodPresent = YES;
        }
        singleEvent.date = [x objectForKey:@"date"];
        singleEvent.location = [x objectForKey:@"location"];
        singleEvent.type = [x objectForKey:@"type"];
        singleEvent.description = [x objectForKey:@"description"];
        if ([[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"food"].location != NSNotFound ||
            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"pizza"].location != NSNotFound ||
            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"drinks"].location != NSNotFound ||
            [[[x objectForKey:@"description"] lowercaseString] rangeOfString:@"dinner"].location != NSNotFound) {
            singleEvent.foodPresent = YES;
        }
        NSString *tmpString = [x objectForKey:@"speaker"];
        if ([tmpString rangeOfString:@"Speaker/Performer"].location != NSNotFound) {
            tmpString = [tmpString substringWithRange:NSMakeRange(18, [tmpString length]-18)];
        } else if ([tmpString rangeOfString:@"Speaker"].location != NSNotFound) {
            tmpString = [tmpString substringWithRange:NSMakeRange(8, [tmpString length]-8)];
        }
        singleEvent.speaker = tmpString;
        [ca.allEventsArray addObject:singleEvent];
    }
    [NSThread sleepForTimeInterval:2.0];
    TabBarViewController *tab = [[TabBarViewController alloc] initWithNibName:@"TabBarViewController" bundle:nil];
    AppDelegate *ap = [[UIApplication sharedApplication] delegate];
    [ap switchViewController:tab];
}

@end
