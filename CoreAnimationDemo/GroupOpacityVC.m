//
//  GroupOpacityVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "GroupOpacityVC.h"

@interface GroupOpacityVC ()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UILabel *label;

@end

@implementation GroupOpacityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _label = [[UILabel alloc] init];
    
    [self.view addSubview:_button1];
    [self.view addSubview:_button2];
    [_button1 setTitle:@"hello world！" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor blackColor] forState :UIControlStateNormal];

    [_button2 addSubview:_label];
    
    _button1.frame = CGRectMake(100, 100, 120, 40);
    _button2.frame = CGRectMake(100, 200, 120, 40);
    
    _label.text = @"hello world";
    _label.frame = CGRectMake(10, 10, 100, 20);
    
    _button1.backgroundColor = [UIColor whiteColor];
    _button2.backgroundColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor whiteColor];
    
    
    _button2.alpha = 0.5;
    
    BOOL should = _button2.layer.shouldRasterize;
    
//    _label.alpha = 0.5;
//    _button1.layer.opacity = 0.5;

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
