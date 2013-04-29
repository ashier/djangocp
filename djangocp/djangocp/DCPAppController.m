//
//  DCPAppController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPAppController.h"
#import "DCPTaskOperationManager.h"
#import "DCPUserDefaultKeys.h"

@interface DCPAppController ()

@end

@implementation DCPAppController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // USE BROWSE TO SET THIS UP EVENTUALLY
        //[self addDefaultsKey:[DCPUserDefaultKeys workspacePath] withValue:@"/workspace/demo/ashierdemo"];
        
        // CREATE TASK MANAGER
        // taskManager = [[DCPTaskOperationManager alloc] init];
        
        // CREATE YOUR FIRST VIRTUAL ENVIRONMENT!!!!
        //NSArray *params = [NSArray arrayWithObjects:@"--no-site-packages", @"--python=python2.7", @"djangocpdemo", nil];
        //[taskManager createEnvironment:@"djangocp" withParams:params];
        
        // PYTHON PATH
        ///workspace/demo/ashierdemo/djangocpdemo/bin/python
    
    }
    
    return self;
}

#pragma mark - Class Methods
// ----------------------------------------------------
// Methods
// ----------------------------------------------------

- (void)awakeFromNib {
    [self prepareStatusItems];
}

- (void)prepareStatusItems {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setImage:[NSImage imageNamed:@"status-icon.png"]];
    [statusItem setMenu:statusMenu];
    [statusItem setHighlightMode:YES];
}

- (void)prepareVirtualEnvWizardView {
    if ([virtualEnvWizardController view]){
        [[virtualEnvWizardController view] removeFromSuperview];
    }
    
    virtualEnvWizardController = [[DCPVirtualEnvWizardController alloc] initWithNibName:@"DCPVirtualEnvWizardView" bundle:nil];
    [virtualEnvWizardController setDelegate:self];
    
    [self.view addSubview:[virtualEnvWizardController view]];
    [[virtualEnvWizardController view] setFrame:[[self view] bounds]];
    [[virtualEnvWizardController view] setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
}

#pragma mark - IBActions
// ----------------------------------------------------
// IBActions
// ----------------------------------------------------

- (IBAction)showApplication:(id)sender {
    // prepare virtual environment wizard
    [self prepareVirtualEnvWizardView];
    
    // show window
    [NSApp activateIgnoringOtherApps:YES];
    [mainWindow makeKeyAndOrderFront:nil];
}

- (IBAction)quitApplication:(id)sender {
    [NSApp terminate:nil];
}

@end
