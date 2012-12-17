//
//  DataObjects.h
//  EECSEvents
//
//  Created by Vinit Nayak on 11/11/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* type;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* date;
@property (strong, nonatomic) NSString* speaker;
@property BOOL foodPresent;
@end

@interface CommonArrays : NSObject
@property (strong, nonatomic) NSMutableArray* allEventsArray;
@property (strong, nonatomic) NSMutableArray* hackEventsArray;
+(CommonArrays*)getCommonArrays;
+(id)init;
@end