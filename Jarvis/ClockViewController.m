//
//  ClockViewController.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "ClockViewController.h"
#import "ClockView.h"

@interface ClockViewController ()

@end

@implementation ClockViewController

- (void)loadView {
    
    self.view = [[ClockView alloc] init];
}

@end
