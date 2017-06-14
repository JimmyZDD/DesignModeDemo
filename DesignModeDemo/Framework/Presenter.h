//
//  Presenter.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/14.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "MVPView.h"
#import "MVPModel.h"

/**
 mvp的全称为Model-View-Presenter，Model提供数据，View负责
 显示，Controller/Presenter负责逻辑的处理。MVP与MVC有着一个
 重大的区别：在MVP中View并不直接使用Model，它们之间的通信是通过
 Presenter (MVC中的Controller)来进行的，所有的交互都发生在
 Presenter内部，而在MVC中View会直接从Model中读取数据而不是通
 过 Controller。
 */
@interface Presenter : NSObject<MVPViewDelegate>

@property (strong, nonatomic) MVPView  *view;
@property (strong, nonatomic) MVPModel *model;
- (void)printTask;

@end
