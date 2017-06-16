//
//  ViewController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/13.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "ViewController.h"
#import "MVCController.h"
#import "MVPController.h"
#import "MVVMController.h"
#import "CDDController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showCDD];
    });
}

- (void)showMVC;
{
    [self presentViewController:[MVCController new] animated:YES completion:nil];
}

- (void)showMVP;
{
    [self presentViewController:[MVPController new] animated:YES completion:nil];
}

- (void)showMVVM;
{
    [self presentViewController:[MVVMController new] animated:YES completion:nil];
}

- (void)showCDD;
{
    [self presentViewController:[CDDController new] animated:YES completion:nil];
}
@end
