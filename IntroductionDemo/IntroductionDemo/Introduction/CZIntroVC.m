//
//  CZIntroVC.m
//  SAGA_iOS
//
//  Created by new on 17/3/1.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "CZIntroVC.h"
#import "CZFirstView.h"
#import "CZSecondView.h"
#import "CZThirdView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define UIScreenH [UIScreen mainScreen].bounds.size.height //屏幕高度

@interface CZIntroVC () <CAAnimationDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;
@property (nonatomic,strong) CZFirstView *firstView;
@property (nonatomic,strong) CZSecondView *secondView;
@property (nonatomic,strong) CZThirdView *thirdView;

@end


@implementation CZIntroVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.contentSize = CGSizeMake(UIScreenW * 3, 0);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
    [self.view addSubview:self.thirdView];
    [self.view bringSubviewToFront:self.bottomBtn];
    self.view.layer.speed = 0.0f;
    
    CABasicAnimation *anim_page = [CZIntroTool basicAnimation];
    anim_page.keyPath = @"opacity";
    anim_page.beginTime = 1.0;
    anim_page.duration = 1.0;
    anim_page.toValue = @0.0;
    [self.pageControl.layer addAnimation:anim_page forKey:nil];
    
    CABasicAnimation *anim_btn = [CZIntroTool basicAnimation];
    anim_btn.keyPath = @"opacity";
    anim_btn.beginTime = 1.0;
    anim_btn.duration = 1.0;
    anim_btn.fromValue = @0.0;
    [self.bottomBtn.layer addAnimation:anim_btn forKey:nil];
    
    self.bottomBtn.layer.cornerRadius = 4;
    self.bottomBtn.layer.masksToBounds = YES;
}

- (CZFirstView *)firstView {
    if (!_firstView) {
        _firstView = [CZFirstView firstView];
        _firstView.frame = CGRectMake(0, 0, UIScreenW, UIScreenH);
    }
    return _firstView;
}

- (CZSecondView *)secondView {
    if (!_secondView) {
        _secondView = [CZSecondView secondView];
        _secondView.frame = CGRectMake(0, 0, UIScreenW, UIScreenH);
    }
    return _secondView;
}

- (CZThirdView *)thirdView {
    if (!_thirdView) {
        _thirdView = [CZThirdView thirdView];
        _thirdView.frame = CGRectMake(0, 0, UIScreenW, UIScreenH);
    }
    return _thirdView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CFTimeInterval timeOffset = offsetX / UIScreenW;
    self.view.layer.timeOffset = timeOffset;
    
    int page = (offsetX + UIScreenW/2) / UIScreenW;
    self.pageControl.currentPage = page;
    
    //最后一页时，按钮才可以点击。
    self.bottomBtn.enabled = page == self.pageControl.numberOfPages-1 ? YES:NO;
}

- (IBAction)bottomBtnAction:(id)sender {
}

@end
