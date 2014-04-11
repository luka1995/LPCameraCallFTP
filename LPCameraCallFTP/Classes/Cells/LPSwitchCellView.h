//
//  LPSwitchCellView.h
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSwitch.h"


@interface LPSwitchCellView : UITableViewCell

@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *lineView;
@property (nonatomic,retain) IBOutlet UILabel *leftLabel;
@property (nonatomic,retain) IBOutlet LPSwitch *rightSwitch;

+ (LPSwitchCellView *)cellFromNibNamed:(NSString *)nibName;

@end
