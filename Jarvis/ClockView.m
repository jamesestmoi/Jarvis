//
//  ClockView.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "ClockView.h"
#import <PureLayout/PureLayout.h>
#import "Theme.h"
#import "TicView.h"

@implementation ClockView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.timeLabel = [[NSTextView alloc] init];
        
        [self addSubview:self.timeLabel];
        
        //[self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
        //[self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        //[self.timeLabel autoCenterInSuperview];
        
        [self.timeLabel setString:@"3:14 PM"];
        [self.timeLabel setEditable:NO];
        [self.timeLabel setTextColor:[Theme foregroundColor]];
        [self.timeLabel setAlignment:NSTextAlignmentCenter];
        //NSLog(@"%@",[[[NSFontManager sharedFontManager] availableFontFamilies] description]);
        [self.timeLabel setFont:[NSFont fontWithName:@"Roboto Condensed" size:40]];
        [self.timeLabel setBackgroundColor:[NSColor clearColor]];
        
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        
        [self.timeLabel sizeToFit];
        [self.timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:-self.timeLabel.frame.size.height / 2];
        
        [self refreshClock];
    }
    return self;
}

- (BOOL)wantsDefaultClipping {
    
    return NO;
}

- (void)setFrame:(NSRect)frame {
    
    [super setFrame:frame];
    
    double numberOfTics = 12;
    for (double i = 0; i < numberOfTics; i++) {
        
        double n = i / numberOfTics;
        double drad = n * 2 * M_PI;
        double ddeg = n * 360;
        
        double r = frame.size.height / 2;
        
        TicView *tic = [[TicView alloc] init];
        
        [tic setWantsLayer:YES];
        [tic.layer setBackgroundColor:[Theme foregroundColor].CGColor];
        
        [self addSubview:tic];
        
        CGFloat l = 8;
        CGFloat h = 2;
        
        [tic autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:-sin(drad) * r - -sin(drad) * l - h / 2];
        [tic autoAlignAxis:ALAxisVertical toSameAxisOfView:self withOffset:cos(drad) * r - cos(drad) * l + l / 2];
        [tic autoSetDimensionsToSize:CGSizeMake(l, h)];
        
        [tic setFrameRotation:ddeg];
    }
}

- (void)refreshClock
{
    NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"h:mm a"];
    
    NSString *timeString = [formatter stringFromDate:now];
    
    dispatch_async(dispatch_get_main_queue(),^{
        
        [self.timeLabel setString:timeString];
    });
    
    [self performSelector:@selector(refreshClock) withObject:nil afterDelay:60];
}

@end
