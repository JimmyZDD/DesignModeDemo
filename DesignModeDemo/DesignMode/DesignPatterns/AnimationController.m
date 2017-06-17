//
//  AnimationController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/17.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "AnimationController.h"
#import "FadeAnimationView.h"
#import "ScaleAnimationView.h"

@interface AnimationController ()

@end

@implementation AnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    #warning Design 1.里氏代换原则
    // [FadeAnimationView new];  [ScaleAnimationView new];  里氏代换原则,抽象父类调用子类接口(面向对象的多态). 只需要改变animationView具体实现, 就可以实现另外一种效果
    BaseAnimationView *animationView = [BaseAnimationView new];
    [animationView changeToDisableStateAnimated:YES duration:0.5f];
    #warning Design 2.依赖倒转原则
    /**
     抽像不依赖细节, 细节依赖抽象
     */
    #warning Design 3.接口隔离原则
    /**
     确保接口做必要的事情
     */
    #warning Design 4.聚合原则
    /**
     使用容器慎用继承, 为fadeAnimationView添加新的功能例如:AnimationView.h
     */
}

@end
