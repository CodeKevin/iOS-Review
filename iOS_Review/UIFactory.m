//
//  UIFactory.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/10.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "UIFactory.h"
#import "Define.h"
@implementation UIFactory
+ (UIButton*)createWithFrame:(CGRect)frame title:(NSString*)title backgroundColor:(UIColor*)color {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = color;
    return btn;
}
+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.backgroundColor = color;
    return label;
}
@end
