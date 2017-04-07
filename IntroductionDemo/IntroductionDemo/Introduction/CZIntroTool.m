//
//  CZIntroduceView.m
//  LayerAnimation
//
//  Created by new on 17/2/21.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZIntroTool.h"

@implementation CZIntroTool

+ (CABasicAnimation *)basicAnimation {
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeBoth;
    return anim;
}

+ (CAKeyframeAnimation *)keyframeAnimation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeBoth;
    return anim;
}

@end
