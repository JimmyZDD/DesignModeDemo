//
//  MVCView.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVCView.h"

@interface MVCView ()
@property (strong, nonatomic) UIButton *btnPrint;
@end

@implementation MVCView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    
        self.btnPrint = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btnPrint.frame = CGRectMake(100, 100, 100, 100);
        [_btnPrint setTitle:@"print" forState:UIControlStateNormal];
        [_btnPrint addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnPrint];
    }
    return self;
}

- (void)printOnView:(Paper *)paper;
{
    NSLog(@"MVC: %@", paper.content);
    [_btnPrint setTitle:paper.content forState:UIControlStateNormal];
}

- (void)btnClick;
{
    if (self.delegate) {
        [self.delegate onPrintBtnClick];
    }
}

@end
