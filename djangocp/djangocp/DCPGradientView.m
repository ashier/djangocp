//
//  DCPGradientView.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPGradientView.h"
#import "DCPColor.h"

@implementation DCPGradientView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:DCPColor.LIGHT_GRAY
                                                         endingColor:DCPColor.LIGHT_GRAY];
    NSRect windowFrame = [self frame];
    [gradient drawInRect:windowFrame angle:90];
}

@end
