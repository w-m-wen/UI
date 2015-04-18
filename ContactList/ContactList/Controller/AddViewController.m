//
//  AddViewController.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AddViewController.h"
#import "Person.h"
#import "DataManager.h"

@interface AddViewController ()<UIAlertViewDelegate>

{
    UITextField *nameTextField;
    UITextField *genderTextField;
    UITextField *phoneTextField;
    UITextField *QQTextField;
}

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"添加联系人";
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)] autorelease];
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 335, 40)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.placeholder = @"请输入姓名";
    [self.view addSubview:nameTextField];
    [nameTextField release];
    
    genderTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 160, 335, 40)];
    genderTextField.borderStyle = UITextBorderStyleRoundedRect;
    genderTextField.placeholder = @"请输入性别";
    [self.view addSubview:genderTextField];
    [genderTextField release];
    
    phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 335, 40)];
    phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    phoneTextField.placeholder = @"请输入电话号码";
    [self.view addSubview:phoneTextField];
    [phoneTextField release];
    
    QQTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 280, 335, 40)];
    QQTextField.borderStyle = UITextBorderStyleRoundedRect;
    QQTextField.placeholder = @"请输入qq";
    [self.view addSubview:QQTextField];
    [QQTextField release];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save)];
    
  
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)save {

    
    //判断姓名和手机号码是否为空
    if (nameTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"温馨提醒" message:@"名字不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
        return;
    }
    if (phoneTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"温馨提醒" message:@"手机号不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
        return;
    }
    
    //1.取消第一响应者
//    [nameTextField resignFirstResponder];
//    [genderTextField resignFirstResponder];
//    [phoneTextField resignFirstResponder];
//    [QQTextField resignFirstResponder];
    
    //2.取消当前正在编辑的
    [self.view endEditing:NO];
    
    
    
    Person *person = [[Person alloc] initWithName:nameTextField.text gender:genderTextField.text phoneNumber:phoneTextField.text QQ:QQTextField.text];
    [DataManager addPerson:person];
    [person release];
    
    //添加代理
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"恭喜" message:@"添加成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    NSLog(@"%@", [DataManager shareDataManager].personDic);
    
    NSLog(@"%@", [DataManager shareDataManager].letterArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIAlertViewDelegate
//点击了警告框的确定
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self dismissViewControllerAnimated:YES completion:nil];
}




/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
