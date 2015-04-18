//
//  UIViewAnimationController.m
//  LessonAnimation
//
//  Created by lanouhn on 15/4/15.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "UIViewAnimationController.h"

@interface UIViewAnimationController ()
{
    UIView *animationview;
    UIButton *button;
    UIView *endView;
}
@end

@implementation UIViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    endView = [[UIView alloc] initWithFrame:CGRectMake(175, 100, 100, 100)];
    endView.backgroundColor = [UIColor redColor];
    [self.view addSubview:endView];
    [endView release];
    
    animationview = [[UIView alloc] initWithFrame:CGRectMake(175, 100, 100, 100)];
    animationview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:animationview];
    [animationview release];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(80, 500, 200, 60);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)start {
    //UIView动画, 实质上是对CALayer动画的封装
    
    //1.属性动画
//    [self propertyAnimation];
    //2.过度动画
    [self transitionAnimation];
    
}

//属性动画, 在做动画的期间改变视图的属性
- (void)propertyAnimation {
    //动画块
    
    /*
    //以 准备动画 开始
    //参数1, 动画ID,
    //参数2.参数
    [UIView beginAnimations:@"三个房间" context:NULL];
    //配置动画的属性
    //动画时长, 默认是0.2;
    [UIView setAnimationDuration:1];
    //延迟执行
    [UIView setAnimationDelay:1];
    //重复次数
    [UIView setAnimationRepeatCount:100];
    //速度曲线, 默认是匀速
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //动画反转
    [UIView setAnimationRepeatAutoreverses:YES];
    //设置代理delegate, 不需要遵守协议
    [UIView setAnimationDelegate:self];
    //设置动画将要开始执行的方法
    [UIView setAnimationWillStartSelector:@selector(willStart)];
    //设置动画已经结束执行的方法
    [UIView setAnimationDidStopSelector:@selector(didStop)];
    
    
    //中间写 修改的属性值 (frame, center, bounds, backgroundColor, alpha, transform)
//    animationview.frame = CGRectMake(19, 102, 200, 400);
    animationview.backgroundColor = [UIColor grayColor];
    animationview.alpha = YES;
    //transform, 变形
    //CGAffineTransform , 结构体类型
    //缩放
    animationview.transform = CGAffineTransformMakeScale(0.5, 2);
    //旋转
    animationview.transform = CGAffineTransformMakeRotation(M_PI_2); //1在表示1/180, 在后表示π / 1
    //矩阵变形
//    animationview.transform = CGAffineTransformMake(1, 1, 1, 1, 1, 1);
    //移动
    animationview.transform = CGAffineTransformMakeTranslation(100, 10);
    */
     /*
    //在某个基础上进行缩放
//    animationview.transform = CGAffineTransformScale(animationview.transform, 0.5, 2);
    //在原有的基础上旋转
//    animationview.transform = CGAffineTransformRotate(animationview.transform, M_PI_4); //角度的正负决定旋转的方向
    //在原有的基础上移动
    animationview.transform = CGAffineTransformTranslate(animationview.transform, 20, 50);
    
    //以 提交动画 结束
    [UIView commitAnimations];
    */
    
    //block
    [UIView animateWithDuration:1 animations:^{
        animationview.backgroundColor = [UIColor redColor];
    }];
    
    [UIView animateWithDuration:1 animations:^{
        animationview.backgroundColor = [UIColor cyanColor];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationview.backgroundColor = [UIColor greenColor];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
}

//过渡动画
- (void)transitionAnimation {
    //动画块
    //开始动画
    /*
    [UIView beginAnimations:@"transition" context:nil];
    //参数1:设置过渡样式
    //参数2.对哪一个视图进行动画
    //参数3.是否需要缓存, 根据动画的次数
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:animationview cache:YES];
        //结束动画
    [UIView commitAnimations];
     */
    
    //block
//    [UIView transitionWithView:animationview duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    
    //注:fromView这个视图会被移除
    [UIView transitionFromView:animationview toView:endView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        
    }];
    
    //注:属性动画和过渡动画可以同时执行
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - delegate
//动画将要开始
- (void)animationWillStart:(NSString *)animationID context:(void *)context {
    NSLog(@"%@", animationID);
}

//动画已经结束
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    NSLog(@"%@", animationID);
}

- (void)willStart {
    NSLog(@"开始");
}

- (void)didStop {
    NSLog(@"结束");
}


@end
