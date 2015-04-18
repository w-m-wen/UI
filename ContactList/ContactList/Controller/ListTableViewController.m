//
//  ListTableViewController.m
//  ContactList
//
//  Created by lanouhn on 15/4/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ListTableViewController.h"
#import "DataManager.h"
#import "PersonTableViewCell.h"
#import "AddViewController.h"
//#import "AppDelegate.h"
#import "DetailViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通讯录";
    self.tableView.rowHeight = 70;
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)] autorelease];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)add {
    
//    AddViewController *addView = [[AddViewController alloc] init];
//    [self.navigationController pushViewController:addView animated:YES];
//    [addView release];
    
    //模态推出, (两个视图控制器之间的切换, 一般用于关联不大的页面)
    
    AddViewController *addVC = [[AddViewController alloc] init];
    UINavigationController *nacV = [[UINavigationController alloc] initWithRootViewController:addVC];
    [addVC release];
    [self presentViewController:nacV animated:YES completion:nil];
    [nacV release];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITabelViewDataSource
//分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    DataManager *dataMabager = [DataManager shareDataManager];
    
    return dataMabager.letterArray.count;
    return 2;
}

//分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [DataManager numberOfRowInSection:section];
    return 2;
}

//返回cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *str = @"CELL";
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[[PersonTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
    }
    
    cell.person = [DataManager personAtIndexPath:indexPath];
    
    return cell;
}

//分区标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"*********%@", [[DataManager shareDataManager].letterArray objectAtIndex:section]);
    return [[DataManager shareDataManager].letterArray objectAtIndex:section];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //当数据源发生变化的时候, 要及时的通知tabelView刷新数据
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITabelViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    detailVC.person = [DataManager personAtIndexPath:indexPath];
    detailVC.indexpath = indexPath;
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];
}


@end
