//
//  DCPBaseController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPBaseController.h"

@interface DCPBaseController ()

@end

@implementation DCPBaseController

#pragma mark - Initialize
// ----------------------------------------------------
// @initialize
// ----------------------------------------------------

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        defaults = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

#pragma mark - Methods
// ----------------------------------------------------
// methods
// ----------------------------------------------------

- (void)addDefaultsKey: (NSString *) key withValue: (NSString *) value {
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

- (NSString*)getDefaultsWithKey: (NSString *) key {
    return [defaults valueForKey:key];
}

- (void)resetUserDefaults {
    for(NSString *key in [defaults dictionaryRepresentation]) {
        [defaults removeObjectForKey:key];
    }
    [defaults synchronize];
}


@end
