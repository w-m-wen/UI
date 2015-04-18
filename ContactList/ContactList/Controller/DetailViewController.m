//
//  DetailViewController.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DetailViewController.h"

#import "Person.h"
#import "DataManager.h"

@interface DetailViewController ()
{
    UITextField *nameTextField;
    UITextField *genderTextField;
    UITextField *phoneTextField;
    UITextField *QQTextField;
}
@end

@implementation DetailViewController

- (void)dealloc
{
    [_person release];
    
    [_indexpath release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.title = self.person.name;
    
    //激活右边栏编辑状态
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 335, 40)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.placeholder = @"请输入姓名";
    nameTextField.userInteractionEnabled = NO;
    nameTextField.text = self.person.name;
    [self.view addSubview:nameTextField];
    [nameTextField release];
    
    genderTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 160, 335, 40)];
    genderTextField.borderStyle = UITextBorderStyleRoundedRect;
    genderTextField.placeholder = @"请输入性别";
    genderTextField.userInteractionEnabled = NO;
    genderTextField.text = self.person.gender;
    [self.view addSubview:genderTextField];
    [genderTextField release];
    
    phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 335, 40)];
    phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    phoneTextField.text = self.person.phoneNumber;
     phoneTextField.userInteractionEnabled = NO;
    phoneTextField.placeholder = @"请输入电话号码";
    [self.view addSubview:phoneTextField];
    [phoneTextField release];
    
    QQTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 280, 335, 40)];
    QQTextField.borderStyle = UITextBorderStyleRoundedRect;
     QQTextField.userInteractionEnabled = NO;
    QQTextField.text = self.person.QQ;
    QQTextField.placeholder = @"请输入qq";
    [self.view addSubview:QQTextField];
    [QQTextField release];

    
    
    
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
        nameTextField.userInteractionEnabled = editing;
        genderTextField.userInteractionEnabled = editing;
        phoneTextField.userInteractionEnabled = editing;
        QQTextField.userInteractionEnabled = editing;
    if (editing) {
        [nameTextField becomeFirstResponder];
    } else {
        
        //完成编辑
        [self save];
    }
}


- (void)save{
    //判断姓名和电话是否为空
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

    //创建新的person
    Person *person = [[Person alloc] initWithName:nameTextField.text gender:genderTextField.text phoneNumber:phoneTextField.text QQ:QQTextField.text];
    [DataManager modifyAtIndexPath:self.indexpath withPerson:person];
    [person release];
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
