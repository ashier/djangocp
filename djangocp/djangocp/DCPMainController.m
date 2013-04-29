//
//  DCPMainController.m
//  djangocp
//
//  Created by Ashier de Leon on 2/21/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPMainController.h"
#import "DCPColor.h"

@interface DCPMainController ()

@end

@implementation DCPMainController

@synthesize header, subHeader;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Initialization DCPVirtualEnvironment");
    }
    
    return self;
}

- (void)awakeFromNib {
    //[subHeader setB
}

@end
