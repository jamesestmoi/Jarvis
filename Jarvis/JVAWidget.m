//
//  JarvisApp.m
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "JVAWidget.h"

@implementation JVAWidget

+ (instancetype)instance {
    
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.viewController = [[JVAViewController alloc] init];
    }
    return self;
}

- (JVAView *)view {
    
    return self.viewController.view;
}

- (void)commandService:(CommandService *)service didRecognizeCommand:(NSString *)command {
    
    
}

@end