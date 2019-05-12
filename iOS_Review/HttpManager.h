//
//  HttpManager.h
//  iOS_Review
//
//  Created by Kevin on 2019/5/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlock)(id response);
typedef void(^FailureBlock)(NSError *error);
@interface HttpManager : NSObject
+ (instancetype)shared;
- (void)GET:(NSString *)url success:(SuccessBlock)success failure:(FailureBlock)failure;
@end
