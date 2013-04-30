//
//  DCPMainController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPMainController.h"
#import "DCPColor.h"
#import "DCPSolidColorView.h"

@interface DCPMainController ()

@end

@implementation DCPMainController

@synthesize header, subHeader, subHeaderHighlight;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

- (void)prepareSubHeader {
    DCPSolidColorView *sh = (DCPSolidColorView *) [self subHeader];
    [sh setBackgroundColor:DCPColor.BLUE];
    [sh setNeedsDisplay:YES];
    
    DCPSolidColorView *shh = (DCPSolidColorView *) [self subHeaderHighlight];
    [shh setBackgroundColor:DCPColor.HIGHLIGHT_BLUE];
    [shh setNeedsDisplay:YES];
}

- (void)prepareHeader {
    DCPSolidColorView *h = (DCPSolidColorView *) [self header];
    [h setBackgroundColor:DCPColor.DARK_GRAY];
    [h setNeedsDisplay:YES];
}

- (void)awakeFromNib {
    [self prepareHeader];
    [self prepareSubHeader];
}

@end
