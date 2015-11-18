//
//  JVAView.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "JVAView.h"
#import "Theme.h"

@implementation JVAView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setWantsLayer:YES];
        //self.layer.backgroundColor = [NSColor colorWithCalibratedRed:1 green:1 blue:1 alpha:0.2].CGColor;
        self.layer.borderColor = [Theme foregroundColor].CGColor;
        self.layer.borderWidth = 2;
    }
    return self;
}

@end
