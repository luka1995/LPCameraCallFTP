//
//  LPFTPSettingsViewController.m
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPFTPSettingsViewController.h"
#import "LPSharedManager.h"
#import "LPHeaderCellView.h"
#import "LPTextFieldCellView.h"
#import "LPButtonCellView.h"
#import "LPTapGestureRecognizer.h"
#import "LPToastView.h"
#import "LPSwitchCellView.h"


@interface LPFTPSettingsViewController ()

@property (nonatomic, strong) LPTapGestureRecognizer *tapGestureRecognizer;

@end


@implementation LPFTPSettingsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"FTP Settings";

    if([[LPSharedManager sharedManager] savedFTPUser]) {
        if([[LPSharedManager sharedManager] savedFTPUser].saveDetails) {
            insertFTPUser = [[LPSharedManager sharedManager] savedFTPUser];
        } else {
            insertFTPUser = [LPFTPUser new];
        }
    } else {
        insertFTPUser = [LPFTPUser new];
    }
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return 7;
    } else {
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            LPHeaderCellView *cell = [LPHeaderCellView cellFromNibNamed:@"LPHeaderCellView"];
            
            if(indexPath.section == 0 && indexPath.row == 0) {
                cell.topLineView.hidden = NO;
            }
            
            cell.leftImageView.image = [UIImage imageNamed:@"Head"];
            cell.rightLabel.text = @"Server Details";
            
            return cell;
        } else if(indexPath.row == 6) {
            LPSwitchCellView *cell = [LPSwitchCellView cellFromNibNamed:@"LPSwitchCellView"];
            cell.leftLabel.text = @"Save Details";
            cell.rightSwitch.on = insertFTPUser.saveDetails;
            
            [cell.rightSwitch setValueChangedBlock:^(UISwitch *swi) {
                insertFTPUser.saveDetails = swi.on;
            }];
            
            return cell;
        } else {
            LPTextFieldCellView *cell = [LPTextFieldCellView cellFromNibNamed:@"LPTextFieldCellView"];
            __weak LPTextFieldCellView *weakCell = cell;
            
            cell.rightTextField.delegate = self;
            
            cell.rightTextField.keyboardType=UIKeyboardTypeDefault;
            cell.rightTextField.autocapitalizationType=UITextAutocapitalizationTypeWords;
            cell.rightTextField.autocorrectionType=UITextAutocorrectionTypeNo;
            
            if(indexPath.row == 1) {
                cell.leftLabel.text = @"Hostname";
                cell.rightTextField.placeholder = @"Enter hostname";
                cell.rightTextField.text = insertFTPUser.hostname;
                
                [cell.rightTextField setEditingDidEndBlock:^(UITextField *uiTextField) {
                    insertFTPUser.hostname = uiTextField.text;
                    
                    [self removeTapGestureForTextFieldInCell:weakCell];
                }];
            } else if(indexPath.row == 2) {
                cell.leftLabel.text = @"Username";
                cell.rightTextField.placeholder = @"Enter username";
                cell.rightTextField.text = insertFTPUser.username;
                
                [cell.rightTextField setEditingDidEndBlock:^(UITextField *uiTextField) {
                    insertFTPUser.username = uiTextField.text;
                    
                    [self removeTapGestureForTextFieldInCell:weakCell];
                }];
            } else if(indexPath.row == 3) {
                cell.leftLabel.text = @"Password";
                cell.rightTextField.placeholder = @"Enter password";
                cell.rightTextField.secureTextEntry = YES;
                cell.rightTextField.text = insertFTPUser.password;
                
                [cell.rightTextField setEditingDidEndBlock:^(UITextField *uiTextField) {
                    insertFTPUser.password = uiTextField.text;
                    
                    [self removeTapGestureForTextFieldInCell:weakCell];
                }];
            } else if(indexPath.row == 4) {
                cell.leftLabel.text = @"Port";
                cell.rightTextField.placeholder = @"Enter port";
                cell.rightTextField.text = [NSString stringWithFormat:@"%d", insertFTPUser.port];
                
                cell.rightTextField.keyboardType = UIKeyboardTypeNumberPad;
                
                [cell.rightTextField setEditingDidEndBlock:^(UITextField *uiTextField) {
                    @try {
                        insertFTPUser.port = [uiTextField.text intValue];
                    }
                    @catch (NSException *exception) {
                        
                    }

                    [self removeTapGestureForTextFieldInCell:weakCell];
                }];
            } else if(indexPath.row == 5) {
                cell.leftLabel.text = @"Folder path";
                cell.rightTextField.placeholder = @"Enter folder path";
                cell.rightTextField.text = insertFTPUser.folderPath;
                
                [cell.rightTextField setEditingDidEndBlock:^(UITextField *uiTextField) {
                    insertFTPUser.folderPath = uiTextField.text;
                    
                    if(insertFTPUser.folderPath.length > 0) {
                        if([insertFTPUser.folderPath characterAtIndex:insertFTPUser.folderPath.length-1] != '/') {
                            insertFTPUser.folderPath = [insertFTPUser.folderPath substringToIndex:insertFTPUser.folderPath.length-1];
                        }
                    }
                    
                    uiTextField.text = insertFTPUser.folderPath;

                    [self removeTapGestureForTextFieldInCell:weakCell];
                }];
            }

            [cell.rightTextField setEditingDidBeginBlock:^(UITextField *uiTextField) {
                
                [self addTapGestureForTextFieldInCell:weakCell];
            }];
            
            return cell;
        }
    } else {
        LPButtonCellView *cell = [LPButtonCellView cellFromNibNamed:@"LPButtonCellView"];
        
        [cell.button setTitle:@"Login" forState:UIControlStateNormal];
        
        UIImage *image = [[UIImage imageNamed:@"BlueButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10) resizingMode:UIImageResizingModeStretch];
        [cell.button setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *imageBG = [UIImage imageNamed:@"BlueButtonBackground"];
        cell.mainView.backgroundColor = [UIColor colorWithPatternImage:imageBG];
        
        [cell.button setDidSelectBlock:^(UIButton *button) {
            [self.view endEditing:YES];

            NSLog(@"%@", insertFTPUser.description);
            
            [self loginWithUser:insertFTPUser];
            /*
            if(insertFTPUser.hostname != nil && insertFTPUser.username != nil && insertFTPUser.password != nil) {
                if(insertFTPUser.hostname.length > 0 && insertFTPUser.username.length > 0 && insertFTPUser.password.length > 0) {
                    [self loginWithUser:insertFTPUser];
                } else {
                    [self showErrorEnterAllDetails];
                    
                    [[LPSharedManager sharedManager] deleteFTPUser];
                    
                    [[LPSharedManager sharedManager] setFtpManager:nil];
                    [[LPSharedManager sharedManager] setFtpServer:nil];
                }
            } else {
                [self showErrorEnterAllDetails];
                
                [[LPSharedManager sharedManager] deleteFTPUser];
                
                [[LPSharedManager sharedManager] setFtpManager:nil];
                [[LPSharedManager sharedManager] setFtpServer:nil];
            }*/
        }];
        
        return cell;
    }
    
    return nil;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        return 44.0f;
    } else {
        return 68.0f;
    }
    
    return 44.0f;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Other

- (void)addTapGestureForTextFieldInCell:(LPTextFieldCellView *)cell
{
    if(!self.tapGestureRecognizer) {
        self.tapGestureRecognizer = [LPTapGestureRecognizer new];
        [self.tapGestureRecognizer setTapGestureRecognizedBlock:^(UITapGestureRecognizer *tapGesture) {
            [cell.rightTextField resignFirstResponder];
        }];
        [self.tableView addGestureRecognizer:self.tapGestureRecognizer];
    }
}

- (void)removeTapGestureForTextFieldInCell:(LPTextFieldCellView *)cell
{
    [self.tableView removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer = nil;
}

- (void)showErrorEnterAllDetails
{
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Details Error" andMessage:@"Please fill all fields"];
    
    [alertView addButtonWithTitle:@"Close" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView)
     {

     }];

    [alertView show];
}

- (void)showLoginError
{
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Login Failed" andMessage:@"Please check details and try again"];
    
    [alertView addButtonWithTitle:@"Close" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView)
     {
         
     }];
    
    [alertView show];
}

#pragma mark - FTP Functions

- (void)loginWithUser:(LPFTPUser *)user
{
    if([[LPSharedManager sharedManager] checkNetworkAndShowError:YES]) {
        FTPManager *ftpManager = [FTPManager new];
        ftpManager.delegate = self;
        
        // stringByAppendingPathComponent:user.folderPath]
        
        FMServer *ftpServer = [FMServer serverWithDestination:user.hostname username:user.username password:user.password];
        ftpServer.port = user.port;

        if([ftpManager checkLogin:ftpServer]) {
            [LPToastView toastInView:self.view withText:@"Login successful" withPaddingBottom:0.0f];
            
            [[LPSharedManager sharedManager] saveFTPUser:insertFTPUser];
            
            [[LPSharedManager sharedManager] setFtpManager:ftpManager];
            [[LPSharedManager sharedManager] setFtpServer:ftpServer];
            
            [[[LPSharedManager sharedManager] menuViewController] transitionToViewController:MSPaneViewControllerTypeCameraView];
        } else {
            [self showLoginError];
            
            [[LPSharedManager sharedManager] deleteFTPUser];
            
            [[LPSharedManager sharedManager] setFtpManager:nil];
            [[LPSharedManager sharedManager] setFtpServer:nil];
        }
    }
}

@end
