//
//  SublayerTransformVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "SublayerTransformVC.h"

@interface SublayerTransformVC ()

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIView *layerView1;
@property (strong, nonatomic) UIView *layerView2;


@end

@implementation SublayerTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    _layerView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 170, 170)];
    _layerView2 = [[UIView alloc] initWithFrame:CGRectMake(190, 100, 170, 170)];
    
    [self.view addSubview:_containerView];
    [_containerView addSubview:_layerView1];
    [_containerView addSubview:_layerView2];

    UIImage *snowman = [UIImage imageNamed:@"Snowman"];
    
    _layerView1.layer.contents = (__bridge id)snowman.CGImage;
    _layerView1.layer.contentsScale = snowman.scale;
    
    _layerView2.layer.contents = (__bridge id)snowman.CGImage;
    _layerView2.layer.contentsScale = snowman.scale;

    _layerView1.backgroundColor = [UIColor whiteColor];
    _layerView2.backgroundColor = [UIColor whiteColor];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500;
    _containerView.layer.sublayerTransform = transform;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:1 animations:^{
        CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
        CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
        
        _layerView1.layer.transform = transform1;
        _layerView2.layer.transform = transform2;


    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
