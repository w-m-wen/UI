//
//  AppDelegate.m
//  LessonPackage 封装
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginView.h"
#define kREGISTERVIEW 100 //宏定义注册界面的tag值


#define kLOGINVIEW 200  //登陆页面的tag值
#define kLOGINUSERTEXTFIELD 201
#define kLOGINPASSWORDTEXTFIELD 202


#define kFINDPASSWORDVIEW 300 //找回密码界面tag值
@interface AppDelegate () {
    LoginView *loginView; //写成实例变量扩大作用范围
}

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//#pragma mark -创建找回密码界面
//    [self creatFindPasswordView];
//    
//#pragma mark -创建注册界面
//    [self creatRegisterView];
//    
//#pragma mark -创建登陆界面
//    [self creatLoginView];
    
    
    loginView = [[LoginView alloc] initWithFrame:CGRectZero];
    [loginView.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"a"]];
    [self.window addSubview:loginView];
    [loginView release];
    
    
    
    
    
    return YES;
}



#pragma mark -创建登陆界面方法
- (void)creatLoginView {
    //登陆界面
    UIView *loginView = [[UIView alloc] initWithFrame:_window.bounds];
    loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"01.jpg"]];
    loginView.tag = kLOGINVIEW;
    [self.window addSubview:loginView];
    [loginView release];
    
    //添加控件
    //用户名label
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
    userLabel.text = @"用户名:";
    userLabel.backgroundColor = [UIColor redColor];
    [loginView addSubview:userLabel];
    [userLabel release];
    
    //密码label
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    passwordLabel.text = @"密码:";
    passwordLabel.backgroundColor = [UIColor redColor];
    [loginView addSubview:passwordLabel];
    [passwordLabel release];
    
    //用户名textField
    UITextField *userTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 20, 200, 40)];
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.tag = kLOGINUSERTEXTFIELD;
    userTextField.delegate = self;
    userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userTextField.placeholder = @"请输入用户名";
    [loginView addSubview:userTextField];
    [userTextField release];
    
    //密码textField
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 100, 200, 40)];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.tag = kLOGINPASSWORDTEXTFIELD;
    passwordTextField.delegate = self;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.placeholder = @"请输入密码";
    passwordTextField.secureTextEntry = YES;
    [loginView addSubview:passwordTextField];
    [passwordTextField release];
    
    //登陆按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame = CGRectMake(20, 160, 100, 40);
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginView addSubview:loginButton];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    //密码找回按钮
    UIButton *searchPwdButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchPwdButton.frame = CGRectMake(140, 160, 100, 40);
    [searchPwdButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [loginView addSubview:searchPwdButton];
    [searchPwdButton addTarget:self action:@selector(pushToFindPasswordView) forControlEvents:UIControlEventTouchUpInside];
    
    //注册按钮
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    registerButton.frame = CGRectMake(260, 160, 100, 40);
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginView addSubview:registerButton];
    //给注册按钮关联事件
    [registerButton addTarget:self action:@selector(pushToRegisterView) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark -登陆界面的登陆按钮的方法
- (void)login {
    //登陆页面
//    UIView *loginView = [self.window viewWithTag:kLOGINVIEW];
//    //登陆页面上的用户名输入框
//    UITextField *userTextField = (UITextField *)[loginView viewWithTag:kLOGINUSERTEXTFIELD];
//    
//    //登陆界面上的密码输入框
//    UITextField *passwordTextField = (UITextField *)[loginView viewWithTag:kLOGINPASSWORDTEXTFIELD];
    
    
    if (loginView.userTextField.text.length == 0) {
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alterView show];
        [alterView release];
    } else if(loginView .passwordTextField.text.length == 0) {
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alterView show];
        [alterView release];
    } else {
        if ([loginView.userTextField.text isEqualToString:@"wmw"] && [loginView.passwordTextField.text isEqualToString:@"123"]) {
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登陆成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alterView show];
            [alterView release];
        } else {
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或者密码不正确" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alterView show];
            [alterView release];
        }
    }
}

#pragma mark - 登陆界面的注册按钮的功能
- (void)pushToRegisterView {
    //找到注册界面
    UIView *registerView = [self.window viewWithTag:kREGISTERVIEW];
    //注册界面提前
    [self.window bringSubviewToFront:registerView];
}


