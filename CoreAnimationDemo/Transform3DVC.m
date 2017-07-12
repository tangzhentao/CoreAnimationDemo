//
//  Transform3DVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "Transform3DVC.h"

@interface Transform3DVC ()

@property (strong, nonatomic) UIView *layerView;


@end

@implementation Transform3DVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:_layerView];
    
    _layerView.center = self.view.center;
    _layerView.backgroundColor = [UIColor whiteColor];
    
    _layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"Snowman"].CGImage;
    _layerView.layer.contentsScale = [UIImage imageNamed:@"Snowman"].scale;
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _layerView.layer.doubleSided = NO; 只绘制正面
    [UIView animateWithDuration:1 animations:^{
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0 / 600;
        transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
        _layerView.layer.transform = transform;
    }];
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
