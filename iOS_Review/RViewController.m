//
//  RViewController.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/9.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "RViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "Person.h"
#import "UIView+Frame.h"
@interface RViewController ()

@end

@implementation RViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
    // Do any additional setup after loading the view.
}
- (void)test1 {
    //实例方法替换
    Person *p = [[Person alloc] init];
    [p run];
    [p study];
    
    Method run = class_getInstanceMethod([Person class], @selector(run));
    Method study = class_getInstanceMethod([Person class], @selector(study));
    method_exchangeImplementations(run, study);
    [p run];
    [p study];
}
- (void)test2 {
    //分类添加属性
    UIView *v = [[UIView alloc] init];
    v.name = @"hello";
    NSLog(@"%@",v.name);
}
- (void)test3 {
    //获得一个类的所有成员变量和方法
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    
    
    unsigned int mCount = 0;
    Method *methods = class_copyMethodList([Person class], &mCount);
    for (int i = 0; i < mCount; i++) {
        Method m = methods[i];
        const NSString *name = NSStringFromSelector(method_getName(m));
        NSLog(@"---%@",name);
        
    }
    // 注意释放内存！
    free(ivars);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
