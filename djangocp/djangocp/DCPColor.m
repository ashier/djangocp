//
//  DCPColor.m
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPColor.h"

@implementation DCPColor

+ (NSColor *)WHITE {
    return [self colorWithHexColorString:@"FFFFFF"];
}

+ (NSColor *)BLUE {
    return [self colorWithHexColorString:@"6994e3"];
}

+ (NSColor *)DARK_GRAY {
    return [self colorWithHexColorString:@"242424"];
}

+ (NSColor *)LIGHT_GRAY {
    return [self colorWithHexColorString:@"ECECEC"];
}

+ (NSColor *)GREEN {
    return [self colorWithHexColorString:@"78BF29"];
}

+ (NSColor *)RED {
    return [self colorWithHexColorString:@"E56464"];
}

+ (NSColor*)colorWithHexColorString:(NSString*)inColorString {
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString) {
        NSScanner* scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode];
    }
    
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode);
    
    result = [NSColor
              colorWithSRGBRed:(CGFloat)redByte / 255.0
              green:(CGFloat)greenByte / 255.0
              blue:(CGFloat)blueByte / 255.0
              alpha:1.0];
    return result;
}

@end
