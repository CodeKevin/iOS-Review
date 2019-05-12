//
//  UIFactory.h
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/10.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIFactory : NSObject
+ (UIButton *)createWithFrame:(CGRect)frame title:(NSString*)title backgroundColor:(UIColor*)color;
+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color;

@end
