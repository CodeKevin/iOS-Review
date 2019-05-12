//
//  Model.h
//  iOS_Review
//
//  Created by Kevin on 2019/5/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : MTLModel<MTLJSONSerializing>
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *category_id;
@property(nonatomic,copy)NSString *descrip;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *member_name;
@property(nonatomic,copy)NSString *category_name;
+ (NSArray*)paresRespondsData:(id)respondsData;
@end
