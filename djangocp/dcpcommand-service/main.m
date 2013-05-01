//
//  main.m
//  dcpcommand-service
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#include <Foundation/Foundation.h>
#import "DCPCommandProtocol.h"
#import "DCPTask.h"
#import "DCPTaskResponse.h"
#import "DCPCommandAgent.h"

@interface DCPCommandDelegate : NSObject <NSXPCListenerDelegate>
@end

@implementation DCPCommandDelegate


- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
	newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(DCPCommandProtocol)];
    DCPCommandAgent *agent = [DCPCommandAgent new];
    newConnection.exportedObject = agent;
	[newConnection resume];
	return YES;
}

@end


int main(int argc, const char *argv[]) {
	NSXPCListener *listener = [NSXPCListener serviceListener];
	DCPCommandDelegate *delegate = [DCPCommandDelegate new];
	listener.delegate = delegate;
	[listener resume];
	return 0;
}