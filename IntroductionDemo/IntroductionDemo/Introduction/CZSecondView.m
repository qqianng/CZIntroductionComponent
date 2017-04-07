//
//  CZSecondView.m
//  IntroductionTest
//
//  Created by new on 17/2/14.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#define UIScreenW [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define UIScreenH [UIScreen mainScreen].bounds.size.height //屏幕高度
#import "CZSecondView.h"

@interface CZSecondView ()

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleView;

@end

@implementation CZSecondView

+ (instancetype)secondView {
    CZSecondView *secondView = [[NSBundle mainBundle] loadNibNamed:@"CZSecondView" owner:nil options:nil].lastObject;
    return secondView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //通知布局view，从而获得正确的布局信息。
    self.bounds = CGRectMake(0, 0, UIScreenW, UIScreenH);
    [self layoutIfNeeded];
    self.image4.layer.zPosition = 1.0;
    
    //titleView
    CAKeyframeAnimation *anim_title = [CZIntroTool keyframeAnimation];
    anim_title.keyPath = @"opacity";
    anim_title.beginTime = 0.5;
    anim_title.duration = 1.0;
    anim_title.values = @[@0.0, @1.0, @0.0];
    [self.titleView.layer addAnimation:anim_title forKey:nil];
    [self.subTitleView.layer addAnimation:anim_title forKey:nil];
    
    //image4
    CABasicAnimation *anim4_1 = [CZIntroTool basicAnimation];
    anim4_1.keyPath = @"transform";
    anim4_1.beginTime = 0.0;
    anim4_1.duration = 0.5;
    CATransform3D transform = CATransform3DMakeRotation(-45 * M_PI/180, 0, 0, 1);
    transform = CATransform3DRotate(transform, -60 * M_PI/180, 1, 1, 0);
    anim4_1.fromValue = [NSValue valueWithCATransform3D:transform];
    [self.image4.layer addAnimation:anim4_1 forKey:nil];
    
    CABasicAnimation *anim4_2 = [CZIntroTool basicAnimation];
    anim4_2.keyPath = @"position";
    anim4_2.beginTime = 0.0;
    anim4_2.duration = 0.5;
    CGFloat image4X = 232.0 * UIScreenW/375.0;
    CGFloat image4Y = 203.0 * UIScreenH/667.0;
    anim4_2.fromValue = [NSValue valueWithCGPoint:CGPointMake(image4X, image4Y)];
    [self.image4.layer addAnimation:anim4_2 forKey:nil];
    
    CABasicAnimation *anim4_3 = [CZIntroTool basicAnimation];
    anim4_3.keyPath = @"opacity";
    anim4_3.beginTime = 1.0;
    anim4_3.duration = 0.5;
    anim4_3.toValue = @0.0;
    [self.image4.layer addAnimation:anim4_3 forKey:nil];
    
    //image2
    CAKeyframeAnimation *anim2 = [CZIntroTool keyframeAnimation];
    anim2.keyPath = @"position";
    anim2.beginTime = 0.5;
    anim2.duration = 1.0;
    CGFloat image2H = self.image2.bounds.size.height;
    anim2.values = @[[NSValue valueWithCGPoint:CGPointMake(self.image2.center.x, -image2H/2)],
                       [NSValue valueWithCGPoint:CGPointMake(self.image2.center.x, self.image2.center.y)],
                       [NSValue valueWithCGPoint:CGPointMake(self.image2.center.x, UIScreenH+image2H/2)]
                       ];
    [self.image2.layer addAnimation:anim2 forKey:nil];
    
    //image1
    CAKeyframeAnimation *anim1 = [CZIntroTool keyframeAnimation];
    anim1.keyPath = @"position";
    CGFloat image1W = self.image1.bounds.size.width;
    anim1.beginTime = 0.5;
    anim1.duration = 1.0;
    anim1.values = @[[NSValue valueWithCGPoint:CGPointMake(UIScreenW+image1W/2, self.image1.center.y-80)],
                     [NSValue valueWithCGPoint:CGPointMake(UIScreenW/2-84, self.image1.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(-image1W/2, self.image1.center.y+40)]
                     ];
    [self.image1.layer addAnimation:anim1 forKey:nil];
    
    //image3
    CAKeyframeAnimation *anim3 = [CZIntroTool keyframeAnimation];
    anim3.keyPath = @"position";
    CGFloat image3W = self.image3.bounds.size.width;
    anim3.beginTime = 0.5;
    anim3.duration = 1.0;
    anim3.values = @[[NSValue valueWithCGPoint:CGPointMake(-image3W/2, self.image3.center.y-80)],
                       [NSValue valueWithCGPoint:CGPointMake(UIScreenW/2, self.image3.center.y)],
                       [NSValue valueWithCGPoint:CGPointMake(UIScreenW+image3W/2, self.image3.center.y+80)]
                       ];
    [self.image3.layer addAnimation:anim3 forKey:nil];
}

@end
