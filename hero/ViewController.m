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
@property (nonatomic, strong) UIView *currentView;

@property (nonatomic, strong) UIImageView *roleImg;
@property (nonatomic, strong) UIView *powerView;
@property (nonatomic, strong) UILabel *grades;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *timer1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self custom];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(StartTimer) userInfo:nil repeats:NO];
    
    
//    [self anmation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)custom{
  
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 568 - 100, arc4random() % 50 + 10, 100)];
    self.view1.backgroundColor = [UIColor redColor];
    self.view1.tag = 1000;
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view1.frame.size.width + 20 + arc4random() % 60, 568 - 100, arc4random() % 50 + 10, 100)];
    self.view2.backgroundColor = [UIColor greenColor];
    self.view2.tag = 1001;
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(320, 468, arc4random() % 50 + 10, 100)];
    self.view3.backgroundColor = [UIColor grayColor];
    self.view3.tag = 1002;
    [self.view addSubview:self.view3];
    self.currentView.tag = 1004;
    self.currentView.tag = self.view1.tag;
    self.powerView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 10, 2)];
    self.powerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.powerView];
    
    UIImage *image = [UIImage imageNamed:@"alert_type2"];
    self.roleImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.view1.center.x - 5, 458, 10, 10)];
    self.roleImg.image = image;
    
    [self.view addSubview:self.roleImg];

}


- (void)StartTimer{

    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(zhuzimove) userInfo:nil repeats:YES];
}

- (void)powerViewadd{
    CGFloat height = self.powerView.frame.size.height + 2;
    self.powerView.frame = CGRectMake(self.powerView.frame.origin.x, self.powerView.frame.origin.y - 2, self.powerView.frame.size.width, height);
}

- (void)zhuzimove{

    CGFloat x1 = self.view1.frame.origin.x - 1;
    CGFloat x2 = self.view2.frame.origin.x - 1;
    CGFloat x3 = self.view3.frame.origin.x - 1;
    if (x1 < -150) {
        x1 = arc4random() % 40 + 320;
        CGFloat width1 = arc4random() % 60 + 10;
        self.view1.frame = CGRectMake(x1, self.view1.frame.origin.y, width1, self.view1.frame.size.height);
//        NSLog(@"x1 === %f",x1);
    }
    if (x2 < -130) {
        x2 = arc4random() % 50 + 360;
        CGFloat width2 = arc4random() % 60 + 10;
//        NSLog(@"x2 === %f",x2);
        self.view2.frame = CGRectMake(x1, self.view2.frame.origin.y, width2, self.view1.frame.size.height);
    }
    if (x3 < -80) {
        x3 = arc4random() % 60 + 380;
        CGFloat width3 = arc4random() % 60 + 10;
//        NSLog(@"x3 === %f",x3);
        self.view3.frame = CGRectMake(x1, self.view3.frame.origin.y, width3, self.view3.frame.size.height);
    }

    self.view1.frame = CGRectMake(x1, self.view1.frame.origin.y, self.view1.frame.size.width, self.view1.frame.size.height);
    self.view2.frame = CGRectMake(x2, self.view2.frame.origin.y, self.view2.frame.size.width, self.view2.frame.size.height);
    self.view3.frame = CGRectMake(x3, self.view3.frame.origin.y, self.view3.frame.size.width, self.view3.frame.size.height);
   
}

- (void)roleImgMove{
    if(self.view1.frame.origin.x > 0){
        if (self.powerView.frame.size.width < self.view2.frame.origin.x - self.view1.frame.origin.x) {
            NSLog(@"failed");
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(powerViewadd) userInfo:nil repeats:YES];
    
    [self.timer fire];

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.timer invalidate];
    
    CGRect rect = self.powerView.frame;
    [UIView animateWithDuration:0.1 animations:^{
        self.roleImg.frame = CGRectMake(self.roleImg.frame.origin.x + self.powerView.frame.size.height / 2, self.roleImg.frame.origin.y - rect.size.height / 2, 10, 10);
        self.powerView.frame = CGRectMake(self.powerView.frame.origin.x, 300, self.powerView.frame.size.width, 2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
           self.roleImg.frame = CGRectMake(self.roleImg.frame.origin.x + rect.size.height, self.roleImg.frame.origin.y + rect.size.height / 2, 10, 10);
        }completion:^(BOOL finished) {
//          [self.timer1 invalidate];
           
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
