//
//  Manager.h
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/3.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Block)(NSString *data);
@interface Manager : NSObject

@property(nonatomic,copy)Block block;//编译器默认copy

+ (instancetype)share;
- (void)done;
@end
