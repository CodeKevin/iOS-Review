//
//  UIView+Frame.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/9.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "UIView+Frame.h"
char nameKey;
@implementation UIView (Frame)
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString*)name {
    return objc_getAssociatedObject(self, &nameKey);
}
@end
