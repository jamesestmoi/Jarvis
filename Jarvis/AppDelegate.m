//
//  AppDelegate.m
//  Jarvis
//
//  Created by James Pickering on 11/15/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "AppDelegate.h"
#import "OverlayWindow.h"

@interface AppDelegate ()

@property (strong) NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.window = [[OverlayWindow alloc] init];
    
    self.window.alphaValue = 0;
    
    [self.window makeKeyAndOrderFront:self];
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.window.animator.alphaValue = 1;
    } completionHandler:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
