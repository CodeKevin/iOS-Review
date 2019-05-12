//
//  Manager.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/3.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "Manager.h"

@interface Manager()
@property(nonatomic,strong)NSString *data;
@end
@implementation Manager
//单例
+ (instancetype)share {
    static Manager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Manager alloc] init];
    });
    return manager;
}

- (void)done {
    self.data = @"block";
    if (self.block) {
        self.block(self.data);
    }
}
@end
