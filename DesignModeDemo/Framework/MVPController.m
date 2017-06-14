//
//  MVPController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVPController.h"
#import "Presenter.h"

@interface MVPController ()

@property (strong, nonatomic) MVPModel *mvpModel;
@property (strong, nonatomic) MVPView  *mvpView;
@property (strong, nonatomic) Presenter *presenter;

@end

@implementation MVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [Presenter new];
    
    self.mvpView = [MVPView new];
    _mvpView.frame = self.view.bounds;
    [self.view addSubview:_mvpView];
    
    self.mvpModel = [MVPModel new];
    _mvpModel.content = @"line 0";
    
    _presenter.view = _mvpView;
    _mvpView.delegate = _presenter;

    _presenter.model = _mvpModel;
    [_presenter printTask];
}

@end
