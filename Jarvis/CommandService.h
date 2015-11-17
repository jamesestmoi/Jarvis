//
//  CommandService.h
//  Jarvis
//
//  Created by James Pickering on 11/16/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "Singleton.h"
#import "Commands.h"

@interface CommandService : NSObject <Singleton> @end

@protocol CommandServiceDelegate <NSObject>

/**
 *  Called when Jarvis detects a command
 *
 *  @param service shared CommandService instance
 *  @param command command title detected
 */
- (void)commandService:(CommandService *)service didRecognizeCommand:(NSString *)command;

@end

@interface CommandService ()

+ (instancetype)sharedService;

/**
 *  Start listening for commands
 */
- (void)startListening;

/**
 *  Add a command delegate
 *
 *  @param delegate delegate to add
 */
- (void)addDelegate:(id<CommandServiceDelegate>)delegate;

/**
 *  Remove a command delegate
 *
 *  @param delegate delegate to remove
 */
- (void)removeDelegate:(id<CommandServiceDelegate>)delegate;

@end