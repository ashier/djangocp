//
//  DCPPreferencesController.m
//  djangocp
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPPreferencesController.h"

@interface DCPPreferencesController ()

@end

@implementation DCPPreferencesController

- (id)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        [self runCommand];
    }
    return self;
}

- (void)runCommand {
    
    /*
     [[NSUserDefaults standardUserDefaults] setObject:[self.sourceURL stringValue] forKey:@"LastFetchURL"];
     
     [self startProgressPanelWithMessage:@"Downloading..." indeterminate:NO];
     
     // Create a connection to our fetch-service and ask it to download for us.
     NSXPCConnection *fetchServiceConnection = [[NSXPCConnection alloc] initWithServiceName:@"com.apple.SandboxedFetch.fetch-service"];
     
     // The fetch-service will implement the 'Fetch' protocol.
     fetchServiceConnection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(Fetch)];
     
     // This object will implement the 'FetchProgress' protocol, so the Fetcher can report progress back and we can display it to the user.
     fetchServiceConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(FetchProgress)];
     fetchServiceConnection.exportedObject = self;
     
     [fetchServiceConnection resume];
     
     [[fetchServiceConnection remoteObjectProxy] fetchURL:[NSURL URLWithString:[self.sourceURL stringValue]] withReply:^(NSFileHandle *fileHandle, NSError *error) {
     [[NSOperationQueue mainQueue] addOperationWithBlock:^{
     [self stopProgressPanel];
     
     if (error) {
     [self showErrorAlert:error];
     } else if ([fileHandle fileDescriptor] == -1) {
     [self showErrorAlert:[NSError errorWithDomain:NSPOSIXErrorDomain code:ENOENT userInfo:nil]];
     } else {
     [self saveFile:fileHandle];
     }
     }];
     // We're done with the connection at this point, so we should invalidate it.
     [fetchServiceConnection invalidate];
     }];
     */
}

- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
