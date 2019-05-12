//
//  MusicViewModel.m
//  iOS_Review
//
//  Created by Kevin on 2019/5/12.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "MusicViewModel.h"
#import "Model.h"

@interface MusicViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)RACSignal *sendDataSignal;
@end

@implementation MusicViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initAllComponents];
    }
    return self;
}
- (void)initAllComponents {
    _listData = [[NSMutableArray alloc] init];
}
- (RACCommand *)sendDatacommand {
    if (!_sendDatacommand) {
        @weakify(self)
        _sendDatacommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            return self.sendDataSignal;
        }];
    }
    return _sendDatacommand;
}
- (RACSignal *)sendDataSignal {
    if (!_sendDataSignal) {
        @weakify(self)
        _sendDataSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            [[HttpManager shared] GET:@"http://wawa.fm:9090/wawa/api.php/document/getDocumentByCategory" success:^(id response) {
                [self.listData removeAllObjects];
                [self.listData addObjectsFromArray:[Model paresRespondsData:response]];
                [subscriber sendNext:self.listData];
                [subscriber sendCompleted];
            } failure:^(NSError *error) {
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }
    return _sendDataSignal;
}
@end
