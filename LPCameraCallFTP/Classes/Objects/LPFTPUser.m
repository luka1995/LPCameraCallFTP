//
//  LPFTPUser.m
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPFTPUser.h"


@implementation LPFTPUser

- (id)initWithCoder:(NSCoder *)coder
{
	self = [LPFTPUser new];
    if (self != nil) {
        self.hostname = [coder decodeObjectForKey:@"hostname"];
        self.username = [coder decodeObjectForKey:@"username"];
        self.password = [coder decodeObjectForKey:@"password"];
        self.port = [coder decodeIntegerForKey:@"port"];
        self.folderPath = [coder decodeObjectForKey:@"folderPath"];
        self.saveDetails = [coder decodeBoolForKey:@"saveDetails"];
	}
    
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.hostname forKey:@"hostname"];
    [coder encodeObject:self.username forKey:@"username"];
    [coder encodeObject:self.password forKey:@"password"];
    [coder encodeInteger:self.port forKey:@"port"];
    [coder encodeObject:self.folderPath forKey:@"folderPath"];
    [coder encodeBool:self.saveDetails forKey:@"saveDetails"];
}

- (id)init
{
    self = [super init];
    if(self != nil) {
        self.hostname = @"";
        self.username = @"";
        self.password = @"";
        self.folderPath = @"";
        self.port = 21;
        self.saveDetails = YES;
    }
    return self;
}

+ (id)userWithObjects:(NSDictionary *)dictionary
{
    LPFTPUser *new = [LPFTPUser new];
    
    if(![dictionary isKindOfClass:[NSNull class]]) {
        if (![[dictionary objectForKey:@"hostname"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"hostname"] != nil) {
            new.hostname = [dictionary objectForKey:@"hostname"];
        }
        
        if (![[dictionary objectForKey:@"username"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"username"] != nil) {
            new.username = [dictionary objectForKey:@"username"];
        }
        
        if (![[dictionary objectForKey:@"password"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"password"] != nil) {
            new.password = [dictionary objectForKey:@"password"];
        }
        
        if (![[dictionary objectForKey:@"port"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"port"] != nil) {
            new.port = [[dictionary objectForKey:@"port"] intValue];
        }
        
        if (![[dictionary objectForKey:@"folderPath"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"folderPath"] != nil) {
            new.folderPath = [dictionary objectForKey:@"folderPath"];
        }
        
        if (![[dictionary objectForKey:@"saveDetails"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"saveDetails"] != nil) {
            new.saveDetails = [[dictionary objectForKey:@"saveDetails"] boolValue];
        }
    }
    
	return new;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.hostname] forKey:@"hostname"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.username] forKey:@"username"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.password] forKey:@"password"];
    [dictionary setObject:[NSString stringWithFormat:@"%d", self.port] forKey:@"port"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.folderPath] forKey:@"folderPath"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.saveDetails ? @"True" : @"False"] forKey:@"saveDetails"];
    
    return dictionary;
}

- (NSString *)description
{
    return [self dictionary].description;
}

- (id)copyWithZone:(NSZone *)zone
{
    LPFTPUser *new = [[LPFTPUser allocWithZone:zone] init];
    
    [new setHostname:self.hostname];
    [new setUsername:self.username];
    [new setPassword:self.password];
    [new setPort:self.port];
    [new setFolderPath:self.folderPath];
    [new setSaveDetails:self.saveDetails];
    
    return new;
}

@end
