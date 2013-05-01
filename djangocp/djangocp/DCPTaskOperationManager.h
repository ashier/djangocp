//
//  DCPTaskOperationManager.h
//  djangocp
//
//  Created by Ashier de Leon on 2/20/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCPTask.h"

@interface DCPTaskOperationManager : NSObject {
    DCPTask * task;
    BOOL useDistribute;
}


#pragma mark - Class Methods
// ----------------------------------------------------
// Initialization
// ----------------------------------------------------
- (void)setupWithDistribute:(BOOL) value;
- (void)setup;

// PIP
- (void)installPackage:(NSString *) name withParams: (NSArray *) params;
- (void)removePackage:(NSString *) name withParams: (NSArray *) params;

// VIRTUAL ENV
- (void)createEnvironment:(NSString *) name withParams: (NSArray *) params;

@end
