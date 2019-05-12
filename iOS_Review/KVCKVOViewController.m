//
//  KVCKVOViewController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/17.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "KVCKVOViewController.h"

@interface KVCKVOViewController () {
    NSString *_name;
}
@end

@implementation KVCKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_name);
    // Do any additional setup after loading the view.
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
