//
//  Manager.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "Manager.h"
#import "Employee.h"

@interface Manager ()<EmployeePrintDelegate>

@end

@implementation Manager

+ (instancetype)sharedInstance;
{
    static Manager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [Manager new];
    });
    return instance;
}

- (void)celebratePrintDone;
{
    NSLog(@"delegate: celebrate print done");
}

- (void)beginPrintJob;
{
    Employee *employee = [Employee sharedInstance];
    employee.delegate = self;
    [employee doPrintJob];
}

#pragma mark - delegate
- (void)printJobDone;
{
    [self celebratePrintDone];
}
@end
