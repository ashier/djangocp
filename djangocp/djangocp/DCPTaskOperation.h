//
//  DCPTaskOperation.h
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DCPTaskOperation : NSOperation {
    NSTask * task;
    NSPipe * inputPipe;
    NSPipe * outputPipe;
    NSPipe * errorPipe;
    NSOperationQueue * queue;
    NSString *executablePath;
    NSString *environmentPath;
    void (^replyBlock)(int *);
    void (^dataBlock)(NSData *);
}

#pragma mark - Properties
// ----------------------------------------------------
// Properties
// ----------------------------------------------------

@property (strong) NSString *executablePath;
@property (strong) NSData *outputData;
@property (strong) NSData *errorData;

#pragma mark - Methods
// ----------------------------------------------------
// Methods
// ----------------------------------------------------

+ (NSString *)executableBinPath;
- (void)initTask;
- (void)launch;
- (void)launch:(void (^)(NSData *))data withReply:(void (^)(int *))reply;
- (void)launchWithParameters: (NSArray *) parameters;
#pragma mark - NSTask protocols
// ----------------------------------------------------
// NSTask Protocols
// ----------------------------------------------------

- (void)setArguments: (NSArray*) arguments;
- (NSArray *)arguments;
- (void)setCurrentDirectoryPath: (NSString *)path;
- (NSString*)currentDirectoryPath;
- (void)setEnvironment: (NSDictionary *)environmentDictionary;
- (NSDictionary*)environment;
- (void)setLaunchPath: (NSString *)path;
- (NSString*)launchPath;
- (void)setStandardInput: (NSPipe*) inputPipe;
- (id)standardInput;
- (id)standardOutput;
- (id)standardError;
- (int)processIdentifier;
- (int)terminationStatus;
- (BOOL)isRunning;

@end
