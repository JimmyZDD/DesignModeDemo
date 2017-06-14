//
//  AppDelegate.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/13.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "AppDelegate.h"
#import "AOPHelper.h"

#import "Manager.h"
#import "Employee.h"

#import "ManagerNotification.h"
#import "EmployeeNotification.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [AOPHelper setup];
    
    [self testDelegate];
    [self testNotification];
    return YES;
}

- (void)testNotification;
{
    [EmployeeNotification sharedInstance];
    ManagerNotification *manager = [ManagerNotification sharedInstance];
    [manager beginPrintJob];
}

- (void)testDelegate;
{
    Manager *manager = [Manager sharedInstance];
    [manager beginPrintJob];
}

@end
