//
//  HttpManager.m
//  iOS_Review
//
//  Created by Kevin on 2019/5/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "HttpManager.h"
#import <AFHTTPSessionManager.h>
@interface HttpManager()
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end
@implementation HttpManager
+ (instancetype)shared {
    static HttpManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init {
    if (self = [super init]) {
        self.manager = [[AFHTTPSessionManager alloc] init];
    }
    return self;
}
- (void)GET:(NSString *)url success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self.manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
