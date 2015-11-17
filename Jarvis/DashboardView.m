//
//  DashboardView.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "DashboardView.h"

@implementation DashboardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setWantsLayer:YES];
        //self.layer.backgroundColor = [NSColor colorWithCalibratedRed:1 green:1 blue:1 alpha:1].CGColor;
    }
    return self;
}

@end
