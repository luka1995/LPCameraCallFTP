//
//  LPFTPUser.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LPFTPUser : NSObject <NSCoding>

@property (nonatomic, strong) NSString *hostname;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, assign) int port;
@property (nonatomic, strong) NSString *folderPath;
@property (nonatomic, assign) BOOL saveDetails;

+ (id)userWithObjects:(NSDictionary *)dictionary;

- (NSDictionary *)dictionary;

- (id)copyWithZone:(NSZone *)zone;

@end
