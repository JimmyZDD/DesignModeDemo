//
//  MVCView.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Paper.h"

@protocol MVCViewDelegate <NSObject>

- (void)onPrintBtnClick;

@end

@interface MVCView : UIView

@property (weak, nonatomic) id<MVCViewDelegate> delegate;

- (void)printOnView:(Paper *)paper;

@end
