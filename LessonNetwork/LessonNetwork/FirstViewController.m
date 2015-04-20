//
//  FirstViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/4/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)pressButton;

@end

@implementation FirstViewController

- (IBAction)pressButton {
    
    //同步请求胡阻塞主线程, 出现程序假死的状态
    NSString *urlString = @"http://image.zcool.com.cn/56/13/1308200901454.jpg";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [url release];
    NSURLResponse *urlRespond = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlRespond error:&error];
    [urlRequest release];
    if (urlRespond) {
        NSLog(@"%@", urlRespond);
    }
    if (error) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"%@", data);
        UIImage *image = [UIImage imageWithData:data];
        self.imageView.image = image;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///http://api.hudong.com/iphonexml.do?type=focus-c
    //http://api.map.baidu.com/place/v2/search?query=大保健&region=郑州&output=json&ak=6E823f587c95f0148c19993539b99295
    //http://image.zcool.com.cn/56/13/1308200901454.jpg
    
    //一、北京新闻晚报(异步get) json
    //
    //http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213
    //
    //
    //二、土豆(异步post) xml
    //
    //http://api.tudou.com/v3/gw?method=album.channel.get&appKey=myKey&format=xml&channel=c&pageNo=1&pageSize=15
    /*
    //同步GET
    //网站url字符串
    NSString *urlString = @"http://api.hudong.com/iphonexml.do?type=focus-c";
    //网址
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    //创建请求
    //NSURLRequest, url的请求类 继承于NSObject
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [url release];
    //建立链接,NSURLConnection, url链接类, 继承于NSObject
    //参数1. url请求
    //参数2.服务器的响应
    //参数3.出现的错误
  
    NSURLResponse *urlResponse = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
    [urlRequest release];
    //NSURLResponse, url的响应类, 继承与NSObject
    if (urlResponse) {
        NSLog(@"服务器响应:%@", urlResponse);
        //status code: 200, headers, 状态码, 200代表响应正常
        //Server = "nginx/0.7.61";服务器架构
        //domain=.baike.com; path=/,域名
        //charset=utf-8"; 编码格式
        //文本内容
    }
    if (error) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"%@", data);
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        [string release];
    }
    */
    
    
    
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

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}

@end
