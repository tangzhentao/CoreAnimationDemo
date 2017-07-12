//
//  AffineTransformVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "AffineTransformVC.h"

@interface AffineTransformVC ()

@property (strong, nonatomic) UIView *layerView;

@end

@implementation AffineTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:_layerView];
    
    _layerView.center = self.view.center;
    _layerView.backgroundColor = [UIColor whiteColor];
    
    _layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"Snowman"].CGImage;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:1 animations:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, 0.5, 0.5);
        transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
        transform = CGAffineTransformTranslate(transform, 200, 0);
        _layerView.layer.affineTransform = transform;

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
