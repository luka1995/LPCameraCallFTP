//
//  LPTextFieldCellView.m
//
//  Created by Luka Penger on 10/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPTextFieldCellView.h"


@implementation LPTextFieldCellView

+ (LPTextFieldCellView *)cellFromNibNamed:(NSString *)nibName {
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    LPTextFieldCellView  *xibBasedCell = nil;
    NSObject* nibItem = nil;
    
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[LPTextFieldCellView class]]) {
            xibBasedCell = (LPTextFieldCellView *)nibItem;
            break;
        }
    }
    
    return xibBasedCell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if(self.enableHighlight) {
        if(selected) {
            self.mainView.backgroundColor = [UIColor colorWithRed:(230.0/255.0) green:(230.0/255.0) blue:(230.0/255.0) alpha:(255.0/255.0)];
        } else {
            self.mainView.backgroundColor = [UIColor colorWithRed:(246.0/255.0) green:(246.0/255.0) blue:(246.0/255.0) alpha:(255.0/255.0)];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if(self.enableHighlight) {
        if(highlighted) {
            self.mainView.backgroundColor = [UIColor colorWithRed:(230.0/255.0) green:(230.0/255.0) blue:(230.0/255.0) alpha:(255.0/255.0)];
        } else {
            self.mainView.backgroundColor = [UIColor colorWithRed:(246.0/255.0) green:(246.0/255.0) blue:(246.0/255.0) alpha:(255.0/255.0)];
        }
    }
}

@end
