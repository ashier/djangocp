//
//  DCPTaskOperation.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPTaskOperation.h"
#import "DCPUserDefaultKeys.h"

@implementation DCPTaskOperation

#define EXECUTABLE_BIN @".djangocp/bin"

// ----------------------------------------------------
// Synthesize Operations
// ----------------------------------------------------

@synthesize outputData, executablePath;

#pragma mark - Initialization
// ----------------------------------------------------
// Initialization
// ----------------------------------------------------

-(id) init {
    if (self = [super init]){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableString *path = [[NSMutableString alloc] initWithString:[defaults valueForKey:[DCPUserDefaultKeys workspacePath]]];
        [path appendString:@"/"];
        [path appendString:EXECUTABLE_BIN];
        
        environmentPath = [defaults valueForKey:[DCPUserDefaultKeys workspacePath]];
        executablePath = path;
        [self initTask];
    }
    return self;
}

- (void)main {
    
}

- (void)initTask {
    [self cleanup];
    
    task = [[NSTask alloc] init];
    [task setCurrentDirectoryPath: environmentPath];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleThreadedTaskTermination:)
                                                 name:NSTaskDidTerminateNotification
                                               object:task];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePipeError:)
                                                 name:NSFileHandleReadCompletionNotification
                                               object:errorPipe];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePipeOutput:)
                                                 name:NSFileHandleReadToEndOfFileCompletionNotification
                                               object:outputPipe];
    
    
}

+ (NSString *)executableBinPath {
    return EXECUTABLE_BIN;
}

// ----------------------------------------------------
// Custom Methods for TaskOperation
// ----------------------------------------------------

#pragma mark - Methods
- (void)launchWithParameters: (NSArray *) parameters {
    
    outputPipe = [[NSPipe alloc] init];
    inputPipe = [[NSPipe alloc] init];
    errorPipe = [[NSPipe alloc] init];
    
    [task setStandardOutput:outputPipe];
    [task setStandardInput:inputPipe];
    [task setStandardError:errorPipe];
    
    [task setArguments:parameters];
    
    //NSLog(@"[INFO] TaskOperation currentDirectoryPath %@", [self currentDirectoryPath]);
    NSLog(@"[INFO] TaskOperation command \n%@ %@", [self launchPath], [[self arguments] componentsJoinedByString:@" "]);
    
    [self handlePipeOutput];
    [self handlePipeError];
    
    [task launch];
}

- (void)launch {
    [self launchWithParameters:[self arguments]];
}

- (void)launch:(void (^)(NSData *))data withReply:(void (^)(int *))reply {
    [self launchWithParameters:[self arguments]];
    replyBlock = reply;
    dataBlock = data;
}

- (void) reply:(int *) result {
    if(replyBlock ) {
        replyBlock( result );
    }
}

- (void) data:(NSData *) value {
    if( dataBlock ) {
        dataBlock( value );
    }
}

// ----------------------------------------------------
// Perform TaskOperation Data collection
// ----------------------------------------------------

- (void)forwardDataToDelegate: (NSData *) data {
    [self data:data];
}

- (void)tailPipeOutputOnThread {
    NSFileHandle *filehandle = [outputPipe fileHandleForReading];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSData *readData;
	while ([readData = [filehandle availableData] length]){
        [data appendData: readData];
		[self performSelectorOnMainThread:@selector(forwardDataToDelegate:) withObject:data waitUntilDone:YES];
	}
}

- (void)handlePipeOutput {
	[NSThread detachNewThreadSelector:@selector(tailPipeOutputOnThread) toTarget:self withObject:nil];
}

// ----------------------------------------------------
// Perform TaskOperation Error collection
// ----------------------------------------------------

- (void)forwardErrorDataToDelegate: (NSData *) data {
    [self data:data];
}

- (void)tailPipeErrorOnThread {
    NSFileHandle *filehandle = [errorPipe fileHandleForReading];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSData *errorData;
	while ([errorData = [filehandle availableData] length]){
        [data appendData: errorData];
		[self performSelectorOnMainThread:@selector(forwardErrorDataToDelegate:) withObject:data waitUntilDone:YES];
	}
}

- (void)handlePipeError {
	[NSThread detachNewThreadSelector:@selector(tailPipeErrorOnThread) toTarget:self withObject:nil];
}


// ----------------------------------------------------
// Perform TaskOperation Terminations
// ----------------------------------------------------

- (void)performOperationTermination {
    if( ![task isRunning] ) {
        int result = [task terminationStatus];
        if (!result) {
            NSLog(@"[INFO] TaskOperation Succeeded.");
        } else {
            NSLog(@"[ERROR] TaskOperation Failed.");
        }
        NSLog(@"[INFO] TaskOperation Terminated.");
        
        [self initTask];
        [self reply:&result];
    }
}

- (void)handleThreadedTaskTerminationOnThread {
    [self performSelectorOnMainThread:@selector(performOperationTermination) withObject:nil waitUntilDone:YES];
}

- (void)handleThreadedTaskTermination: (NSNotification *)notification {
	[NSThread detachNewThreadSelector:@selector(handleThreadedTaskTerminationOnThread) toTarget:self withObject:nil];
}

- (void)dealloc {
    [self initTask];
}

- (void)cleanup {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSTaskDidTerminateNotification object:task];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSFileHandleReadToEndOfFileCompletionNotification object:outputPipe];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSFileHandleReadCompletionNotification object:errorPipe];
    
    task = nil;
    outputPipe = nil;
    inputPipe = nil;
}

#pragma mark - NSTask protocols
// ----------------------------------------------------
// NSTask pragmas
// ----------------------------------------------------

- (void)setArguments: (NSArray*) arguments {
    return [task setArguments:arguments];
}

- (NSArray *)arguments {
    return [task arguments];
}

- (void)setCurrentDirectoryPath: (NSString *)path {
    return [task setCurrentDirectoryPath:path];
}

- (NSString*)currentDirectoryPath {
    return [task currentDirectoryPath];
}

- (void)setEnvironment: (NSDictionary *)environmentDictionary {
    return [task setEnvironment:environmentDictionary];
}

- (NSDictionary*)environment {
    return [task environment];
}

- (void)setLaunchPath: (NSString *)path {
    return [task setLaunchPath:path];
}

- (NSString*)launchPath {
    return [task launchPath];
}

- (void)setStandardInput: (NSPipe *) inpipe {
    return [task setStandardInput:inpipe];
}

- (id)standardInput {
    return [task standardInput];
}

- (id)standardOutput {
    return [task standardOutput];
}

- (id)standardError {
    return [task standardError];
}

- (int)processIdentifier {
    return [task processIdentifier];
}

- (int)terminationStatus {
    return [task terminationStatus];
}

- (BOOL)isRunning {
    return [task isRunning];
}

@end
