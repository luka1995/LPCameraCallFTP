//
//  LPSharedManager.m
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPSharedManager.h"


static LPSharedManager *sharedMyManager = nil;


@interface LPSharedManager ()

@property (nonatomic, assign) BOOL networkAlertViewShown;

@end


@implementation LPSharedManager

#pragma mark Singleton Methods

+ (id)sharedManager
{
    @synchronized(self) {
        if(!sharedMyManager) {
            sharedMyManager = [[super allocWithZone:NULL] init];
        }
    }
    return sharedMyManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedManager];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)init
{
    self = [super init];
    if (self != nil) {

    }
    return self;
}

#pragma mark - Network Methods

- (BOOL)checkNetworkAndShowError:(BOOL)error
{
    NetworkStatus internetStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    if(internetStatus==NotReachable)
    {
        if(!self.networkAlertViewShown && error)
        {
            self.networkAlertViewShown = YES;
            
            SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"No Internet Connection" andMessage:@"You require an internet connection via WiFi or cellular network for location finding to work."];
            
            [alertView addButtonWithTitle:@"Exit" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView)
             {
                 self.networkAlertViewShown = NO;
                 
                 [alertView setDidDismissHandler:^(SIAlertView *alertView) {
                     exit(0);
                 }];
             }];
            
            [alertView addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView)
             {
                 self.networkAlertViewShown = NO;
             }];
            
            [alertView show];
        }
        return NO;
    }
    
    return YES;
}

#pragma mark - FTP

- (void)saveFTPUser:(LPFTPUser *)user
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    [userDefaults setObject:myEncodedObject forKey:@"FTPUser"];
    [userDefaults synchronize];
}

- (void)deleteFTPUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"FTPUser"];
    [userDefaults synchronize];
}

- (LPFTPUser *)savedFTPUser
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [userDefaults objectForKey:@"FTPUser"];
    LPFTPUser *user = (LPFTPUser *)[NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    
    return user;
}

@end
