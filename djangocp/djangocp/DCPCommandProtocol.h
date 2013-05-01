//
//  DCPInterfaces.h
//  djangocp
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCPTask.h"
#import "DCPTaskResponse.h"

@class DCPTaskResponse;
@class DCPTask;

@protocol DCPCommandProtocol <NSObject>

- (void)initializeWithEnvironmentPath:(NSString *)evnPath withExecutablePath:(NSString *)execPath reply:(void (^)(DCPTaskResponse *))reply;

@end