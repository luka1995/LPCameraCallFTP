//
//  LPMenuViewController.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MSDynamicsDrawerViewController/MSDynamicsDrawerViewController.h>
#import <MSDynamicsDrawerViewController/MSDynamicsDrawerStyler.h>
#import "MSMenuTableViewHeader.h"
#import "MSMenuCell.h"

// Controllers
#import "LPCamViewController.h"
#import "LPFTPSettingsViewController.h"


typedef NS_ENUM(NSUInteger, MSPaneViewControllerType) {
    MSPaneViewControllerTypeCameraView,
    MSPaneViewControllerTypeFTPSettingsView,
    MSPaneViewControllerTypeCount,
};

typedef NS_ENUM(NSUInteger, MSMenuViewControllerTableViewSectionType) {
    MSMenuViewControllerTableViewSectionTypeCameraFunctions,
    MSMenuViewControllerTableViewSectionTypeSettingsFunctions,
    MSMenuViewControllerTableViewSectionTypeCount,
};


@interface LPMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) MSPaneViewControllerType paneViewControllerType;
@property (nonatomic, weak) MSDynamicsDrawerViewController *dynamicsDrawerViewController;

- (void)transitionToViewController:(MSPaneViewControllerType)paneViewControllerType;

@end
