//
//  ViewModel.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "ViewModel.h"
#import "MVVMPaper.h"
#import "FBKVOController.h"

@implementation ViewModel
{
    MVVMPaper *_model;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
// viewModel --> model 绑定
- (void)setWithModel:(MVVMPaper *)paper;
{
    _model = paper;
    self.contentStr = _model.content;
}

- (void)onPrintClick;
{
    _model.content = [NSString stringWithFormat:@"line %d", arc4random()%10 + 1];
    self.contentStr = _model.content;
}
@end
