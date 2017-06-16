//
//  NSObject+CDD.h
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDDContext;

@interface NSObject (CDD)

@property (nonatomic, strong) CDDContext* context;

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel;

@end
