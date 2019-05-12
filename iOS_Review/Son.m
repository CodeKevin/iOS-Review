//
//  Son.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/2.
//  Copyright © 2019年 Kevin. All rights reserved.
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
