//
//  MVPView.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVPView.h"


@interface MVPView ()
@property (strong, nonatomic) UIButton *btnPrint;
@end

@implementation MVPView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.btnPrint = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btnPrint.frame = CGRectMake(100, 100, 60, 40);
        [_btnPrint addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnPrint];
    }
    return self;
}

- (void)printOnView:(NSString *)content;
{
    NSLog(@"MVP: %@", content);
    [_btnPrint setTitle:content forState:UIControlStateNormal];
}

- (void)btnClick;
{
    if (self.delegate) {
        [self.delegate onPrintBtnClick];
    }
}

@end
