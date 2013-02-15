//
//  DCPGradientView.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPGradientView.h"

@implementation DCPGradientView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:[DCPGradientView colorWithHexColorString:@"C6C6C6"]
                                                         endingColor:[DCPGradientView colorWithHexColorString:@"ACACAC"]];
    NSRect windowFrame = [self frame];
    [gradient drawInRect:windowFrame angle:90];
}

+ (NSColor*)colorWithHexColorString:(NSString*)inColorString {
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString) {
        NSScanner* scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    result = [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
