//
//  DataObjects.m
//  EECSEvents
//
//  Created by Vinit Nayak on 11/11/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import "DataObjects.h"

static CommonArrays *commonArrayObject = nil;

@implementation Event
@synthesize date;
@synthesize title;
@synthesize description;
@synthesize location;
@synthesize type;
@synthesize speaker;
@synthesize foodPresent;
@end

@implementation CommonArrays
@synthesize allEventsArray;
@synthesize hackEventsArray;
+(CommonArrays*)getCommonArrays {
    @synchronized(self) {
        if (commonArrayObject == nil)
            commonArrayObject = [[self alloc] init];
    }
    return commonArrayObject;
}
-(id)init {
    NSLog(@"initializing");
    if (self = [super init]) {
        allEventsArray = [[NSMutableArray alloc] init];
        hackEventsArray = [[NSMutableArray alloc] init];
    }
    return self;
}
@end

