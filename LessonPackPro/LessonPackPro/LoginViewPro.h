//
//  LoginViewPro.h
//  LessonPackPro
//
//  Created by lanouhn on 15/3/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTView;

@interface LoginViewPro : UIView<UITextFieldDelegate>

@property (nonatomic, retain)LTView *userView, *passwordView;
@property (nonatomic, retain)UIButton *loginButton, *registerButton, *forgetButton;

@end
