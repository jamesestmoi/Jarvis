//
//  JarvisApp.h
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CommandService.h"
#import "JVAViewController.h"
#import "JVAView.h"

@interface JVAWidget : NSObject <CommandServiceDelegate>

+ (instancetype)instance;

@property (strong, nonatomic, readonly) JVAView *view;

@property (strong, nonatomic) JVAViewController *viewController;

@end

