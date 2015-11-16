//
//  AppDelegate.m
//  Jarvis
//
//  Created by James Pickering on 11/15/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "AppDelegate.h"
#import "OverlayWindow.h"
#import "CommandService.h"
#import "WindowService.h"

@interface AppDelegate () <CommandServiceDelegate>

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [[WindowService sharedService] initializeViewsAndWindows];
    
    [[CommandService sharedService] setDelegate:self];
    [[CommandService sharedService] startListening];
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    
    [[WindowService sharedService] hideMainWindow];
}

- (void)commandService:(CommandService *)service didRecognizeCommand:(NSString *)command {
    
    if (command == kShowJarvisCommand) {
        
        [[WindowService sharedService] showMainWindow];
    }
    else if (command == kHideJarvisCommand) {
        
        [[WindowService sharedService] hideMainWindow];
    }
}

@end
