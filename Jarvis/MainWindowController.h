//
//  MainWindowController.h
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OverlayWindow.h"

@interface MainWindowController : NSWindowController

@property (nullable, strong) OverlayWindow *window;

/**
 *  Shows the Jarvis main window
 */
- (void)showWindow;

/**
 *  Hides the Jarvis main window
 */
- (void)hideWindow;

@end
