//
//  DCPUserDefaultKeys.h
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCPUserDefaultKeys : NSObject

+ (NSString *)appVersion;
+ (NSString *)workspacePath;
+ (NSString *)configComplete;
+ (NSString *)virtualpyURL;
+ (NSString *)executableBin;

@end
