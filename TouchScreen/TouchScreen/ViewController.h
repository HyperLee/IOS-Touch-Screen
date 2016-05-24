//
//  ViewController.h
//  TouchScreen
//
//  Created by HyperLee on 2016/4/18.
//  Copyright © 2016年 HyperLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *imageView;
}

@property (nonatomic,retain)IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *methodStatus;
@property (weak, nonatomic) IBOutlet UILabel *touchStatus;
@property (weak, nonatomic) IBOutlet UILabel *tapStatus;
@property (weak, nonatomic) IBOutlet UILabel *coordinate;
@property (weak, nonatomic) IBOutlet UILabel *touchsize;
@property (weak, nonatomic) IBOutlet UILabel *touchsize2;
@property (weak, nonatomic) IBOutlet UILabel *coordinate2;
@property (weak, nonatomic) IBOutlet UILabel *fingerdistance;


@end

