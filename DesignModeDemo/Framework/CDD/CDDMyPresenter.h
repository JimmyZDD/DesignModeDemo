//
//  CDDModel.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "CDDContext.h"

@interface CDDMyPresenter : CDDPresenter

@property (copy, nonatomic) NSString *content;

- (void)printPaper;

@end
