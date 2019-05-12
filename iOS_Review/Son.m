//
//  Son.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/2.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "Son.h"

@implementation Son
- (id)init {
    if (self = [super init]) {
        NSLog(@"%@", NSStringFromClass([self class]));
        //输出"Son"
        NSLog(@"%@", NSStringFromClass([super class]));
        //输出"Son"
    }
    return self;
}
@end
