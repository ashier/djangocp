//
//  DCPColor.h
//  djangocp
//
//  Created by Ashier de Leon on 2/15/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DCPColor : NSColor

+ (NSColor*)colorWithHexColorString:(NSString*)inColorString;


/**
 * My Colors
 */

+ (NSColor *)BLUE;
+ (NSColor *)DARK_GRAY;
+ (NSColor *)LIGHT_GRAY;
+ (NSColor *)RED;
+ (NSColor *)GREEN;

@end
