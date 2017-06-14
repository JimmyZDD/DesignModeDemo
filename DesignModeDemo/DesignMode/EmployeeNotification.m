//
//  EmployeeNotification.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "EmployeeNotification.h"
#import "PrintNotification.h"

@implementation EmployeeNotification

+ (instancetype)sharedInstance;
{
    static EmployeeNotification *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [EmployeeNotification new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPrintJob) name:Notif_BeginPrintTask object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)doPrintJob;
{
    NSLog(@"Notification: do printing job");
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_PrintTaskDone object:nil];

}
@end
