//
//  MusicViewModel.h
//  iOS_Review
//
//  Created by 王文凯 on 2019/5/12.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicViewModel : NSObject
@property(nonatomic,strong)RACCommand *command;
@property(nonatomic,strong)NSMutableArray *listData;
@end
