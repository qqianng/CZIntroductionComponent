//
//  CZFirstView.m
//  IntroductionTest
//
//  Created by new on 17/2/13.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#define UIScreenW [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define UIScreenH [UIScreen mainScreen].bounds.size.height //屏幕高度
#import "CZFirstView.h"

@interface CZFirstView ()

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleView;

@end

@implementation CZFirstView

+ (instancetype)firstView {
    CZFirstView *firstView = [[NSBundle mainBundle] loadNibNamed:@"CZFirstView" owner:nil options:nil].lastObject;
    return firstView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //通知布局view，从而获得正确的布局信息。
    self.bounds = CGRectMake(0, 0, UIScreenW, UIScreenH);
    [self layoutIfNeeded];
    
    //titleView
    CABasicAnimation *anim1 = [CZIntroTool basicAnimation];
    anim1.keyPath = @"opacity";
    anim1.beginTime = 0.0;
    anim1.duration = 0.5;
    anim1.toValue = @0.0;
    [self.titleView.layer addAnimation:anim1 forKey:nil];
    [self.subTitleView.layer addAnimation:anim1 forKey:nil];
    
    //imageView
    CABasicAnimation *anim2 = [CZIntroTool basicAnimation];
    anim2.keyPath = @"position";
    CGFloat distance = UIScreenH;
    anim2.beginTime = 0.0;
    anim2.duration = 1.0;
    anim2.toValue = nil;
    
    //左上
    anim2.byValue = [NSValue valueWithCGPoint:CGPointMake(-distance, -distance)];
    [self.image2.layer addAnimation:anim2 forKey:nil];
    
    //右下
    anim2.byValue = [NSValue valueWithCGPoint:CGPointMake(distance, distance)];
    [self.image4.layer addAnimation:anim2 forKey:nil];
    
    //左下
    anim2.byValue = [NSValue valueWithCGPoint:CGPointMake(-distance, distance)];
    [self.image3.layer addAnimation:anim2 forKey:nil];
    
    //右上
    anim2.byValue = [NSValue valueWithCGPoint:CGPointMake(distance, -distance)];
    [self.image1.layer addAnimation:anim2 forKey:nil];
}



@end
