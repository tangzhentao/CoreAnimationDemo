//
//  LayerMaskVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "LayerMaskVC.h"

@interface LayerMaskVC ()

@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;

@end

@implementation LayerMaskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Igloo"]];
    _imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cone"]];
    
    [self.view addSubview:_imageView1];
    _imageView1.center = self.view.center;
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _imageView1.layer.mask = _imageView2.layer;

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
