//
//  CALayerAnimationController.m
//  LessonAnimation
//
//  Created by lanouhn on 15/4/15.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CALayerAnimationController.h"

@interface CALayerAnimationController ()
{
    CALayer *aLayer;
}
@end

@implementation CALayerAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    //CALayer和UIView的区别
    //1.UIView负责视图的位置和大小
    //2.CALayer负责视图的绘制和显示
    //3.每一个UIView都有一个只读属性layer
    //4.UIView可以进行交互, CALayer不能进行交互
    
    //CALayer, 继承于NSObject
    aLayer = [[CALayer alloc] init];
    aLayer.frame = CGRectMake(100, 100, 200, 200);
    aLayer.backgroundColor = [UIColor redColor].CGColor;
    //CGColor转换成UIcolor
    //[UIColor colorWithCGColor:(CGColorRef)]
    //常用属性
    //圆角
    aLayer.cornerRadius = 100;
    //消除边缘锯齿
    aLayer.allowsEdgeAntialiasing = YES;
    //边框
    aLayer.borderWidth = 2;
    aLayer.borderColor = [UIColor greenColor].CGColor;
    //阴影
    aLayer.shadowOpacity = 1.0;
    //阴影的偏移方向
    aLayer.shadowOffset = CGSizeMake(10, 10);
    //阴影的颜色
    aLayer.shadowColor = [UIColor whiteColor].CGColor;
    
    [self.view.layer addSublayer:aLayer];
    [aLayer release];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(start)];
    [self.view addGestureRecognizer:tap];
    [tap release];
    
    
    
    
}

- (void)start {
    NSLog(@"Do");
    //CALayer动画
    //CAAnimation, 继承于NSObject, 抽象的基类, 不能直接使用
    //CAPropertyAnimation, 属性动画, 继承于CAAnimation, 抽象的子类, 不可以直接使用, 使用子类
    //CABasicAnimation, 基本动画, 继承于CAPropertyAnimation
//    [self basicAnimation];
    
    //CAKeyframeAnimation, 关键帧动画, 继承于CAPropertyAnimation
//    [self keyframeAnimation];
    
    //CATransition, 过度动画, 继承CAAnimation
//    [self transition];
    
    //CAAnimationGroup 组动画 ,继承于CAAnimation
    [self animationGroup];
    
    
}

- (void)basicAnimation {
    /*
    //KVC: key - value coding
    //keyPath:想要修改的属性名
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    //设置动画的时间
    basic.duration = 3;
    //fromValue,toValue,和byValue最多只可以设置2个
    basic.fromValue = (id)[UIColor yellowColor].CGColor;
    basic.toValue = (id)[UIColor greenColor].CGColor;
    basic.byValue = (id)[UIColor brownColor].CGColor;
    //参数2.动画的标示符
    [aLayer addAnimation:basic forKey:@"dd"];
    */
    
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    
    //动画时长
    basic.duration = 3;
    //重复的次数
    basic.repeatCount = 3;
    
//    basic.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
//    basic.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 375, 375)];
    
    //只修改宽度
    basic.fromValue = @100;
    basic.toValue = @400;
    [aLayer addAnimation:basic forKey:@"changeBounds"];
  
}


- (void)keyframeAnimation {
    /*
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    keyframe.duration = 10;
    keyframe.repeatCount = 10;
    keyframe.values = @[@50, @100, @200];
    //keyTimes元素的个数和Values相等, 元素的值的取值范围是[0.0, 1.0], 出现时刻的百分比
    //并且元素的取值是递增的
    keyframe.keyTimes = @[@0.3, @0.5, @0.9];
     
     [aLayer addAnimation:keyframe forKey:@"changeCornerRadius"];
    */

    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.width"];
    //动画时长
    keyframe.duration = 5;
    keyframe.values = @[@100, @500, @300, @130, @600];
    keyframe.keyTimes = @[@.2, @.3, @.4, @.8, @.9];
    [aLayer addAnimation:keyframe forKey:@"俩霓虹"];
//    CGFloat a = .2;
//    CGFloat b = 0.2;
//    CGFloat c = 0.2f;
    
    
    
}


- (void)transition {
    CATransition *transition = [CATransition animation];
    
    //动画类型
    transition.type = kCATransitionPush;
    //设置动画方向
    transition.subtype = kCATransitionFromRight;
    
    [aLayer addAnimation:transition forKey:@"dad"];
    
    /*
    switch (theButton.tag) {
        case 0:
            animation.type = @"cube";//---
            break;
        case 1:
            animation.type = @"suckEffect";//103
            break;
        case 2:
            animation.type = @"oglFlip";//When subType is "fromLeft" or "fromRight", it's the official one.
            break;
        case 3:
            animation.type = @"rippleEffect";//110
            break;
        case 4:
            animation.type = @"pageCurl";//101
            break;
        case 5:
            animation.type = @"pageUnCurl";//102
            break;
        case 6:
            animation.type = @"cameraIrisHollowOpen ";//107
            break;
        case 7:
            animation.type = @"cameraIrisHollowClose ";//106
            break;
        default:
            break;
    }
     */
    
}

//组动画
- (void)animationGroup {
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basic.duration = 2;
    basic.fromValue = (id)[UIColor greenColor].CGColor;
    
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"bounds"];
    basic1.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 800)];
    basic1.duration = 2;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2;
    group.animations = @[basic, basic1];
    [aLayer addAnimation:group forKey:@"KKKK"];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
