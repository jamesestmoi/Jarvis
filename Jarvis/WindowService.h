//
//  WindowService.h
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "Singleton.h"

@interface WindowService : NSObject <Singleton>

+ (instancetype)sharedService;

/**
 *  Initializes the Jarvis main window
 */
- (void)initializeViewsAndWindows;

/**
 *  Shows the Jarvis main window
 */
- (void)showMainWindow;

/**
 *  Hides the Jarvis main window
 */
- (void)hideMainWindow;

@end
