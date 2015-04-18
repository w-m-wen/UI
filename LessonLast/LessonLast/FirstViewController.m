//
//  FirstViewController.m
//  LessonLast
//
//  Created by lanouhn on 15/4/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FirstViewController.h"
#import "ImageCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

static NSString *cellIdentifier = @"imageCell";


@interface FirstViewController ()<UICollectionViewDataSource>
@property (retain, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (nonatomic, retain)NSArray *dataArray;
@end

@implementation FirstViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
    NSString *urlString = @"http://115.28.227.1/teacher/duke/getAndPostRequest.php?param=imageResource.json";
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    //duilei, zidong 生成线程
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [url release];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%@", response);
        NSLog(@"%@", data);
        
        NSError *error = nil;
        self.dataArray = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"%@", self.dataArray);
        
        //回到主线程执行
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageCollectionView reloadData];
        });
   
    }];
    */
    
    //识别之后自动解析
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //添加支持的数据格式
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:@"http://115.28.227.1/teacher/duke/getAndPostRequest.php?param=imageResource.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.dataArray = responseObject;
        //刷新数据
        [self.imageCollectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
    
    //通过nib注册cell
    UINib *nib = [UINib nibWithNibName:@"ImageCell" bundle:[NSBundle mainBundle]];
    [self.imageCollectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifier];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    NSString *urlString1 =  [[self.dataArray objectAtIndex:indexPath.row] objectForKey: @"thumbURL"];
    //整体加载完成后才显示
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString1]]];

    //图片加载不按顺序, 谁加载完成谁显示
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString1]];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString1] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    return cell;
}

- (void)dealloc {
    [_dataArray release];
    [_imageCollectionView release];
    [super dealloc];
}
@end
