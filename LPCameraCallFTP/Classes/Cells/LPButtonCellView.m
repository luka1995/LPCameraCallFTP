//
//  LPButtonCellView.m
//
//  Created by Luka Penger on 10/04/14.
//  Copyright (c) 2014 Luka Penger. All rights reserved.
//

#import "LPButtonCellView.h"


@implementation LPButtonCellView

+ (LPButtonCellView *)cellFromNibNamed:(NSString *)nibName {
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    LPButtonCellView *xibBasedCell = nil;
    NSObject* nibItem = nil;
    
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[LPButtonCellView class]]) {
            xibBasedCell = (LPButtonCellView *)nibItem;
            break;
        }
    }
    
    return xibBasedCell;
}

@end
