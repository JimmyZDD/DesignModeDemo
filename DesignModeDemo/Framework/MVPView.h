//
//  MVPView.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MVPViewDelegate <NSObject>

- (void)onPrintBtnClick;

@end

@interface MVPView : UIView

@property (weak, nonatomic) id<MVPViewDelegate> delegate;

- (void)printOnView:(NSString *)content;

@end
