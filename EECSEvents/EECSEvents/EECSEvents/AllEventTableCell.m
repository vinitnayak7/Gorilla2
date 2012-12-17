//
//  AllEventTableCell.m
//  EECSEvents
//
//  Created by Vinit Nayak on 11/11/12.
//  Copyright (c) 2012 Vinit Nayak. All rights reserved.
//

#import "AllEventTableCell.h"

@implementation AllEventTableCell
@synthesize titleLabel;
@synthesize timeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
