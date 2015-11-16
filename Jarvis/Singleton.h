//
//  Singleton.h
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol Singleton <NSObject>

+ (instancetype)sharedService;

@end
