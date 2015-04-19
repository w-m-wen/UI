//
//  GestureViewController.m
//  LessonGesture
//
//  Created by lanouhn on 15/3/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController () {
    
    UIImageView *imageView;
    BOOL flag; //用于标记当前是哪张图片
    NSInteger number; //用于存储图片的名字
}

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    //默认值是YES
    flag = YES;
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qian.jpg"]];
    imageView.frame = [UIScreen mainScreen].bounds;
    //打开用户交互, uiimage的用户交互和UIlabel一样, 默认是关闭的
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    [imageView release];
    
    //UISegmentedControl, 分段控制器, 继承于UIControl
    //参数:数组类型, 数组内存放每个分段的控制按钮的标题
    NSArray *items = @[@"点击", @"捏合", @"旋转", @"清扫", @"平移", @"边缘", @"长按"];
    UISegmentedControl  *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
    //关联方法
    //分段控制器, 触发事件是UIControlEventValueChanged值的内容发生改变
    [segmentedControl addTarget:self action:@selector(changeGesture:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    [segmentedControl release];
    
    
    //抽象基类的特点:不可以直接使用, 必须通过子类化的形式才能使用, 换言之,只能使用其子类
    
    //UIGestureRecognizer 手势识别器, 其实是对触摸的封装, 是抽象的基类
    /*
    //点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesture)];
    //点击次数
    tap.numberOfTapsRequired = 2;
    //需要几个手指, 同时点击
    tap.numberOfTouchesRequired = 2;
    //把手势添加到某个视图
    [imageView addGestureRecognizer:tap];
    //释放
    [tap release];
    
    //捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imageView addGestureRecognizer:pinch];
    [pinch release];
    
    //手势的集合 imageView.gestureRecognizers, 手势类的父类是UIGestureRecognizer
    for (UIGestureRecognizer *temp in imageView.gestureRecognizers) {
        [imageView removeGestureRecognizer:temp];
    }
    
    //旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(restoration:)];
    [imageView addGestureRecognizer:rotation];
    [rotation release];
    
    //单个去掉手势
//    [imageView removeGestureRecognizer:pinch];
//    [imageView removeGestureRecognizer:tap];
     */
    //清扫手势
    
}

- (void)changeGesture:(UISegmentedControl *)aControl {
    NSLog(@"%s", __FUNCTION__);
    //选中的是第几个区域
    //selectedSegmentIndex, 从0开始
    NSLog(@"%ld", aControl.selectedSegmentIndex);
    //移除之前的手势
    for (UIGestureRecognizer *gesture in imageView.gestureRecognizers) {
        [imageView removeGestureRecognizer:gesture];
    }
    //添加手势
    switch (aControl.selectedSegmentIndex) {
        case 0://单击
        {
            //点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesture)];
            //把手势添加到某个视图
            [imageView addGestureRecognizer:tap];
            //释放
            [tap release];
        }
            break;
        case 1://捏合
        {
            //捏合手势
            UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
            [imageView addGestureRecognizer:pinch];
            [pinch release];
            
        }
            break;
        case 2://旋转
        {
            UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(restoration:)];
            [imageView addGestureRecognizer:rotation];
            [rotation release];
        }
            break;
        case 3://清扫手势
        {
            imageView.image = [UIImage imageNamed:@"1"];
            //图片的填充模式
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            //设置初始值为1
            number = 1;
            
            
            UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swape:)];
            //设置方向, (只支持一个方向)
            rightSwipe.direction = UISwipeGestureRecognizerDirectionRight ;
            [imageView addGestureRecognizer:rightSwipe];
            [rightSwipe release];
            
            UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swape:)];
            //设置方向, (只支持一个方向)
            leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft ;
            [imageView addGestureRecognizer:leftSwipe];
            [leftSwipe release];
            
        }
            break;
        case 4: //平移手势
        {
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            [imageView addGestureRecognizer:pan];
            [pan release];
        }
            break;
        case 5://屏幕边缘移动
        {
            //注意: 边缘移动手势触发的机制, 必须保证识图紧贴屏幕的边缘
            UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan)];
            //边缘平移只支持一个方向
            edgePan.edges = UIRectEdgeLeft;
            [self.view addGestureRecognizer:edgePan];
            [edgePan release];
        }
            break;
            case 6: //长按
        {
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
            longPress.minimumPressDuration = 1.0;// 长按时间
            [imageView addGestureRecognizer:longPress];
            [longPress release];
        }
            break;
        default:
            break;
    }
    
}

