//
//  RootViewController.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/4/13.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    //数据持久化: 数据永久的保存
    //数据持久化的实质: 把数据写入文件, 再把文件存放到硬盘中
    
    //iOS的沙盒机制: iOS系统为每个APP生成了一个文件夹(沙盒), 这个文件夹只允许当前的app访问
    
    //沙盒的主目录
    //NSHomeDirectory(), 沙盒主目录的文件夹名字用16进制的数 和 - 组成, 保证沙盒的安全性
    NSLog(@"%@", NSHomeDirectory());
    //沙盒主目录的三个文件夹Documents, Library, tmp, 还有*.app
    
    //Documents, 文件
    //存放一些比较重要的用户信息, 比如游戏存档
    //Documents中的文件会被备份 或者 存入iCloud中, 所以存入到Documents中的文件不能够太大, 如果过大, 会在应用审核的过程中遭到拒审
    
    //参数1: 文件名称
    //参数2: 搜索域, 只有NSUserDomainMask允许用户操作, 优先级user>local>network>system
    //参数3: 相对路径或者绝对路径, yes是绝对路径, no是相对路径
    //因为相同的文件名的文件有很多个, 所以返回的是一个数组
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", paths);
    
    NSString *doumentsPath = [paths firstObject];
    NSLog(@"%@", doumentsPath);
    
    
    //Library, 资源库
    //(包括Caches和Preferences文件夹), 存储的是一些比较大的文件, 有两个子文件夹包括Caches和Preferences
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", libraryPath);
    
    //Caches, 缓存, 网页缓存, 图片缓存, 应用中的清理缓存功能, 就是清理的这个文件夹下的内容
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", cachesPath);
    
    //LaunchImages, 由LaunchScreen.xib生成的启动图片
    
    //Preferences, 偏好设置, 存储用户对这个应用的设置或配置
    //注: 路径找不到, 通过NSUserDefaults访问
    
    //tmp, 临时文件, 存放的是压缩包, 解压过后删除
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@", tmpPath);
    
    //*.app, 可以用右键显示包内容, 查看你面存放的文件, 是只读的文件
    //iOS8.0以后, *.app文件单独存放到一个文件中
    //*.app中的文件只能够访问, 不能够修改(写入)
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"%@", bundlePath);
  
    
    /*
    
    //NSFileManager,文件管理工具, 主要用于添加, 移动, 修改, 拷贝文件, 继承于NSObject
    
    //文件管理工具是一个单例
    NSFileManager *fm = [NSFileManager defaultManager];
    
    //文件路径
    //参数1.搜索的文件名
    //参数2.搜索域
    NSString *hPath = [[fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSLog(@"%@", hPath);
    
    //添加文件:有两种
    //1.创建文件夹, 加入在主目录中创建Images
    NSString *mainPath = NSHomeDirectory();
    NSString *directoryPath = [mainPath stringByAppendingPathComponent:@"Images"];
    //参数1.路径
    NSError *error = nil;
    //attributes, 设置文件夹的一些属性
//    NSDictionary *attributes = @{NSFileAppendOnly:@YES};
    BOOL result = [fm createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (result) {
        NSLog(@"success");
    } else {
        NSLog(@"fail: %@", error);
    }
    
    //2.创建文件
    //在images文件中写一个image.png
    NSString *imagePath = [directoryPath stringByAppendingPathComponent:@"image.png"];
    NSLog(@"%@", imagePath);
    
    NSString *aaPath = [[NSBundle mainBundle] pathForResource:@"aa" ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:aaPath];
    
    
    result = [fm createFileAtPath:imagePath contents:imageData attributes:nil];
    if (result) {
        NSLog(@"创建成功");
    } else {
        NSLog(@"创建失败");
    }
    
    //important*******
    //判断文件是否存在
    if ([fm fileExistsAtPath:imagePath]) {
        NSLog(@"存在");
        //删除
        NSError *error = nil;
        BOOL result = [fm removeItemAtPath:imagePath error:&error];
        if (result) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"失败:%@", error);
        }
    }
    
    NSString *path = NSHomeDirectory();
    //自动加斜杠"/"
    NSString *filePath = [path stringByAppendingPathComponent:@"aaa.txt"];
    NSLog(@"%@", filePath);
    
    //写什么加什么
    NSString *filePath1 = [path stringByAppendingString:@"/aaa.txt"];
    NSLog(@"%@", filePath1);
    
    //些什么加什么
    NSString *filePath2 = [path stringByAppendingFormat:@"/aaa.txt"];
    NSLog(@"%@", filePath2);
    
    //自动加"."
    NSString *filePath3 = [path stringByAppendingPathExtension:@"aaa.txt"];
    NSLog(@"%@", filePath3);
    
    
    
    
    self.title = @"数据持久化";
    
    //数据持久化的方式
    
    //1.NSUserDefaults, 继承于NSObject, 单例设计模式, 内部存值用的是KVC模式
    NSInteger money = 10000;
    money -= 9999;
    
    //存数据, 存到Preferences文件夹内的*.plist文件中, 以字典的形式存储
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"myMoney"];
    //同步操作, 让存入的数据写入文件
    [userDefaults synchronize];
    
    //取数据, key和存数据的key保持一致
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSInteger myMoney = [user integerForKey:@"myMoney"];
    NSLog(@"%ld", myMoney);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger Money = [defaults integerForKey:@"myLiftMoney"];
    if (Money <= 10) {
        NSLog(@"收费不能话了");
    } else {
        NSLog(@"划了10快钱, 吃了来年份热干面!");
        Money -= 10;
        [defaults setInteger:Money forKey:@"myLiftMoney"];
        [defaults synchronize];
    }
    //NSUserDefaults, 支持的数据类型: array, dictionary, String, data, date, number, bool
    
    //NSUserDefaults, 一般存储一些数值, 不存储大量的数据
    
    //是不是第一次启动
    NSUserDefaults *useDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isFirst = [useDefaults boolForKey:@"isFirst"];
    if (isFirst == NO) {
        NSLog(@"第一次启动");
        [useDefaults setBool:YES forKey:@"isFirst"];
    } else {
        NSLog(@"不是第一i");
    }
    */
    /*
    //2.文件
     
     读写, 是一个替换的过程
    //支持:NSString, NSArray, NSDictionary, NSData 四种数据类型
    //注: 集合(NSArray, NSDictionary)中的元素必须是这四种类型, 才能够后进行文件读写
     
     
    //写入操作
    NSString *string = @"案阿迪卡卡拉到啦与蝴蝶结啊大";
    //存储数据, 首先指定文件路径
    //Documents的路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //指定文件的路径 aaa.txt
    NSString *filePath = [docPath stringByAppendingPathComponent:@"aaa.txt"];
    NSLog(@"%@", filePath);
    
    //写入文件
    //参数1. 需要写入的文件路径, 如果文件路径下没有此文件名, 系统会自动创建一个文件
    //参数2.是否使用辅助文件, no时候是不使用,但是可以提高效率, yes的时候使用辅助文件(因为直接写入的时候可能会使文件损坏)
    //参数3.编码格式
    //参数4.错误
    NSError *error = nil;
    BOOL result =  [string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result) {
        NSLog(@"写入成功");
    } else {
         NSLog(@"写入失败哦:%@", error);
    }
    
    //取值操作
    NSError *error1 = nil;
    NSString *contentString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error1];
    if (error1) {
        NSLog(@"失败:%@", error1);
    } else {
        NSLog(@"成功:%@", contentString);
    }
    [contentString release];
    */
    
    /*
    //NSArray的文件读写
    
    NSArray *array = @[@"ada", @"123", @"hhi"];
    
    //写入操作, 格式xml
    
    //Library,下的文件text.txt
    //Library的路径
    NSString *arrayPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    //文件路径
    NSString *filePath = [arrayPath stringByAppendingPathComponent:@"text.txt"];
    NSLog(@"%@", filePath);
    //写入
    BOOL result = [array writeToFile:filePath atomically:YES];
    //判断
    if (result) {
        NSLog(@"写入成功!");
    } else {
        NSLog(@"出现错误!");
    }
   
    //取值操作
    NSArray *contentArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSLog(@"%@", contentArray);
    [contentArray release];
    
    */
    
    /*
    //NSDictionary, 格式也是xml
    
    //caches , dic.txt
    //定义一个字典
    NSDictionary *dic = @{@"liss": @"hdj", @"huh": @"hfjhi", @"xuliu": @"LOVE"};
    //dic的路径
    NSString *dicPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //文件的路径
    NSString *filePath = [dicPath stringByAppendingPathComponent:@"dic.txt"];
    NSLog(@"%@", filePath);
    
    //写入
    BOOL result = [dic writeToFile:filePath atomically:YES];
    //判断是否写入成功
    if (result) {
        NSLog(@"成功");
    } else {
        NSLog(@"失败");
    }
    
    //取值操作
    NSDictionary *contentDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSLog(@"%@", contentDic);
    //释放
    [contentDic release];
    */
    
    /*
    
    //NSData
    NSString *string = @"123456789";
    //字符串转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //tmp data.txt
    //tmp路径
    NSString *dataPath = NSTemporaryDirectory();
    //data.txt路径
    NSString *filePath = [dataPath stringByAppendingPathComponent:@"data.txt"];
    //写入
    BOOL result = [data writeToFile:filePath atomically:YES];
    //判断是否写入
    if (result) {
        NSLog(@"succeed");
    } else {
        NSLog(@"失败");
    }
    //取值
    NSData *contentData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSString *str = [[[NSString alloc] initWithData:contentData encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"%@", str);
    [contentData release];
    */
    
    
    //3.归档 / 反归档
    //归档的实质是:把其他类型(如Person)的数据, 先转换成NSData, 在写入文件
    //能进行归档的对象, 必须遵守<NSCoding>协议
    
    //归档
    Person *person = [[[Person alloc] init] autorelease];
    person.name = @"笑笑";
    person.age = @"18";
    person.gender = @"女";
    NSLog(@"%@", person);
    
    //可变的data
    NSMutableData *mData = [[NSMutableData alloc] initWithCapacity:0];
    //NSKeyedArchiver. 压缩工具, 继承于NSCoder, NSCoder继承于NSObject, 主要是用于编码
    NSKeyedArchiver *archive = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
    //把person对象压到Data中
    [archive encodeObject:person forKey:@"girlFriend"];
    //完成压缩
    [archive finishEncoding];
    [archive release];

    NSLog(@"%@", mData);
    
    //主目录中, person.txt
    NSString *homePath = NSHomeDirectory();
    
    NSString *filePath = [homePath stringByAppendingPathComponent:@"person.txt"];
    NSLog(@"%@", filePath);
    
    BOOL result = [mData writeToFile:filePath atomically:YES];
    if (result) {
        NSLog(@"succeed");
    } else {
        NSLog(@"shibai");
    }
    [mData release];
    
    //反归档(读取内容)
    NSData *contentData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //解压工具NSKeyedUnarchiver, 继承于NSCoder
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:contentData];
    [contentData release];
    //通过key值找到person对象
    Person *contentPerson = [unarchiver decodeObjectForKey:@"girlFriend"];
    
    NSLog(@"%@", contentPerson);
    [unarchiver release];

    
    
    
    
    
    
    
    
    
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
