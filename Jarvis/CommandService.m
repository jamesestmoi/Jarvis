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

@property (strong, nonatomic) NSMutableArray<id<CommandServiceDelegate>> *delegates;

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
        
        self.delegates = [[NSMutableArray alloc] init];
        
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
    
    for (id<CommandServiceDelegate> d in self.delegates) {
        
        [d commandService:self didRecognizeCommand:command];
    }
}

- (void)addDelegate:(id<CommandServiceDelegate>)delegate {
    
    [self.delegates addObject:delegate];
}

- (void)removeDelegate:(id<CommandServiceDelegate>)delegate {
    
    [self.delegates removeObject:delegate];
}

@end
