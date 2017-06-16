//
//  CDDController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "CDDController.h"
#import "CDD/CDDContext.h"
#import "CDDMyPresenter.h"
#import "CDDMyView.h"

@interface CDDController ()

@property (strong, nonatomic) CDDMyPresenter *presenter;
@property (strong, nonatomic) CDDMyView  *myView;

@end

@implementation CDDController

- (void)viewDidLoad {
    [super viewDidLoad];
    [CDDContext enableCDDContext];
    self.context = [CDDContext new];
    self.view.context = self.context;
    
    _myView = [CDDMyView new];
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    _presenter = [CDDMyPresenter new];
    _presenter.content = @"line 0";
    self.context.presenterAddnew = _presenter;
}

@end
