//
//  LPAppDelegate.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSharedManager.h"


// Controllers
#import <MSDynamicsDrawerViewController/MSDynamicsDrawerViewController.h>
#import <MSDynamicsDrawerViewController/MSDynamicsDrawerStyler.h>



@interface LPAppDelegate : UIResponder <UIApplicationDelegate, MSDynamicsDrawerViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@property (nonatomic, strong) UIImageView *windowBackground;

@end
