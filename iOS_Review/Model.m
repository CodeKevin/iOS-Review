//
//  Model.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/5/11.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "Model.h"

@implementation Model
+ (NSArray*)paresRespondsData:(id)respondsData {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic  in respondsData) {
        Model *model = [MTLJSONAdapter modelOfClass:[Model class] fromJSONDictionary:dic error:nil];
        [array addObject:model];
    }
    return array;
}
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"ID":@"id",
             @"title":@"title",
             @"descrip":@"description",
             @"cover_url":@"cover_url"};
}
@end
