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
#import "DCPPreferencesController.h"

@interface DCPAppController ()

@end

@implementation DCPAppController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSMutableString *version = [[NSMutableString alloc] initWithFormat:@"%@.%@",
                                    [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"],
                                    [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]];
        [self addDefaultsKey:[DCPUserDefaultKeys appVersion] withValue:version];
        NSLog(@"version : %@", [self getDefaultsWithKey:[DCPUserDefaultKeys appVersion]]);
        
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
    if ([mainController view]){
        [[mainController view] removeFromSuperview];
    }
    
    mainController = [[DCPMainController alloc] initWithNibName:@"DCPMainView" bundle:nil];
    [mainController setDelegate:self];
    
    NSView *wizardView = [mainController view];
    [mainWindow setContentSize:wizardView.frame.size];
    [mainWindow setContentView:wizardView];
    //NSRect viewScreenFrame = [self screenRectEquivelentOfView:wizardView];
    //NSRect windowFrame = [mainWindow frameRectForContentRect:viewScreenFrame];
    //[mainWindow setFrame:windowFrame display:YES animate:YES];
    
}

- (NSRect)screenRectEquivelentOfView:(NSView*)view {
    NSWindow* viewWindow = [view window];
    
    NSRect frame = [view frame];
    frame = [[view superview] convertRect:frame toView:nil];
    frame.origin = [viewWindow convertBaseToScreen:frame.origin];
    return (frame);
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

- (IBAction)showPreferences:(id)sender {
    [self showPreferenceWindow];
}

- (void)showPreferenceWindow {
    if (!preferencesController) {
        preferencesController = [[DCPPreferencesController alloc] initWithWindowNibName:@"DCPPreferencesWindow"];
    }
    [preferencesController showWindow:self];
    [NSApp activateIgnoringOtherApps:YES];
    [[preferencesController window] makeKeyAndOrderFront:nil];
}

@end
