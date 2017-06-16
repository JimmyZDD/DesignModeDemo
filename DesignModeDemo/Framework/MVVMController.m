//
//  MVVMController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVVMController.h"
#import "MVVMView.h"
#import "MVVMPaper.h"
#import "ViewModel.h"

@interface MVVMController ()

@property (strong, nonatomic) MVVMPaper *model;
@property (strong, nonatomic) MVVMView  *mvvmView;
@property (strong, nonatomic) ViewModel *viewModel;

@end

@implementation MVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [ViewModel new];

    _mvvmView = [MVVMView new];
    [self.view addSubview:_mvvmView];
    _mvvmView.frame = self.view.bounds;
    
    _model = [MVVMPaper new];
    _model.content = @"line 0";
    [_mvvmView setViewModel:_viewModel];
    [_viewModel setWithModel:_model];
}

@end
