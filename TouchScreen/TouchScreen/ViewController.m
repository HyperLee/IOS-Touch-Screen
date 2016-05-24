//
//  ViewController.m
//  TouchScreen
//
//  Created by HyperLee on 2016/4/18.
//  Copyright © 2016年 HyperLee. All rights reserved.
//

#import "ViewController.h"
#import <mach/mach_time.h>
#import "GraphicView.h"

@interface ViewController ()

@property (nonatomic, strong) GraphicView *graphicView;
@end

@implementation ViewController

@synthesize imageView;

#pragma mark -GraphView
- (void)viewDidLoad
{
    self.view.multipleTouchEnabled = YES;
    _graphicView = [[GraphicView alloc] initWithFrame:self.view.frame];
    [_graphicView setTranslatesAutoresizingMaskIntoConstraints:NO];
    _graphicView.backgroundColor = [UIColor clearColor];
    _graphicView.userInteractionEnabled = NO;
    [self.view addSubview:_graphicView];
    _graphicView.alpha = 0.0f;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark -touchScreen

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    _graphicView.alpha = 1.0f;
    NSUInteger touchCount = [touches count]; //fingers count//
    NSUInteger tapCount = [[touches anyObject] tapCount]; //taps count//
    float distance = 0;
    
    //only access two fingers//
    if (touchCount == 2)
    {
        //coordinate//
        CGPoint p1 = [[[touches allObjects] objectAtIndex:0]locationInView:self.view];
        CGPoint p2 = [[[touches allObjects] objectAtIndex:1]locationInView:self.view];
        
        NSLog(@"coordinate 1 (x=%.0f, y=%.0f)", p1.x, p1.y);
        NSLog(@"coordinate 2 (x=%.0f, y=%.0f)", p2.x, p2.y);
        
        //two finger distance//
        distance = sqrt((p1.x - p2.x) * (p1.x - p2.x)) + sqrt((p1.y - p2.y) * (p1.y - p2.y));
        NSLog(@"two finger distance: %.2f",distance);
        
        //touch size//
        CGFloat touchSize1 = [[[[touches allObjects] objectAtIndex:0] valueForKey:@"pathMajorRadius"] floatValue];
        CGFloat touchSize2 = [[[[touches allObjects] objectAtIndex:1] valueForKey:@"pathMajorRadius"] floatValue];
        
        NSLog(@"touch size1: %.2f", touchSize1);
        NSLog(@"touch size2: %.2f", touchSize2);
        
        // restrict  fingers distance and touch size//
        if(distance < 150 &&  (10 < touchSize1 < 80) && (10 < touchSize2 < 80)){
            
            _methodStatus.text = @"touchesBegan";
            _touchStatus.text = [NSString stringWithFormat: @"%d finger", touchCount];
            _tapStatus.text = [NSString stringWithFormat: @"%d times", tapCount];
            _coordinate.text = [NSString stringWithFormat:@"(x1=%.0f, y1=%.0f)", p1.x, p1.y];
            _coordinate2.text = [NSString stringWithFormat:@"(x2=%.0f, y2=%.0f)", p2.x, p2.y];
            _touchsize.text = [NSString stringWithFormat:@"Area2: %.0f",touchSize1];
            _touchsize2.text = [NSString stringWithFormat:@"Area2: %.0f",touchSize2];
            _fingerdistance.text = [NSString stringWithFormat:@"%.0f",distance];
            
            _graphicView.firstPoint = p1;
            _graphicView.secondPoint = p2;
            [_graphicView setNeedsDisplay];
        }
        
        else
        {
            _methodStatus.text = @"Something Wrong";
            _touchStatus.text = [NSString stringWithFormat: @" "];
            _tapStatus.text = [NSString stringWithFormat: @" "];
            _coordinate.text = [NSString stringWithFormat:@" "];
            _coordinate2.text = [NSString stringWithFormat:@" "];
            _touchsize.text = [NSString stringWithFormat:@"Area1: %.0f",touchSize1];
            _touchsize2.text = [NSString stringWithFormat:@"Area2: %.0f",touchSize2];
            _fingerdistance.text = [NSString stringWithFormat:@"%.0f",distance];
            
            NSLog(@" distance > 150 or  touch size1 or touch size2 wrong  !");
        }
        
        NSLog(@"------------------END--------------------");
    }
    else
    {
        _methodStatus.text = @"Wrong Case";
        _touchStatus.text = [NSString stringWithFormat: @"not two fingers"];
        _tapStatus.text = [NSString stringWithFormat: @" "];
        _coordinate.text = [NSString stringWithFormat:@" "];
        _coordinate2.text = [NSString stringWithFormat:@" "];
        _touchsize.text = [NSString stringWithFormat:@" "];
        _touchsize2.text = [NSString stringWithFormat:@" "];
        _fingerdistance.text = [NSString stringWithFormat:@" "];
        
        NSLog(@" only accept two fingers !! ");
    }
}


@end
