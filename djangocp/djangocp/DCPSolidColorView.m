//
//  DCPSolidColorView.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPSolidColorView.h"
#import "DCPColor.h"

@implementation DCPSolidColorView

@synthesize backgroundColor;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}

- (void)drawRect:(NSRect)rect {
    rect = [self bounds];
    [backgroundColor set];
    
    [self lockFocus];
    [NSBezierPath fillRect: rect];
    [self unlockFocus];
    
}

@end
