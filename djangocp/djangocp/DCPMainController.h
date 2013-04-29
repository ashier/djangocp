//
//  DCPMainController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DCPBaseController.h"

@protocol DCPMainDelegate;

@interface DCPMainController : DCPBaseController

#pragma mark - Delegate
// ----------------------------------------------------
// Delegate
// ----------------------------------------------------
@property (strong) id <DCPMainDelegate> delegate;


#pragma mark - IBOutlet
// ----------------------------------------------------
// IBOutlet
// ----------------------------------------------------
@property (strong) IBOutlet NSView *header;
@property (strong) IBOutlet NSView *subHeader;

@end

@protocol DCPMainDelegate <NSObject>

@optional
- (void)didPackageInstall: (DCPMainController *)view;

@end