//
//  SecondViewController.m
//  AddressBook
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "SecondViewController.h"
#import "DataManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    DataManager *dataManager = [DataManager shareDatamanger];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 335, 100)];
    label.font = [UIFont systemFontOfSize: 40];
    label.backgroundColor = [UIColor whiteColor];
    label.text = dataManager.name;
    [self.view addSubview:label];
    [label release];
    
    
    
    
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
