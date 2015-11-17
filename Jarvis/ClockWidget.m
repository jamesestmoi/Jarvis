//
//  ClockWidget.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "ClockWidget.h"

@implementation ClockWidget

+ (instancetype)instance {
        
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super
            init];
    if (self) {
        
    }
    return self;
}

@end
