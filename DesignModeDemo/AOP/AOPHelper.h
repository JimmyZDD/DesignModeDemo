//
//  AOPHelper.h
//  AOP
//
//  Created by cafe on 2017/1/3.
//  Copyright © 2017年 cafe. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 在软件业，AOP为Aspect Oriented Programming的缩写，意为：面向切面编程，
 通过预编译方式和运行期动态代理实现程序功能的统一维护的一种技术。AOP是OOP的
 延续，是软件开发中的一个热点，也是Spring框架中的一个重要内容，是函数式编程
 的一种衍生范型。利用AOP可以对业务逻辑的各个部分进行隔离，从而使得业务逻辑各
 部分之间的耦合度降低，提高程序的可重用性，同时提高了开发的效率。
 */
@interface AOPHelper : NSObject
+ (void)setup;
@end
