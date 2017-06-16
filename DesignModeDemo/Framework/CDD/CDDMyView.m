//
//  CDDMyView.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "CDDMyView.h"
#import "CDDMyPresenter.h"

@implementation CDDMyView
{
    UIButton *_btnPrint;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _btnPrint = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btnPrint.backgroundColor = [UIColor grayColor];
        _btnPrint.frame = CGRectMake(100, 100, 60, 40);
        [_btnPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnPrint];
    }
    return self;
}

- (void)onPrintClick;
{
    [(CDDMyPresenter *)self.context.presenterAddnew printPaper];
}
@end
