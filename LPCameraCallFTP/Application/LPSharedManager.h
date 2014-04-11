//
//  LPSharedManager.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPFTPUser.h"
#import <SIAlertView/SIAlertView.h>
#import <Reachability/Reachability.h>
#import <FTPManager/FTPManager.h>
#import "LPMenuViewController.h"


@interface LPSharedManager : NSObject

@property (nonatomic, strong) LPMenuViewController *menuViewController;
@property (nonatomic, strong) FTPManager *ftpManager;
@property (nonatomic, strong) FMServer *ftpServer;

#pragma mark Singleton Methods

+ (id)sharedManager;

#pragma mark - Network Methods

- (BOOL)checkNetworkAndShowError:(BOOL)error;

#pragma mark - FTP

- (void)saveFTPUser:(LPFTPUser *)user;
- (void)deleteFTPUser;
- (LPFTPUser *)savedFTPUser;

@end
