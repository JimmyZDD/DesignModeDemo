//
//  CDDContext.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+CDD.h"

@class CDDContext;
@class CDDView;

@interface CDDPresenter : NSObject

@end

@interface CDDInteractor : NSObject

@end


@interface CDDView : UIView

@end


@interface CDDContext : NSObject

@property (nonatomic, strong) CDDPresenter *presenterAddnew;
@property (nonatomic, strong) CDDInteractor *interactor;
@property (nonatomic, strong) CDDView *view;

+ (void)enableCDDContext;

@end
