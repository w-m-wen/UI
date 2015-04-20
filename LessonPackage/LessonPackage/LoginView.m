//
//  LoginView.m
//  LessonPackage
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

//重写初始化方法, 来完成对登陆界面控件的创建
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //重置frame, 保证登陆界面和屏幕大小一致
        self.frame = [[UIScreen mainScreen] bounds];
        //添加控件
        //用户名label
        UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
        userLabel.text = @"用户名:";
        userLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:userLabel];
        [userLabel release];
        
        //密码label
        UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
        passwordLabel.text = @"密码:";
        passwordLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:passwordLabel];
        [passwordLabel release];
        
        //用户名textField
        self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 20, 200, 40)];
        _userTextField.borderStyle = UITextBorderStyleRoundedRect;
        _userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userTextField.placeholder = @"请输入用户名";
        [self addSubview:_userTextField];
        [_userTextField release];
        
        //密码textField
        self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 100, 200, 40)];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.secureTextEntry = YES;
        [self addSubview:_passwordTextField];
        [_passwordTextField release];
        
        //登陆按钮
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginButton.frame = CGRectMake(20, 160, 100, 40);
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [self addSubview:_loginButton];

        
        //密码找回按钮
        _forgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _forgetButton.frame = CGRectMake(140, 160, 100, 40);
        [_forgetButton setTitle:@"找回密码" forState:UIControlStateNormal];
        [self addSubview:_forgetButton];
 
        
        //注册按钮
        _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _registerButton.frame = CGRectMake(260, 160, 100, 40);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [self addSubview:_registerButton];

    }
    return self;
}

- (void)dealloc
{
    [_userTextField release];
    [_passwordTextField release];
    [_loginButton release];
    [_forgetButton release];
    [_registerButton release];
    [super dealloc];
}

@end
