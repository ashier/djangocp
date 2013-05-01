//
//  DCPTaskOperationManager.m
//  djangocp
//
//  Created by Ashier de Leon on 2/20/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPTaskOperationManager.h"

@implementation DCPTaskOperationManager

#pragma mark - Initialization
// ----------------------------------------------------
// Initialization
// ----------------------------------------------------

-(id) init {
    if (self = [super init]){
        useDistribute = YES;
        
        task = [[DCPTask alloc] init];
        [task initTask];
        
    }
    return self;
}


#pragma mark - Class Methods
// ----------------------------------------------------
// Class Methods
// ----------------------------------------------------

- (void)setupWithDistribute:(BOOL) value {
    
}

- (void)installPackage:(NSString *) name withParams: (NSArray *) params {
    [task setLaunchPath:@"/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/pip"];
    [task setArguments:params];
    [task launch:^(NSData * data) {
        NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        NSLog (@"\n%@", string);
    } withReply:^(int *result) {
        NSLog(@"Super Successfull queue bro");
    }];
}

- (void)removePackage:(NSString *) name withParams: (NSArray *) params {
    
}

- (void)createEnvironment:(NSString *) name withParams: (NSArray *) params {
    [task setLaunchPath:@"/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv"];
    [task setArguments:params];
    [task launch:^(NSData * data) {
        NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        NSLog (@"\n%@", string);
    } withReply:^(int *result) {
        NSLog(@"Super Successfull queue bro");
    }];
}

- (void)setup {
    [self setupWithDistribute:useDistribute];
}

@end
