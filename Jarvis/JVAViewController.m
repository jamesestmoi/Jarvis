//
//  JVAViewController.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "JVAViewController.h"

@implementation JVAViewController

@dynamic view;

- (void)loadView {
    
    self.view = [[JVAView alloc] init];
    
    /*[self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[NSColor colorWithCalibratedHue:1 saturation:1 brightness:1 alpha:1].CGColor];*/
}

@end
