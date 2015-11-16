//
//  WindowService.m
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "WindowService.h"
#import "OverlayWindow.h"

@interface WindowService ()

@property (strong, nonatomic) OverlayWindow *mainWindow;
@property (strong, nonatomic) NSStatusItem *statusItem;

@end

@implementation WindowService

+ (instancetype)sharedService {
    
    static id sharedService = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    
    return sharedService;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initializeViewsAndWindows {
    
    self.mainWindow = [[OverlayWindow alloc] init];
    self.mainWindow.alphaValue = 0;
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.image = [NSImage imageNamed:@"Jarvis"];
    [self.statusItem.image setTemplate:YES];
    self.statusItem.highlightMode = NO;
}

- (void)showMainWindow {
    
    [self.mainWindow makeKeyAndOrderFront:self];
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.mainWindow, NSViewAnimationTargetKey,NSViewAnimationFadeInEffect, NSViewAnimationEffectKey, nil];
    
    [self runFadeAnimation:fadeAnimation];
}

- (void)hideMainWindow {
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.mainWindow, NSViewAnimationTargetKey,NSViewAnimationFadeOutEffect,NSViewAnimationEffectKey, nil];
    
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
    
    return 0.1;
}

@end
