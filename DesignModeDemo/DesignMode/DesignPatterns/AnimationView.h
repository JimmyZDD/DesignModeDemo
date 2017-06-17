//
//  AnimationView.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/17.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "FadeAnimationView.h"

/**
 聚合原则 : 为 BaseAnimationView 扩充功能, 作为一个容器
 */
@interface AnimationView : UIView

@property (strong, nonatomic) FadeAnimationView *fadeAnimationView;

/**
 切换到错误状态
 
 @param animated 是否执行动画
 @param duration 持续时间
 */
- (void)changeToErrorStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end
