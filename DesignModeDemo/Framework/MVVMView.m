//
//  MVVMView.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVVMView.h"
#import "KVOController.h"
#import "ViewModel.h"

@implementation MVVMView
{
    UIButton *_btnPrint;
    ViewModel *_vm;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _btnPrint = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btnPrint.frame = CGRectMake(100, 100, 60, 40);
        [_btnPrint addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnPrint];
    }
    return self;
}
- (void)setViewModel:(ViewModel *)vm;
{
    _vm = vm;
    // viewModel --> view 绑定
    [self.KVOController observe:vm keyPath:@"contentStr" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        [_btnPrint setTitle:change[NSKeyValueChangeNewKey] forState:UIControlStateNormal];
    }];
}
- (void)btnClick;
{
    [_vm onPrintClick];
}
@end
