//
//  AOPHelper.m
//  AOP
//
//  Created by cafe on 2017/1/3.
//  Copyright © 2017年 cafe. All rights reserved.
//

#import "AOPHelper.h"
#import "ViewController.h"
#import "Logger.h"
#import <objc/runtime.h>

@implementation AOPHelper
IMP originalViewDidLoadIMP;
void replacedViewDidLoad() {
    originalViewDidLoadIMP();
    [Logger log:@"AOP: View Did Load"];
}


+ (void)setup {
    originalViewDidLoadIMP = class_getMethodImplementation([ViewController class], @selector(viewDidLoad));
    Method originalViewDidLoad = class_getInstanceMethod([ViewController class], @selector(viewDidLoad));
    method_setImplementation(originalViewDidLoad, (IMP) replacedViewDidLoad);
}

@end
