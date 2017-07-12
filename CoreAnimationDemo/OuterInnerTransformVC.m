//
//  OuterInnerTransformVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "OuterInnerTransformVC.h"

@interface OuterInnerTransformVC ()

@property (strong, nonatomic) UIView *outerView;
@property (strong, nonatomic) UIView *innerView;

@end

@implementation OuterInnerTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _outerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _innerView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    
    _outerView.center = self.view.center;

    _outerView.backgroundColor = [UIColor whiteColor];
    _innerView.backgroundColor = [UIColor grayColor];

    [self.view addSubview:_outerView];
    [_outerView addSubview:_innerView];
    


    
    
}
/*
 在二维空间上，先顺时针旋转外部视图45度，
 然后，逆时针旋转内部视图45度。
 观看效果;
 内部视图会被旋转被抵消。
 */
- (void)transform2D
{
    CATransform3D outerTransform = CATransform3DMakeRotation( M_PI_4, 0, 0, 1);
    _outerView.layer.transform = outerTransform;
    
    CATransform3D innerTransform = CATransform3DMakeRotation( -M_PI_4, 0, 0, 1);
    _innerView.layer.transform = innerTransform;
}

/*
 在三维空间上，先沿y轴顺时针旋转外部视图45度，
 然后，沿y轴逆时针旋转内部视图45度。
 观看效果：
 没有被抵消。
 */
- (void)transform3D
{
    CATransform3D outerTransform = CATransform3DIdentity;
    outerTransform.m34 = -0.1 / 200;
    outerTransform = CATransform3DRotate(outerTransform, M_PI / 180 * 70, 0, 1, 0);
    _outerView.layer.transform = outerTransform;
    
    CATransform3D innerTransform = CATransform3DIdentity;
    innerTransform.m34 = -0.1 / 200;
    innerTransform = CATransform3DRotate(innerTransform, -M_PI / 180 * 70, 0, 1, 0);
    _innerView.layer.transform = innerTransform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
//        [self transform2D];
        
        [self transform3D];
    }];
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
