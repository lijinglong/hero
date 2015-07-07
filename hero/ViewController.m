//
//  ViewController.m
//  hero
//
//  Created by lijinglong on 15/7/7.
//  Copyright (c) 2015年 lijinglong. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@property (nonatomic, strong) UIImageView *roleImg;
@property (nonatomic, strong) UIView *powerView;
@property (nonatomic, strong) UILabel *grades;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self custom];
//    [self anmation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)custom{
    
    

    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 568 - 100, arc4random() % 50 + 10, 100)];
    self.view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view1.frame.size.width + 20 + arc4random() % 60, 568 - 100, arc4random() % 50 + 10, 100)];
    self.view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(320, 0, arc4random() % 50 + 10, 100)];
    self.view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.view3];
    
    self.powerView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 10, 2)];
    self.powerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.powerView];
    
    UIImage *image = [UIImage imageNamed:@"alert_type2"];
    self.roleImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.view1.center.x - 5, 458, 10, 10)];
    self.roleImg.image = image;
    
    [self.view addSubview:self.roleImg];
//    [self anmation];
}

- (void)anmationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    
    [UIView animateWithDuration:1 animations:^{
        CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        CGMutablePathRef thePath = CGPathCreateMutable();
//        CGPoint startPoint = self.roleImg.frame.origin;
//        CGPoint endPoint = CGPointMake(130, 300);
        
        CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
        
        CGPathAddQuadCurveToPoint(thePath, NULL, endPoint.x/2, 10, endPoint.x, endPoint.y);
        bounceAnimation.path = thePath;
        
        bounceAnimation.duration = 0.7;
        [self.roleImg.layer addAnimation:bounceAnimation forKey:@"move"];
    } completion:^(BOOL finished) {
       
        self.roleImg.center = CGPointMake(endPoint.x, endPoint.y);
    }];
}


- (void)powerViewadd{
    CGFloat height = self.powerView.frame.size.height + 2;
    self.powerView.frame = CGRectMake(self.powerView.frame.origin.x, self.powerView.frame.origin.y - 2, self.powerView.frame.size.width, height);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(powerViewadd) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.timer invalidate];
//    CGPoint endPoint = CGPointMake(self.roleImg.center.x + self.powerView.frame.size.height, self.roleImg.center.y);
//    [self anmationWithStartPoint:self.roleImg.center endPoint:endPoint];
    [UIView animateWithDuration:1 animations:^{
        self.roleImg.frame = CGRectMake(self.roleImg.frame.origin.x + self.powerView.frame.size.height / 2, self.roleImg.frame.origin.y - self.powerView.frame.size.height / 2, 10, 10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
           self.roleImg.frame = CGRectMake(self.roleImg.frame.origin.x + self.powerView.frame.size.height, self.roleImg.frame.origin.y + self.powerView.frame.size.height / 2, 10, 10);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
