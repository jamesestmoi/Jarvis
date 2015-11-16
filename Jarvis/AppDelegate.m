//
//  AppDelegate.m
//  Jarvis
//
//  Created by James Pickering on 11/15/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "AppDelegate.h"
#import "OverlayWindow.h"

@interface AppDelegate () <NSSpeechRecognizerDelegate>

@property (strong) OverlayWindow *window;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) NSSpeechRecognizer *speechRecognizer;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.image = [NSImage imageNamed:@"Jarvis"];
    [_statusItem.image setTemplate:YES];
    _statusItem.highlightMode = NO;
    
    self.window = [[OverlayWindow alloc] init];
    
    self.window.alphaValue = 0;
    
    [self.window makeKeyAndOrderFront:self];
    
    self.speechRecognizer = [[NSSpeechRecognizer alloc] init];
    
    [self.speechRecognizer setCommands:@[@"Hey Jarvis"]];
    [self.speechRecognizer startListening];
    [self.speechRecognizer setDelegate:self];
    [self.speechRecognizer setListensInForegroundOnly:NO];
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    
    [self.window fadeOut];
}

- (void)applicationWillBecomeActive:(NSNotification *)notification {
    
    //[self.window fadeIn];
}

- (void)speechRecognizer:(NSSpeechRecognizer *)sender didRecognizeCommand:(NSString *)command {
    
    [self.window fadeIn];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
