//
//  RootViewController.m
//  LessonGesture
//
//  Created by lanouhn on 15/3/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "TapView.h"
#import "TapaaView.h"

@interface RootViewController ()

{
    TapView *tapView;
    TapaaView *tapaaView;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]];
    
//    tapView = [[TapView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    tapView.backgroundColor = [UIColor yellowColor];
//    [tapView addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:tapView];
//    [tapView release];
//    
    
    tapaaView = [[TapaaView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    tapaaView.backgroundColor = [UIColor blueColor];
    [tapaaView addTarget:self action:@selector(changeLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tapaaView];
    [tapaaView release];
    
    //UIControl, 控制类, 系统已经封装了target- action的设计模式, 用于降低耦合度
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    control.backgroundColor = [UIColor redColor];
    [control addTarget:self action:@selector(change)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    [control release];
    
    //UIImageView, 图片视图类, 主要用于显示图片(UIImage,图片类)
    
    //UIImage, 图片类, 用于存储和查找图片, 继承于NSObject, 本身不具备显示图片的功能, 需要加载到一些视图上才能够显示, UIImageView, UIButton等
    //参数:图片的名字
    //注: png格式, 后缀可以省略, 其他类型需要加上后缀
    UIImage *image = [UIImage imageNamed:@"gril.jpg"];
    
    //图片大小
    NSLog(@"%@", NSStringFromCGSize(image.size));
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = [UIScreen mainScreen].bounds;
    //设置图片的填充模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
//    UIViewContentModeScaleToFill,    //填充
//    UIViewContentModeScaleAspectFit,
//    UIViewContentModeScaleAspectFill,
//    UIViewContentModeRedraw,
//    UIViewContentModeCenter,
//    UIViewContentModeTop,
//    UIViewContentModeBottom,
//    UIViewContentModeLeft,
//    UIViewContentModeRight,
//    UIViewContentModeTopLeft,
//    UIViewContentModeTopRight,
//    UIViewContentModeBottomLeft,
//    UIViewContentModeBottomRight,
    [self.view addSubview:imageView];
    [imageView release];
    
    
    
    
}

- (void)change {
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()% 256 /255. green:arc4random()% 256 /255. blue:arc4random()% 256 /255. alpha:1.0];
}

- (void)changeColor:(UIView *)view {
    tapView.backgroundColor = [UIColor colorWithRed:arc4random()% 256 /255. green:arc4random()% 256 /255. blue:arc4random()% 256 /255. alpha:1.0];
}

- (void)changeLocation:(UIView *)view {
    CGPoint temp = tapaaView.center;
    temp.x = arc4random() % (NSInteger)(tapaaView.superview.frame.size.width - 10 + 1) + 10;
    temp.y = arc4random() % (NSInteger)(tapaaView.superview.frame.size.height - 10 + 1) + 10;
    tapaaView.center = temp;
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
