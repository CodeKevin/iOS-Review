//
//  ImageViewController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/10.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "ImageViewController.h"
//#import "UIImageView+WebCache.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [img sd_setImageWithURL:[NSURL URLWithString:@""]];
//
//    [[SDImageCache sharedImageCache] clearMemory];
//    [[SDImageCache sharedImageCache] cleanDisk];
//    [[SDImageCache sharedImageCache] clearDisk];
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
