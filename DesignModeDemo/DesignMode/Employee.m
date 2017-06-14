//
//  Employee.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "Employee.h"

@implementation Employee

+ (instancetype)sharedInstance;
{
    static Employee *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [Employee new];
    });
    return instance;
}

- (void)doPrintJob;
{
    NSLog(@"delegate: do printing job");
    if (self.delegate && [self.delegate respondsToSelector:@selector(printJobDone)]) {
        [self.delegate printJobDone];
    }
}
@end
