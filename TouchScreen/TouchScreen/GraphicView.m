//
//  GraphicView.m
//  TouchScreen
//
//  Created by HyperLee on 2016/4/18.
//  Copyright © 2016年 HyperLee. All rights reserved.
//

#import "GraphicView.h"

@implementation GraphicView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextMoveToPoint(context, _firstPoint.x, _firstPoint.y); // start point//
    CGContextAddLineToPoint(context, _secondPoint.x, _secondPoint.y); // end point //
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextStrokePath(context);
}

@end

