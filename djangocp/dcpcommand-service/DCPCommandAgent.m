//
//  DCPCommandAgent.m
//  djangocp
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPCommandAgent.h"

@implementation DCPCommandAgent

- (void)initializeWithEnvironmentPath:(NSString *)evnPath withExecutablePath:(NSString *)execPath reply:(void (^)(DCPTaskResponse *))reply {
	DCPTaskResponse *response = [DCPTaskResponse new];
    DCPTask *task = [[DCPTask alloc] initTaskWithEnvironmentPath:evnPath withExecutablePath:execPath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager changeCurrentDirectoryPath:[task currentDirectoryPath]];
    
    BOOL dirCreated = [fileManager createDirectoryAtPath:execPath
                             withIntermediateDirectories:YES
                                              attributes:nil
                                                   error:nil];
    if(dirCreated) {
        [task setLaunchPath:@"/usr/bin/curl"];
        
        NSArray *params = [NSArray arrayWithObjects:@"-O", @"https://raw.github.com/pypa/virtualenv/master/virtualenv.py", nil];
        [task setArguments:params];
        [task launch];
        /*
        [task launch:^(NSData * data) {
            NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
            NSLog (@"\n%@", string);
        } withReply:^(int *result) {
            NSLog(@"Super Successfull queue bro");
        }];
        */
        
    } else {
        NSLog(@"Directory cannot be created...");
    }
    
    [response setName:@"ashier pogi"];
	reply(response);
}

@end
