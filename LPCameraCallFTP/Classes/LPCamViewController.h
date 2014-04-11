//
//  LPCamViewController.h
//  LPCameraCallFTP
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "LPCamPreviewView.h"


@interface LPCamViewController : UIViewController

@property (nonatomic, strong) IBOutlet LPCamPreviewView *previewView;
@property (nonatomic, strong) IBOutlet UIButton *flashButton;

- (IBAction)captureImage:(id)sender;
- (IBAction)flashChanged:(id)sender;

@end
