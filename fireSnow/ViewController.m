//
//  ViewController.m
//  fireSnow
//
//  Created by 蒋欣洋 on 16/3/2.
//  Copyright (c) 2016年 luoyangligong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addImageView];

}

-(void)addImageView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:imageView];
    
    NSMutableArray *pictureArr = [NSMutableArray array];
    for (int i = 1; i < 18; i ++) {
        NSString *iamgeName = [NSString stringWithFormat:@"campFire%02d.gif",i];
        UIImage *image = [UIImage imageNamed:iamgeName];
        [pictureArr addObject:image];
    }
    imageView.animationImages = pictureArr;
    imageView.animationDuration = 1.75;
    imageView.animationRepeatCount = 0;
    
    [imageView startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(snow) userInfo:nil repeats:YES];
}

-(void)snow{
    UIImage *image = [UIImage imageNamed:@"flake"];
    UIImageView *snow = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:snow];
    
    int screenW = [UIScreen mainScreen].bounds.size.width;
    //雪花起始位置的x
    int x = round(random()%screenW);
    //雪花大小
    double scale = 1/random()%100 + 1.0;
    //雪花移动速度
    double speed = 1/random()%100 + 1.0;
    //雪花的初始位置与大小
    snow.frame = CGRectMake(x, -60, 30 * scale, 30 * scale);
    //雪花动画
    [UIView animateWithDuration:5 * speed animations:^{
        int x2 = round(random()%screenW);
        snow.frame = CGRectMake(x2, 600, 50 * scale, 50 * scale);
    } completion:^(BOOL finished) {
        //动画完成删除视图
        [snow removeFromSuperview];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
