//
//  Manager.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

+ (instancetype)sharedInstance;

- (void)beginPrintJob;

@end
