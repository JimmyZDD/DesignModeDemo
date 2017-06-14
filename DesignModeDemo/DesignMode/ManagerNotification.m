//
//  ManagerNotification.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "ManagerNotification.h"
#import "PrintNotification.h"

@implementation ManagerNotification

+ (instancetype)sharedInstance;
{
    static ManagerNotification *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [ManagerNotification new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(celebratePrintDone) name:Notif_PrintTaskDone object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)celebratePrintDone;
{
    NSLog(@"Notification: celebrate print done");
}

- (void)beginPrintJob;
{
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_BeginPrintTask object:nil];
}

@end
