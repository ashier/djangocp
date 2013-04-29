//
//  DCPAppController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPBaseController.h"
#import "DCPTaskOperationManager.h"
#import "DCPVirtualEnvWizardController.h"

@interface DCPAppController : DCPBaseController <DCPVirtualEnvWizardDelegate>{
    
    DCPTaskOperationManager *taskManager;
    DCPVirtualEnvWizardController *virtualEnvWizardController;
    
    NSStatusItem *statusItem;
    
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSMenu *statusMenu;
}


#pragma mark - IBActions
// ----------------------------------------------------
// IBActions
// ----------------------------------------------------
- (IBAction)showApplication:(id)sender;
- (IBAction)quitApplication:(id)sender;

@end
