//
//  BaseAnimationView.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/17.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 开闭原则: 模块对扩展开放, 对修改关闭
 */
@interface BaseAnimationView : UIView

@property (copy, nonatomic) NSAttributedString *attributedString;

@property (copy, nonatomic) NSString *title;
// 接口隔离原则: 确保接口做必要的事情

/**
 切换到正常状态
 
 @param animated 是否执行动画
 @param duration 持续时间
 */
- (void)changeToNormalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;
/**
 切换到不可用状态
 
 @param animated 是否执行动画
 @param duration 持续时间
 */
- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;
/**
 切换到高亮状态
 
 @param animated 是否执行动画
 @param duration 持续时间
 */
- (void)changeToHighlightAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end
