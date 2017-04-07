//
//  CZThirdView.m
//  LayerAnimation
//
//  Created by new on 17/2/21.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZThirdView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define UIScreenH [UIScreen mainScreen].bounds.size.height //屏幕高度
@interface CZThirdView ()

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleView;

@end


@implementation CZThirdView

+ (instancetype)thirdView {
    CZThirdView *thirdView = [[NSBundle mainBundle] loadNibNamed:@"CZThirdView" owner:nil options:nil].lastObject;
    return thirdView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //通知布局view，从而获得正确的布局信息。
    self.bounds = CGRectMake(0, 0, UIScreenW, UIScreenH);
    [self layoutIfNeeded];
    
    //titleView
    CABasicAnimation *anim_title = [CZIntroTool basicAnimation];
    anim_title.keyPath = @"opacity";
    anim_title.beginTime = 1.5;
    anim_title.duration = 0.5;
    anim_title.fromValue = @0.0;
    [self.titleView.layer addAnimation:anim_title forKey:nil];
    [self.subTitleView.layer addAnimation:anim_title forKey:nil];
    
    //image1
    //动画开始前隐藏。
    CABasicAnimation *anim1_1 = [CZIntroTool basicAnimation];
    anim1_1.keyPath = @"opacity";
    anim1_1.beginTime = 0.5;
    anim1_1.duration = 0.001;
    anim1_1.fromValue = @0.0;
    [self.image1.layer addAnimation:anim1_1 forKey:nil];
    
    CAKeyframeAnimation *anim1_2 = [CZIntroTool keyframeAnimation];
    anim1_2.keyPath = @"bounds.size";
    anim1_2.beginTime = 0.5;
    anim1_2.duration = 1.0;
    anim1_2.values = @[[NSValue valueWithCGSize:CGSizeMake(142, 150)],
                       [NSValue valueWithCGSize:CGSizeMake(170, 170)],
                       [NSValue valueWithCGSize:CGSizeMake(self.image1.bounds.size.width, self.image1.bounds.size.height)]];
    [self.image1.layer addAnimation:anim1_2 forKey:nil];
    
    CABasicAnimation *anim1_3 = [CZIntroTool basicAnimation];
    anim1_3.keyPath = @"position";
    anim1_3.beginTime = 1.0;
    anim1_3.duration = 0.5;
    anim1_3.fromValue = [NSValue valueWithCGPoint:CGPointMake(UIScreenW/2+54, 284)];
    [self.image1.layer addAnimation:anim1_3 forKey:nil];
    
    
    //image2
    //动画开始前隐藏。
    CABasicAnimation *anim2_1 = [CZIntroTool basicAnimation];
    anim2_1.keyPath = @"opacity";
    anim2_1.beginTime = 1.5;
    anim2_1.duration = 0.001;
    anim2_1.fromValue = @0.0;
    [self.image2.layer addAnimation:anim2_1 forKey:nil];
    
    CABasicAnimation *anim2_2 = [CZIntroTool basicAnimation];
    anim2_2.keyPath = @"position.y";
    anim2_2.beginTime = 1.5;
    anim2_2.duration = 0.5;
    CGFloat image2H = self.image2.bounds.size.height;
    anim2_2.fromValue = @(self.image2.center.y - image2H/2);
    [self.image2.layer addAnimation:anim2_2 forKey:nil];
    
    //image3
    CABasicAnimation *anim3 = [CZIntroTool basicAnimation];
    anim3.keyPath = @"bounds.size";
    anim3.beginTime = 1.5;
    anim3.duration = 0.5;
    anim3.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    [self.image3.layer addAnimation:anim3 forKey:nil];
}


@end
