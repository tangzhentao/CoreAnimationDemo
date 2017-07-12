//
//  DemoItem.h
//  CoreAnimationDemo
//
//  Created by guangying_tang on 2017/7/11.
//  Copyright © 2017年 guangying_tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoItem : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *className;

+ (id)itemWithName:(NSString *)name className:(NSString *)className;

@end
