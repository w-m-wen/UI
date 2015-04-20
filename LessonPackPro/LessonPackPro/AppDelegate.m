//
//  AppDelegate.m
//  LessonPackPro
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginView.h"
#import "LTView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window retain];
    [super dealloc];
}

//程序完成加载
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //打印方法名
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"as"]];
    [self.window makeKeyAndVisible];
    
//    LoginView *loginView = [[LoginView alloc] initWithFrame:CGRectZero];
//    loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"as"]];
//    [_window addSubview:loginView];
//    [loginView release];
    
//    LTView *ltView = [[LTView alloc] initWithFrame:CGRectMake(0, 20, _window.frame.size.width, 40)];
////    ltView.backgroundColor = [UIColor whiteColor];
//    ltView.label.text = @"用户名";
//    ltView.textField.placeholder = @"请输入用户名";
//    [self.window addSubview:ltView];
//    [ltView release];
    
//    LoginView *loginView = [[LoginView alloc] initWithFrame:CGRectZero];
//    [self.window addSubview:loginView];
//    [loginView release];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.center = self.window.center;
    
    
    
    return YES;
}

//将要成为非激活状态(程序即将进入后台)
- (void)applicationWillResignActive:(UIApplication *)application {
    
        NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
        NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//程序将要进入前台(伴随着程序即将激活)
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
        NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//程序已经激活
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
        NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


//程序将要终止
- (void)applicationWillTerminate:(UIApplication *)application {
    
        NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
