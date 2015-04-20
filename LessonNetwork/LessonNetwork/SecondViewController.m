//
//  SecondViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/4/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //同步POST
    //http://api.hudong.com/iphonexml.do?type=focus-c
    //http://api.tudou.com/v3/gw?method=album.channel.get&appKey=myKey&format=xml&channel=c&pageNo=1&pageSize=15
    NSString *urlString = @"http://api.hudong.com/iphonexml.do";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    
    //参数1.url
    //参数2.缓存策略
    //NSURLRequestUseProtocolCachePolicy = 0, 使用协议缓存策略
    //NSURLRequestReloadIgnoringLocalCacheData = 1, 忽略本地缓存
    //NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4, // Unimplemented
    //NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,
    //NSURLRequestReturnCacheDataElseLoad = 2, 返回本地缓存数据, 如果没有就加载啊
    //NSURLRequestReturnCacheDataDontLoad = 3,  直接返回本地缓存, 没有也不加载
    //NSURLRequestReloadRevalidatingCacheData = 5,
    //参数3.超时时间, 默认是60s
//     NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
//    //把url放到HTTPBody中
//    NSString *argString = @"type=focus-c";
//    urlRequest.HTTPBody = [argString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    urlRequest.HTTPMethod = @"POST";
    NSLog(@"%@", urlRequest.HTTPMethod);
    //post请求的参数存放到HTTPbody中
    NSString *argString = @"type=focus-c";
    urlRequest.HTTPBody = [argString dataUsingEncoding:NSUTF8StringEncoding];
    NSURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
    [urlRequest release];
    if (urlResponse) {
        NSLog(@"%@", urlResponse);
    }
    if (error) {
        NSLog(@"%@", error);
        
    } else {
        NSLog(@"%@", data);
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    }
    
    
    
    
    
    
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
