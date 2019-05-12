//
//  MusicViewModel.h
//  iOS_Review
//
//  Created by Kevin on 2019/5/12.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicViewModel : NSObject
@property(nonatomic,strong)RACCommand *sendDatacommand;
@property(nonatomic,strong)NSMutableArray *listData;
@end