- (void)longPress:(UILongPressGestureRecognizer *)aLongPress {
    NSLog(@"%s", __FUNCTION__);
    //手势状态  aLongPress.state
//    UIGestureRecognizerStatePossible,
//    UIGestureRecognizerStateBegan,
//    UIGestureRecognizerStateChanged,
//    UIGestureRecognizerStateEnded,
//    UIGestureRecognizerStateCancelled,
//    UIGestureRecognizerStateFailed,
//    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
    if (aLongPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始");
        //屏幕截图
        UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(viewImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
    }
    if (aLongPress.state == UIGestureRecognizerStateEnded) {
        
    }
    
}

- (void)               image: (UIImage *) image
    didFinishSavingWithError: (NSError *) error
                 contextInfo: (void *) contextInfo {
    UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片以保存" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alterView show];
    [alterView release];
}

- (void)edgePan {
    NSLog(@"和耳机了");
}

- (void)pan:(UIPanGestureRecognizer *)apan {
    //手指的平移位置(x轴和y轴的偏移量)
    CGPoint point = [apan translationInView:imageView];
    NSLog(@"%@", NSStringFromCGPoint(point));
    //平移方法1
//    CGPoint temp = imageView.center;
//    temp.x += point.x;
//    temp.y += point.y;
//    imageView.center = temp;
    //方法2.
    //参数1.图片原有的transform
    //参数2.x轴位移
    //参数3.y轴位移
    imageView.transform = CGAffineTransformTranslate(imageView.transform, point.x, point.y);
    //重置point
    [apan setTranslation:CGPointZero inView:imageView];
    
}


- (void)swape:(UISwipeGestureRecognizer *)aSwape {
    if (aSwape.direction == UISwipeGestureRecognizerDirectionLeft) {
        number++;
        if (number == 4) {
            number = 1;
        }
    }
    if (aSwape.direction == UISwipeGestureRecognizerDirectionRight) {
        number--;
        if (number == 0) {
            number = 3;
        }
    }
    NSString *name = [NSString stringWithFormat:@"%ld", number];
    imageView.image = [UIImage imageNamed:name];
    
}

- (void)pinch:(UIPinchGestureRecognizer *)aPinch {
    //缩放比率
    NSLog(@"%.2lf", aPinch.scale);
    
    //transform 是UIView的属性
    //图片的变形
    //CGAffineTransform t 当前图片的缩放比率
    //参数1.原先视图的transform
    //参数2. x轴上改变的比率
    //参数3. y轴上改变的比率
    imageView.transform = CGAffineTransformScale(imageView.transform, aPinch.scale, aPinch.scale);
    
    //重置比率
    aPinch.scale = 1;
    
}

- (void)restoration:(UIRotationGestureRecognizer *)aRoration {
    //旋转角度
    NSLog(@"%.2lf", aRoration.rotation);
    
    //改变图片旋转的角度
    //参数1. 视图原先的transform
    //参数2. 变化的角度
    imageView.transform = CGAffineTransformRotate(imageView.transform, aRoration.rotation);
    
    //重置角度  180° = π = 3.14
    aRoration.rotation = 0;
}

- (void)gesture {
    NSLog(@"Hello World");
    //1.
//    if (flag) {
//        imageView.image = [UIImage imageNamed:@"hou.jpg"];
//        flag = NO;
//    } else {
//        imageView.image = [UIImage imageNamed:@"qian.jpg"];
//        flag = YES;
//    }
    //2.
    imageView.image = flag ? [UIImage imageNamed:@"hou.jpg"] : [UIImage imageNamed:@"qian.jpg"];
    flag = !flag;
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
