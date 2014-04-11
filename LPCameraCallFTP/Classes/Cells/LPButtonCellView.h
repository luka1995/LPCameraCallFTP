//
//  LPButtonCellView.h
//
//  Created by Luka Penger on 10/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPButton.h"


@interface LPButtonCellView : UITableViewCell

@property (nonatomic,retain) IBOutlet LPButton *button;
@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *lineView;

+ (LPButtonCellView *)cellFromNibNamed:(NSString *)nibName;

@end
