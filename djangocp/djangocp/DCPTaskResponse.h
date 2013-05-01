//
//  DCPCommand.h
//  djangocp
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCPTask.h"

@interface DCPTaskResponse : NSOperation <NSSecureCoding>

@property (copy) NSString *name;
@property (assign) NSUInteger identifier;

@end
