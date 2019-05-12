//
//  A.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/3.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "A.h"

@implementation A
- (instancetype)init {
    if (self = [super init]) {
        _word = @"hello world";
    }
    return self;
}
//暴露实例方法
- (void)say {
    if ([self.delegate respondsToSelector:@selector(say:)]) {
        [self.delegate say:self.word];
    }
}
@end
