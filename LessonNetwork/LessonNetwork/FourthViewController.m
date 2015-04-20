//
//  FourthViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/4/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<NSURLConnectionDelegate>

@property (nonatomic, retain)NSMutableData *data;

@end

@implementation FourthViewController

- (void)dealloc
{
    [_data release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //异步POST
    NSString *urlString = @"http://api.tudou.com/v3/gw";
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    urlRequest.HTTPMethod = @"POST";
    NSString *argString = @"method=album.channel.get&appKey=myKey&format=xml&channel=c&pageNo=1&pageSize=15";
    urlRequest.HTTPBody = [argString dataUsingEncoding:NSUTF8StringEncoding];
//    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%@", response);
        NSLog(@"%@", data);
        NSLog(@"%@", connectionError);
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        [string release];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

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
