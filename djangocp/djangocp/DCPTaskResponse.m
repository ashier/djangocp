//
//  DCPCommand.m
//  djangocp
//
//  Created by Ashier de Leon on 5/1/13.
//  Copyright (c) 2013 Ashier de Leon. All rights reserved.
//

#import "DCPTaskResponse.h"

@implementation DCPTaskResponse

+ (BOOL)supportsSecureCoding {
	return YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [self init];
	if (self) {
		_name = [[aDecoder decodeObjectOfClass:NSString.class forKey:@"name"] copy];
		_identifier = [[aDecoder decodeObjectOfClass:NSNumber.class forKey:@"identifier"] unsignedIntegerValue];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:_name forKey:@"name"];
	[aCoder encodeObject:@(_identifier) forKey:@"identifier"];
}

- (NSString *)description{
	return [NSString stringWithFormat:@"<%@: %p { name: %@, identifier: %ld }>", self.class, self, self.name, (unsigned long)self.identifier];
}


@end
