//
//  DCPAppController.h
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPBaseController.h"
#import "DCPTaskOperationManager.h"
#import "DCPMainController.h"
#import "DCPPreferencesController.h"
#import "DCPCommandProtocol.h"

@interface DCPAppController : DCPBaseController <DCPMainDelegate>{
    
    DCPTaskOperationManager *taskManager;
    DCPMainController *mainController;
    DCPPreferencesController *preferencesController;
    
    NSStatusItem *statusItem;
    id<DCPCommandProtocol> serviceAgent;
    
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSMenu *statusMenu;
}

@property (readwrite) NSXPCConnection *commandService;


#pragma mark - Class Methods
// ----------------------------------------------------
// IBActions
// ----------------------------------------------------
- (void)showPreferenceWindow;

#pragma mark - IBActions
// ----------------------------------------------------
// IBActions
// ----------------------------------------------------
- (IBAction)showApplication:(id)sender;
- (IBAction)quitApplication:(id)sender;
- (IBAction)showPreferences:(id)sender;

@end
