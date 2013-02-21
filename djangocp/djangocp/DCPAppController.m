//
//  DCPAppController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPAppController.h"
#import "DCPTaskOperationManager.h"
#import "DCPUserDefaultKeys.h"

@interface DCPAppController ()

@end

@implementation DCPAppController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // USE BROWSE TO SET THIS UP EVENTUALLY
        [self addDefaultsKey:[DCPUserDefaultKeys workspacePath] withValue:@"/workspace/demo/ashierdemo"];
        
        // CREATE TASK MANAGER
        taskManager = [[DCPTaskOperationManager alloc] init];
        
        // CREATE YOUR FIRST VIRTUAL ENVIRONMENT!!!!
        NSArray *params = [NSArray arrayWithObjects:@"--no-site-packages", @"--python=python2.7", @"djangocpdemo", nil];
        [taskManager createEnvironment:@"djangocp" withParams:params];
        
        // PYTHON PATH
        ///workspace/demo/ashierdemo/djangocpdemo/bin/python
        
        
    }
    
    return self;
}

@end
