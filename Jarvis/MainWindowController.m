//
//  MainWindowController.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "MainWindowController.h"
#import "DashboardViewController.h"

@interface MainWindowController ()

@property (strong, nonatomic) DashboardViewController *dashboardViewController;

@end

@implementation MainWindowController

@dynamic window;

- (instancetype)initWithWindow:(NSWindow *)window {
    
    self = [super initWithWindow:window];
    
    if (self) {
        
        //self.window.alphaValue = 0;
        
        self.dashboardViewController = [[DashboardViewController alloc] init];
        [self.dashboardViewController.view setFrame:window.contentView.frame];
        
        [self showDashboard];
    }
    
    return self;
}

- (void)showDashboard {
    
    [self.window.contentView addSubview:self.dashboardViewController.view];
}

- (void)showWindow {
    
    [self.window makeKeyAndOrderFront:self];
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.window, NSViewAnimationTargetKey,NSViewAnimationFadeInEffect, NSViewAnimationEffectKey, nil];
    
    [self runFadeAnimation:fadeAnimation];
    
    [self.window makeKeyAndOrderFront:self];
}

- (void)hideWindow {
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.window, NSViewAnimationTargetKey,NSViewAnimationFadeOutEffect,NSViewAnimationEffectKey, nil];
    
    [self runFadeAnimation:fadeAnimation];
}

- (void)runFadeAnimation:(NSDictionary *)fadeAnimation {
    
    NSArray *animations = [NSArray arrayWithObjects:fadeAnimation, nil];
    NSViewAnimation *animation = [[NSViewAnimation alloc] initWithViewAnimations: animations];
    
    [animation setAnimationBlockingMode: NSAnimationBlocking];
    [animation setAnimationCurve: NSAnimationLinear];
    [animation setDuration: [self fadeDuration]];
    [animation startAnimation];
}

- (NSTimeInterval)fadeDuration {
    
    return 0.2;
}

@end
