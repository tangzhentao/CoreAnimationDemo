//
//  TableViewController.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "TableViewController.h"
#import "DemoItem.h"
#import "LayerMaskVC.h"
#import "GroupOpacityVC.h"
#import "AffineTransformVC.h"
#import "Transform3DVC.h"
#import "SublayerTransformVC.h"
#import "OuterInnerTransformVC.h"
#import "CubeVC.h"

static NSString *UITableViewCellID = @"UITableViewCell";

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation TableViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self registerTableCell];
    
    [self setupData];
    
}

- (void)setupData
{
    [self.dataArray addObject:[DemoItem itemWithName:@"4.12 LayerMaskVC" className:@"LayerMaskVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"4.20 GroupOpacityVC" className:@"GroupOpacityVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"5.3 AffineTransformVC" className:@"AffineTransformVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"5.4 Transform3DVC" className:@"Transform3DVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"5.5 SublayerTransformVC" className:@"SublayerTransformVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"5.7 OuterInnerTransformVC" className:@"OuterInnerTransformVC"]];
    [self.dataArray addObject:[DemoItem itemWithName:@"5.9 CubeVC" className:@"CubeVC"]];

    
}

- (void)registerTableCell
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [_dataArray[indexPath.row] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
    NSString *className = [_dataArray[indexPath.row] className];
    
    UIViewController *vc = [NSClassFromString(className) new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
