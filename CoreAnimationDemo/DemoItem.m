//
//  DemoItem.m
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import "DemoItem.h"

@implementation DemoItem

+ (id)itemWithName:(NSString *)name className:(NSString *)className
{
    return [[self alloc] initWithName:name className:className];
}

- (id)initWithName:(NSString *)name className:(NSString *)className
{
    self = [super init];
    if (self) {
        _name = name;
        _className = className;
    }
    
    return self;
}

@end
