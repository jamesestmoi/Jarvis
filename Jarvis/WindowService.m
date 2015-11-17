//
//  WindowService.m
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "WindowService.h"
#import "MainWindowController.h"
#import "OverlayWindow.h"

@interface WindowService ()

@property (strong, nonatomic) MainWindowController *windowController;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic, readonly) OverlayWindow *window;

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

- (OverlayWindow *)window {
    
    return self.windowController.window;
}

- (void)initializeViewsAndWindows {
    
    [self makeStatusItem];
    
    OverlayWindow *window = [[OverlayWindow alloc] init];
    
    self.windowController = [[MainWindowController alloc] initWithWindow:window];
}

- (void)makeStatusItem {
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.image = [NSImage imageNamed:@"Jarvis"];
    [self.statusItem.image setTemplate:YES];
    self.statusItem.highlightMode = NO;
}

/*- (void)showMainWindow {
    
    [self.window makeKeyAndOrderFront:self];
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.window, NSViewAnimationTargetKey,NSViewAnimationFadeInEffect, NSViewAnimationEffectKey, nil];
    
    [self runFadeAnimation:fadeAnimation];
    
    [self.window makeKeyAndOrderFront:self];
}

- (void)hideMainWindow {
    
    NSDictionary *fadeAnimation = [NSDictionary dictionaryWithObjectsAndKeys: self.window, NSViewAnimationTargetKey,NSViewAnimationFadeOutEffect,NSViewAnimationEffectKey, nil];
    
    [self runFadeAnimation:fadeAnimation];
}


*/


@end
