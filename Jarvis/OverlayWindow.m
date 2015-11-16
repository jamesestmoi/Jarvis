//
//  OverlayWindow.m
//  Jarvis
//
//  Created by James Pickering on 11/15/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "OverlayWindow.h"

@implementation OverlayWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSRect windowFrame = NSMakeRect(0, 0, [[NSScreen mainScreen] frame].size.width, [[NSScreen mainScreen] frame].size.height + 100);
        
        [self setFrame:windowFrame display:YES];
        [self setLevel:CGShieldingWindowLevel()];
        [self setMovableByWindowBackground:NO];
        [self setMovable:NO];
        
        self.styleMask = NSBorderlessWindowMask;
        
        [self animateBlur];
    }
    return self;
}

- (BOOL)canBecomeMainWindow {
    return YES;
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)animateBlur {
    
    NSVisualEffectView *blurredView = [[NSVisualEffectView alloc] initWithFrame:self.frame];
    
    blurredView.material = NSVisualEffectMaterialUltraDark;
    blurredView.blendingMode = NSVisualEffectBlendingModeBehindWindow;
    blurredView.alphaValue = 1;
    
    [self setContentView:blurredView];
}

@end
