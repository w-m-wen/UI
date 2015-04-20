//
//  LoginViewPro.m
//  LessonPackPro
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "LoginViewPro.h"
#import "LTView.h"

@implementation LoginViewPro

- (void)dealloc
{
    [_userView release];
    [_passwordView release];
    [_loginButton release];
    [_registerButton release];
    [_forgetButton release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //重置屏幕大小
        self.frame = [[UIScreen mainScreen] bounds];
        
        self.userView = [[LTView alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 40)];
        _userView.label.text = @"用户名:";
        _userView.textField.placeholder = @"请输入用户名";
        _userView.textField.delegate = self;
        _userView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_userView];
        [_userView release];
        
        self.passwordView = [[LTView alloc] initWithFrame:CGRectMake(0, 80, self.frame.size.width, 40)];
        _passwordView.label.text = @"密码";
        _passwordView.textField.placeholder = @"请输入密码";
        _passwordView.textField.secureTextEntry = YES;
        _passwordView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_passwordView];
        [_passwordView release];
        
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







@end
