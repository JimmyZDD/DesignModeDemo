//
//  ManagerNotification.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerNotification : NSObject

+ (instancetype)sharedInstance;

- (void)beginPrintJob;

@end
