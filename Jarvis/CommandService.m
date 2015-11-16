//
//  CommandService.m
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "CommandService.h"

@interface CommandService () <NSSpeechRecognizerDelegate>

@property (strong, nonatomic) NSSpeechRecognizer *speechRecognizer;

@end

@implementation CommandService

+ (instancetype)sharedService {
    
    static id sharedService = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    
    return sharedService;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.speechRecognizer = [[NSSpeechRecognizer alloc] init];
        
        self.speechRecognizer.commands = [self commands];
        self.speechRecognizer.delegate = self;
        self.speechRecognizer.listensInForegroundOnly = NO;
    }
    return self;
}

- (void)startListening {
    
    [self.speechRecognizer startListening];
}

- (NSArray<NSString *> *)commands {
    
    return @[kShowJarvisCommand, kHideJarvisCommand];
}

- (void)speechRecognizer:(NSSpeechRecognizer *)sender didRecognizeCommand:(NSString *)command {
    
    [self.delegate commandService:self didRecognizeCommand:command];
}

@end
