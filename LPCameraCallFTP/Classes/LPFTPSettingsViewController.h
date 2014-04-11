//
//  LPFTPSettingsViewController.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPFTPUser.h"
#import <FTPManager/FTPManager.h>


@interface LPFTPSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, FTPManagerDelegate> {
    LPFTPUser *insertFTPUser;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
