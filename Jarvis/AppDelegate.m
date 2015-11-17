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
#import "MainWindowController.h"

@interface AppDelegate () <CommandServiceDelegate>

@property (strong, nonatomic) MainWindowController *windowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    OverlayWindow *window = [[OverlayWindow alloc] init];
    
    self.windowController = [[MainWindowController alloc] initWithWindow:window];
    
    //[self.windowController showWindow];
    
    [[CommandService sharedService] addDelegate:self];
    [[CommandService sharedService] startListening];
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    
    [self.windowController hideWindow];
}

- (void)commandService:(CommandService *)service didRecognizeCommand:(NSString *)command {
    
    if (command == kShowJarvisCommand) {
        
        [self.windowController showWindow];
    }
    else if (command == kHideJarvisCommand) {
        
        [self.windowController hideWindow];
    }
}

@end
