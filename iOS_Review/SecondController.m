//
//  SecondController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/3.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "SecondController.h"
#import "ThirdController.h"
@interface SecondController ()

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str1 = @"小花";
    NSString *str2 = [str1 copy];
    NSLog(@"str1 %@ %p",str1,str1);
    NSLog(@"str2 %@ %p",str2,str2);
    str1 = @"花菜";
    NSLog(@"str1 %@ %p",str1,str1);
    NSLog(@"str2 %@ %p",str2,str2);
    str2 = str1.copy;
    NSLog(@"str2 %@ %p",str2,str2);
    
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(0, 0, 200, 100);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(goThirdVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
- (void)goThirdVC:(UIButton*)btn {
    ThirdController *vc = [[ThirdController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
