//
//  DCPBaseController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCPBaseController : NSViewController {
    NSUserDefaults *defaults;
}

- (void)addDefaultsKey: (NSString *) key withValue: (NSString *) value;
- (NSString*)getDefaultsWithKey: (NSString *) key;
- (void)resetUserDefaults;

@end