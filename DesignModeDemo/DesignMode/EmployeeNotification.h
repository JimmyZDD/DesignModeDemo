//
//  EmployeeNotification.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeNotification : NSObject

+ (instancetype)sharedInstance;

- (void)doPrintJob;

@end
