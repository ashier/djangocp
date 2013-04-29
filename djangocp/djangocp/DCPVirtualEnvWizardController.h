//
//  DCPVirtualEnvWizardController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DCPBaseController.h"

@protocol DCPVirtualEnvWizardDelegate;

@interface DCPVirtualEnvWizardController : DCPBaseController

#pragma mark - Delegate
// ----------------------------------------------------
// Delegate
// ----------------------------------------------------
@property (strong) id <DCPVirtualEnvWizardDelegate> delegate;



@end

@protocol DCPVirtualEnvWizardDelegate <NSObject>

@optional
- (void)didPackageInstall: (DCPVirtualEnvWizardController *)view;

@end