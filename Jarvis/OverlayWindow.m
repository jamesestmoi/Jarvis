//
//  OverlayWindow.m
//  Jarvis
//
//  Created by James Pickering on 11/15/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "OverlayWindow.h"
#import "NSImage+ResizeImage.h"

@implementation OverlayWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSRect windowFrame = NSMakeRect(0, 0, [[NSScreen mainScreen] frame].size.width, [[NSScreen mainScreen] frame].size.height + 22);
        
        //NSRect windowFrame = NSMakeRect(0, 0, 400, 400);
        
        [self setFrame:windowFrame display:YES];
        [self setLevel:CGShieldingWindowLevel()];
        [self setMovableByWindowBackground:NO];
        [self setMovable:NO];
        //[self setBackgroundColor:[NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1]];
        
        self.styleMask = NSBorderlessWindowMask;
        self.alphaValue = 0;
        
        [self drawBackground];
    }
    return self;
}

- (BOOL)canBecomeMainWindow {
    return YES;
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)drawBackground {
    
    NSURL *desktopImageURL = [[NSWorkspace sharedWorkspace] desktopImageURLForScreen:[NSScreen mainScreen]];
    NSImage *desktopImage = [[[NSImage alloc] initWithContentsOfURL:desktopImageURL] resize:self.frame.size];
    NSImageView *desktopImageView = [[NSImageView alloc] initWithFrame:self.frame];
    
    desktopImageView.image = desktopImage;
    [desktopImageView setWantsLayer:YES];
    
    [self.contentView addSubview:desktopImageView];
    
    NSVisualEffectView *blurredView = [[NSVisualEffectView alloc] initWithFrame:self.frame];
    
    [blurredView setWantsLayer:YES];
    
    blurredView.material = NSVisualEffectMaterialDark;
    blurredView.blendingMode = NSVisualEffectBlendingModeWithinWindow;
    
    [self.contentView addSubview:blurredView];
    [self.contentView setWantsLayer:YES];
}

@end
