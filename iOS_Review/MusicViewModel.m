//
//  MusicViewModel.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/5/12.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "MusicViewModel.h"
#import "Model.h"
@implementation MusicViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self setUpCommand];
    }
    return self;
}
- (void)setUpCommand {
    @weakify(self)
    _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
           @strongify(self)
           [[HttpManager shared] GET:@"" success:^(id response) {
               [self.listData removeAllObjects];
               [self.listData addObjectsFromArray:[Model paresRespondsData:response]];
               [subscriber sendNext:self.listData];
               [subscriber sendCompleted];
           } failure:^(NSError *error) {
               
           }];
           return nil;
       }];
        
    }];
}
- (NSMutableArray *)listData {
    if (!_listData) {
        _listData = [[NSMutableArray alloc] init];
    }
    return _listData;
}
@end
