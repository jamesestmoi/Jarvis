//
//  NSImage+ResizeImage.h
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (ResizeImage)

- (NSImage *)resize:(NSSize)size;

@end
