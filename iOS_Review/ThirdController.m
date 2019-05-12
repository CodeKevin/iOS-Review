//
//  ThirdController.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/3.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "ThirdController.h"

@interface ThirdController ()

@end

@implementation ThirdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(0, 0, 200, 100);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(popPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];    // Do any additional setup after loading the view.
}
- (void)pop {
    //1.返回上一个页面
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)popPop {
    //2.返回上上一个页面
    NSMutableArray *arr = self.navigationController.viewControllers.mutableCopy;
    [arr removeObjectAtIndex:1];
    self.navigationController.viewControllers = arr;
    [self.navigationController popViewControllerAnimated:YES];
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
