//
//  CDDContext.m
//  DesignModeDemo
//
//  Created by JimmyZhao on 2017/6/15.
//  Copyright © 2017年 bihu. All rights reserved.
//

#import "CDDContext.h"
#import <objc/runtime.h>

@interface UIView (CDD)

+ (void)prepareUIViewForCDD;

@end

@implementation UIView (CDD)

+ (void)prepareUIViewForCDD
{
    [self swizzleInstanceSelector:@selector(didAddSubview:) withSelector:@selector(newDidAddSubview:)];
}

- (void)newDidAddSubview:(UIView*)view
{
    [self newDidAddSubview:view];
    
    [self buildViewContextFromSuper:view];
}

- (void)buildViewContextFromSuper:(UIView*)view{
    
    CFTimeInterval start = CACurrentMediaTime();
    if (view.context == nil) {
        UIView* sprView = view.superview;
        while (sprView != nil) {
            if (sprView.context != nil) {
                view.context = sprView.context;
                [self buildViewContextForChildren:view withContext:view.context];
                break;
            }
            sprView = sprView.superview;
        }
    }
    
    NSLog(@"buildViewContextFromSuper costs: %f ms", (CACurrentMediaTime()-start)*1000);
}


- (void)buildViewContextForChildren:(UIView*)view withContext:(CDDContext*)context
{
    for (UIView* subview in view.subviews) {
        subview.context = context;
        [self buildViewContextForChildren:subview withContext:context];
    }
}

@end


@implementation CDDPresenter
@end

@implementation CDDInteractor
@end

@implementation CDDView

@end

@implementation CDDContext

+ (void)enableCDDContext
{
    [UIView prepareUIViewForCDD];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self displayCurrentModleProperty];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"context being released");
}

- (void)setPresenterAddnew:(CDDPresenter *)presenter;
{
    _presenterAddnew = presenter;
    _presenterAddnew.context = self;
}

- (void)setView:(CDDView *)view;
{
    _view = view;
    _view.context = self;
}
///通过运行时获取当前对象的所有属性的名称，以数组的形式返回
- (NSArray *) allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    ///释放
    free(propertys);
    
    return allNames;
}

- (void)displayCurrentModleProperty {
    
    //获取实体类的属性名
    NSArray *array = [self allPropertyNames];
    
    //拼接参数
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < array.count; i ++) {
        //获取get方法
        NSString *propertyName = array[i];
        if (propertyName.length < 1) {
            return;
        }

//        propertyName = [self getFirstLetterFromString:propertyName];
        NSLog(@"CDD: %@",propertyName);
        SEL setSel = NSSelectorFromString(propertyName);
        
        if ([self respondsToSelector:setSel]) {
            
            //获得类和方法的签名
            NSMethodSignature *signature = [self methodSignatureForSelector:setSel];
            
            //从签名获得调用对象
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            //设置target
            [invocation setTarget:self];
            
            //设置selector
            [invocation setSelector:setSel];
            
            //接收返回的值
            NSObject *__unsafe_unretained returnValue = nil;
            
            //调用
            [invocation invoke];
            
            //接收返回值
            [invocation getReturnValue:&returnValue];
            
            [resultString appendFormat:@"%@\n", returnValue];
        }
    }
    NSLog(@"%@", resultString);
    
}

- (NSString *)getFirstLetterFromString:(NSString *)propertyName;
{
    NSString *first = [[propertyName substringWithRange:NSMakeRange(0, 1)] uppercaseString];
    NSMutableString *propertyNameUpp = [NSMutableString stringWithString:propertyName];
    [propertyNameUpp replaceCharactersInRange:NSMakeRange(0, 1) withString:first];
    return [NSString stringWithFormat:@"set%@:", propertyNameUpp];
}

@end
