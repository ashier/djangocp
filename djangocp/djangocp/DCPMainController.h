//
//  DCPMainController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DCPBaseController.h"
#import "DCPSolidColorView.h"
#import "DCPPreferencesController.h"

@protocol DCPMainDelegate;

@interface DCPMainController : DCPBaseController {
    NSString *applicationVersion;
}

#pragma mark - Delegate
// ----------------------------------------------------
// Delegate
// ----------------------------------------------------
@property (strong) id <DCPMainDelegate> delegate;


#pragma mark - IBOutlet
// ----------------------------------------------------
// IBOutlet
// ----------------------------------------------------
@property (strong) IBOutlet DCPSolidColorView *header;
@property (strong) IBOutlet DCPSolidColorView *subHeader;
@property (strong) IBOutlet DCPSolidColorView *subHeaderHighlight;


#pragma mark - IBActions
// ----------------------------------------------------
// IBActions
// ----------------------------------------------------
- (IBAction)onShowPreferences:(id)sender;

@end


#pragma mark - Protocol
// ----------------------------------------------------
// Protocol
// ----------------------------------------------------
@protocol DCPMainDelegate <NSObject>

@optional
- (void)didPackageInstall: (DCPMainController *)view;

@end