//
//  ThirdViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/4/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<NSURLConnectionDelegate>

@property (nonatomic, retain)NSMutableData *data;

@end

@implementation ThirdViewController

- (void)dealloc
{
    [_data release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //http://api.map.baidu.com/place/v2/search?query=大保健&region=郑州&output=json&ak=6E823f587c95f0148c19993539b99295
    //http://image.zcool.com.cn/56/13/1308200901454.jpg
    //异步GET
    
    NSString *urlString = @"http://api.map.baidu.com/place/v2/search?query=杨翔&region=郑州&output=json&ak=6E823f587c95f0148c19993539b99295";
    //当url中包含中文时候, 要对url进行转码
    NSString *changeString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [[NSURL alloc] initWithString:changeString];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    //发起异步请求
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - NSURLConnectionDelegate

//链接失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

//收到服务器的回应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%@", response);
    self.data = [NSMutableData dataWithCapacity:0];
}

//收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%@", data);
    [self.data appendData:data];
//    NSString *String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", String);
}

//请求完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"end");
    NSString *string = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
}






@end
