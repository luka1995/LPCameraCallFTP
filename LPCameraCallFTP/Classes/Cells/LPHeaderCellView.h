//
//  LPHeaderCellView.h
//
//  Created by Luka Penger on 10/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LPHeaderCellView : UITableViewCell

@property(nonatomic,retain) IBOutlet UIView *topLineView;
@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *lineView;
@property (nonatomic,retain) IBOutlet UILabel *rightLabel;
@property (nonatomic,retain) IBOutlet UIImageView *leftImageView;

+ (LPHeaderCellView *)cellFromNibNamed:(NSString *)nibName;

@end
