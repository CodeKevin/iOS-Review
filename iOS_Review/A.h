//
//  A.h
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/3.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ADelegate<NSObject>
- (void)say:(NSString*)word;
@end
@interface A : NSObject
@property(nonatomic,copy)NSString *word;
//避免循环引用，此处要用weak
@property(nonatomic,weak)id <ADelegate> delegate;

- (void)say;
@end
