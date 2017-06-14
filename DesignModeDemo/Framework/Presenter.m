//
//  Presenter.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "Presenter.h"

@implementation Presenter

- (void)printTask;
{
    [self.view printOnView:self.model.content];
}

- (void)onPrintBtnClick;
{
    self.model.content = [NSString stringWithFormat:@"line %d", arc4random()%10 + 1];
    [self.view printOnView:self.model.content];
}

@end
