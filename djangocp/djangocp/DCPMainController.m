//
//  DCPMainController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPColor.h"
#import "DCPAppController.h"
#import "DCPMainController.h"
#import "DCPSolidColorView.h"
#import "DCPUserDefaultKeys.h"

@interface DCPMainController ()

@end

@implementation DCPMainController

@synthesize header, subHeader, subHeaderHighlight;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       applicationVersion = [self getDefaultsWithKey:[DCPUserDefaultKeys appVersion]];
    }
    return self;
}

- (void)prepareSubHeader {
    DCPSolidColorView *sh = [self subHeader];
    [sh setBackgroundColor:DCPColor.BLUE];
    [sh setNeedsDisplay:YES];
    
    DCPSolidColorView *shh = [self subHeaderHighlight];
    [shh setBackgroundColor:DCPColor.HIGHLIGHT_BLUE];
    [shh setNeedsDisplay:YES];
}

- (void)prepareHeader {
    DCPSolidColorView *h = [self header];
    [h setBackgroundColor:DCPColor.DARK_GRAY];
    [h setNeedsDisplay:YES];
}

- (void)awakeFromNib {
    [self prepareHeader];
    [self prepareSubHeader];
}

- (IBAction)onShowPreferences:(id)sender {
    DCPAppController * appController = (DCPAppController *) _delegate;
    [appController showPreferenceWindow];
}
@end
