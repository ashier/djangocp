//
//  DCPUserDefaultKeys.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPUserDefaultKeys.h"

@implementation DCPUserDefaultKeys

#define WORKSPACE_PATH @"WORKSPACE_PATH";
#define CONFIG_COMPLETE @"CONFIG_COMPLETE";
#define VIRTUALPY_URL @"https://raw.github.com/pypa/virtualenv/master/virtualenv.py";
#define APPLICATION_VERSION @"APPLICATION_VERSION"; 

+ (NSString *)workspacePath {
    return WORKSPACE_PATH;
}

+ (NSString *)configComplete {
    return CONFIG_COMPLETE;
}

+ (NSString *)virtualpyURL {
    return VIRTUALPY_URL;
}

+ (NSString *)appVersion {
    return APPLICATION_VERSION;
}

@end
