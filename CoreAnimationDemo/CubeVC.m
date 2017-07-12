//
//  CubeVC.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/12.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "CubeVC.h"
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define  AMBIENT_LIGHT 0.5

@interface CubeVC ()

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) NSArray *faces;

@end

@implementation CubeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    [self configUI];
    
    [self addUI];
    
//    [self tranformUI];
    
    [self tranformUI1];

}

- (void)createUI
{
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    UIView *face1 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"1"];
    UIView *face2 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"2"];
    UIView *face3 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"3"];
    UIView *face4 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"4"];
    UIView *face5 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"5"];
    UIView *face6 = [self faceWithFrame:CGRectMake(100, 200, 200, 200) Title:@"6"];
    
    _faces = @[face1, face2, face3, face4, face5, face6];

}

- (UIView *)faceWithFrame:(CGRect )frame Title:(NSString *)title
{
    UIView *face = [[UIView alloc] initWithFrame:frame];
//    face.layer.borderWidth = 1;
//    face.alpha = 0.5;
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:40];
    [label sizeToFit];
    label.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
    label.textColor = [UIColor greenColor];
    [face addSubview:label];
    return face;
}

- (void)configUI
{
    
    CATransform3D prespective = CATransform3DIdentity;
    prespective.m34 = -1.0 / 500;
    _containerView.layer.transform = prespective;
    
    for (UIView*view in _faces) {
        view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)addUI
{
    [self.view addSubview:_containerView];
    
    for (UIView*view in _faces) {
        [_containerView addSubview:view];
    }
}

- (void)tranformUI
{
    CGFloat angle = M_PI / 180 * 88;
    //    CGFloat angle = M_PI_2;
    
    CATransform3D transform5 = CATransform3DMakeTranslation(0, 0, 200);

    CATransform3D transform4 = CATransform3DIdentity;
    transform4 = CATransform3DTranslate(transform4, 0, 0, 100);
    transform4 = CATransform3DTranslate(transform4, 0, 100, 0);
    transform4 = CATransform3DRotate(transform4, -angle, 1, 0, 0);
    
    CATransform3D transform3 = CATransform3DIdentity;
    transform3 = CATransform3DTranslate(transform3, 0, 0, 100);
    transform3 = CATransform3DTranslate(transform3, 0, -100, 0);
    transform3 = CATransform3DRotate(transform3, angle, 1, 0, 0);
    
    CATransform3D transform2 = CATransform3DIdentity;
    transform2 = CATransform3DTranslate(transform2, 100, 0, 0);
    transform2 = CATransform3DTranslate(transform2, 0, 0, 100);
    transform2 = CATransform3DRotate(transform2, angle, 0, 1, 0);
    
    CATransform3D transform1 = CATransform3DIdentity;
    transform1 = CATransform3DTranslate(transform1, -100, 0, 0);
    transform1 = CATransform3DTranslate(transform1, 0, 0, 100);
    transform1 = CATransform3DRotate(transform1, -angle, 0, 1, 0);
    
    CATransform3D transform0 = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    [_faces[5] layer].transform = transform5;
    [_faces[4] layer].transform = transform4;
    [_faces[3] layer].transform = transform3;
    [_faces[2] layer].transform = transform2;
    [_faces[1] layer].transform = transform1;
    [_faces[0] layer].transform = transform0;
}

- (void)tranformUI1
{
    CGFloat angle = M_PI_2;
    
    CATransform3D transform5 = CATransform3DMakeTranslation(0, 0, 100);
    
    CATransform3D transform4 = CATransform3DIdentity;
    transform4 = CATransform3DTranslate(transform4, 0, 100, 0);
    transform4 = CATransform3DRotate(transform4, -angle, 1, 0, 0);
    
    CATransform3D transform3 = CATransform3DIdentity;
    transform3 = CATransform3DTranslate(transform3, 0, -100, 0);
    transform3 = CATransform3DRotate(transform3, angle, 1, 0, 0);
    
    CATransform3D transform2 = CATransform3DIdentity;
    transform2 = CATransform3DTranslate(transform2, 100, 0, 0);
    transform2 = CATransform3DRotate(transform2, angle, 0, 1, 0);
    
    CATransform3D transform1 = CATransform3DIdentity;
    transform1 = CATransform3DTranslate(transform1, -100, 0, 0);
    transform1 = CATransform3DRotate(transform1, -angle, 0, 1, 0);
    
    CATransform3D transform0 = CATransform3DIdentity;
    transform0 = CATransform3DTranslate(transform0, 0, 0, -100);
    transform0 = CATransform3DRotate(transform0, M_PI, 1, 0, 0);
    
    [_faces[5] layer].transform = transform5;
    [_faces[4] layer].transform = transform4;
    [_faces[3] layer].transform = transform3;
    [_faces[2] layer].transform = transform2;
    [_faces[1] layer].transform = transform1;
    [_faces[0] layer].transform = transform0;
    
    
}

- (void)applyLightingToFace:(CALayer *)face
{
//    // add lighting face
//    CALayer *layer = [CALayer layer];
//    layer.frame = face.bounds;
//    [face addSublayer:layer];
//    
//    // convert transform to matrix
//    CATransform3D transfrom = face.transform;
//    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transfrom;
//    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
//    
//    // get face normal
//    GLKVector3 normal = GLKVector3Make(0, 0, 1);
//    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
//    normal = GLKVector3Normalize(normal);
//    
//    // get dot production with light direction
//    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
//    float dotProduct = GLKVector3DotProduct(light, normal);
//    
//    // set light layer opacity
//    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
//    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
//    layer.backgroundColor = color.CGColor;
    
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self transformContainerView];
}

- (void)transformContainerView
{
   
    
//    [UIView animateWithDuration:1 animations:^{
        CATransform3D prespective = CATransform3DIdentity;
        prespective.m34 = -1.0 / 500;
        prespective = CATransform3DRotate(prespective, -M_PI_4, 1, 0, 0);
        prespective = CATransform3DRotate(prespective, -M_PI_4, 0, 1, 0);
        _containerView.layer.sublayerTransform = prespective;
        
        for (UIView *face in _faces) {
            [self applyLightingToFace:face.layer];
        }
//    }];

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
