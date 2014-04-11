//
//  LPSwitchCellView.m
//
//  Created by Luka Penger on 11/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPSwitchCellView.h"


@implementation LPSwitchCellView

+ (LPSwitchCellView *)cellFromNibNamed:(NSString *)nibName {
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    LPSwitchCellView  *xibBasedCell = nil;
    NSObject* nibItem = nil;
    
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[LPSwitchCellView class]]) {
            xibBasedCell = (LPSwitchCellView *)nibItem;
            break; // we have a winner
        }
    }
    
    return xibBasedCell;
}
@end
