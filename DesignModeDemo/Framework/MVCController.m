//
//  MVCController.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVCController.h"
#import "MVCView.h"
#import "Paper.h"

@interface MVCController ()<MVCViewDelegate>

@property (strong, nonatomic) MVCView *myView;
@property (strong, nonatomic) Paper *paper;

@end

@implementation MVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printPaper];
    
    self.myView = [MVCView new];
    _myView.delegate = self;
    _myView.frame = self.view.bounds;
    [self.view addSubview:_myView];
    
    self.paper = [Paper new];
    _paper.content = @"line 0";
    
    [self printPaper];
}

- (void)printPaper;
{
    [_myView printOnView:_paper];
}
#pragma mark - delegate
- (void)onPrintBtnClick;
{
    _paper.content = [NSString stringWithFormat:@"line %d", arc4random()%10 + 1];
    [_myView printOnView:_paper];
}

@end
