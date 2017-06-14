//
//  Employee.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EmployeePrintDelegate <NSObject>

@optional
- (void)printJobDone;

@end

@interface Employee : NSObject

@property (weak, nonatomic) id<EmployeePrintDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)doPrintJob;

@end
