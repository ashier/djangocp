//
//  DCPAppController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/14/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPAppController.h"
#import "DCPTaskResponse.h"
#import "DCPUserDefaultKeys.h"
#import "DCPPreferencesController.h"
#import "DCPCommandProtocol.h"

@interface DCPAppController ()

@end

@implementation DCPAppController

@synthesize commandService;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initializeApplicationVersion];
        [self initializeCommandService];
        [self initializeServiceAgent];
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

- (void) initializeApplicationVersion {
    NSMutableString *version = [[NSMutableString alloc] initWithFormat:@"%@.%@",
                                [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"],
                                [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]];
    [self addDefaultsKey:[DCPUserDefaultKeys appVersion] withValue:version];
    NSLog(@"version : %@", [self getDefaultsWithKey:[DCPUserDefaultKeys appVersion]]);
}

- (void)initializeCommandService {
    commandService = [[NSXPCConnection alloc] initWithServiceName:@"com.ashier.dcpcommand-service"];
    commandService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(DCPCommandProtocol)];
    [commandService resume];
    
    serviceAgent = [commandService remoteObjectProxyWithErrorHandler:^(NSError *error) {
        NSLog(@"Darn an error occurred: %@", error);
    }];
}

- (void)initializeServiceAgent {
    NSMutableString *path = [[NSMutableString alloc] initWithString:[defaults valueForKey:[DCPUserDefaultKeys workspacePath]]];
    [path appendString:@"/"];
    [path appendString:[DCPUserDefaultKeys executableBin]];
    
    NSString *envPath = [defaults valueForKey:[DCPUserDefaultKeys workspacePath]];
    NSString *execPath = path;
    
    NSLog(@"%@ ~ %@", envPath, execPath);
    [serviceAgent initializeWithEnvironmentPath:envPath
                             withExecutablePath:execPath
                                          reply:^(DCPTaskResponse *response) {
                                              NSLog(@"Created a task: %@", response);
                                              [commandService invalidate];
                                          }];
}

- (void) showNotificationWithTitle:(NSString *)title withSubTitle:(NSString *)subtitle {
    NSUserNotification *note = [[NSUserNotification alloc] init];
    note.title = title;
    note.subtitle = subtitle;
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:note];
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