#pragma mark -- registerview注册界面

- (void)creatRegisterView {
    //注册界面
    UIView *registerView = [[UIView alloc] initWithFrame:_window.frame];http:
    registerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ada"]];
    registerView.tag = kREGISTERVIEW;
    [self.window addSubview:registerView];
    [registerView release];
    
    //创建一个数组
    NSArray *nameArray = @[@"用户名", @"密码", @"确认密码", @"手机号", @"邮箱", @"住址"];
//    NSArray *textArray = @[@"请输入用户名"];
    
    //创建多个输入控件
    for (NSInteger i = 0; i < 6; i++) {
        //创建label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + 60 * i, 100, 40)];
        label.backgroundColor = [UIColor whiteColor];
        [registerView addSubview:label];
        label.text = [NSString stringWithFormat:@"%@:", nameArray[i]];
        label.textAlignment = NSTextAlignmentCenter;
        [label release];
        //创建textField
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(140, 20 + 60 * i, 220, 40)];
        if (i == 2) {
            textField.placeholder = @"请再次输入密码";
        }
        switch (i) {
            case 1:
                textField.secureTextEntry = YES;
                break;
            case 2:
                textField.secureTextEntry = YES;
                break;
            default:
                break;
        }
        if (i == 3) {
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }
        if (i == 4) {
            textField.keyboardType = UIKeyboardTypeEmailAddress;
        }
        textField.delegate = self;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.placeholder = [NSString stringWithFormat:@"请输入%@", nameArray[i]];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [registerView addSubview:textField];
        [textField release];
    }
    //注册按钮
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    registerButton.frame = CGRectMake(40, 400, 100, 40);
    registerButton.layer.cornerRadius = 10;
    registerButton.backgroundColor = [UIColor whiteColor];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerView addSubview:registerButton];
    
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelButton.layer.cornerRadius = 10;//设置button的弧度
    cancelButton.frame = CGRectMake(200, 400, 100, 40);
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [registerView addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(pushToLoginView) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark -回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//点击取消按钮实现的功能
- (void)pushToLoginView {
    //找到登陆界面
    UIView *LoginView = [_window viewWithTag:kLOGINVIEW];
    //登陆界面提前
    [_window bringSubviewToFront:LoginView];
}

#pragma mark -找回密码页面

- (void)creatFindPasswordView {
    
    //创建找回密码界面
    UIView *findPasswordView = [[UIView alloc] initWithFrame:self.window.frame];
    findPasswordView.backgroundColor = [UIColor greenColor];
    findPasswordView.tag = kFINDPASSWORDVIEW;
    [self.window addSubview:findPasswordView];
    [findPasswordView release];
    
    //创建邮箱输入框
    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 60, self.window.frame.size.width - 120, 30)];
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    emailTextField.placeholder = @"请输入邮箱";  //设置占位符
    emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//设置清空符
    emailTextField.keyboardType = UIKeyboardTypeEmailAddress;  //设置键盘模式
    [findPasswordView addSubview:emailTextField];
    [emailTextField release];
    
    //找回按钮
    UIButton * findButton = [UIButton buttonWithType:UIButtonTypeSystem];
    findButton.frame = CGRectMake(80, 150, self.window.frame.size.width / 2 - 100, 30);
    findButton.layer.cornerRadius = 10;
    findButton.backgroundColor = [UIColor whiteColor];
    [findButton setTitle:@"找回" forState:UIControlStateNormal];
    [findPasswordView addSubview:findButton];
    
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelButton.frame = CGRectMake(self.window.frame.size.width/2 + 30, 150, self.window.frame.size.width/2 - 100, 30);
    cancelButton.layer.cornerRadius = 10;
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor whiteColor];
    [findPasswordView addSubview:cancelButton];
    //为找回密码界面的 取消 按钮添加事件
    [cancelButton addTarget:self action:@selector(pushToLoginView) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -实现在登陆界面的找回密码按钮的功能
- (void)pushToFindPasswordView {
    //找到找回密码界面
    UIView *passwordView = [self.window viewWithTag:kFINDPASSWORDVIEW];
    //把找回密码界面提到最前
    [self.window bringSubviewToFront:passwordView];
    
}




//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
