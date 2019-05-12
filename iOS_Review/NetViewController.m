//
//  NetViewController.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "NetViewController.h"
@interface NetViewController ()<NSURLSessionDelegate>

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self urlSessionTest];
    // Do any additional setup after loading the view.
}
- (void)AFNetWorkingTest {
    
}


- (void)urlSessionTest {
    //配置
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //实例
    NSURLSession *cSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:0];
    NSURLSessionDownloadTask *task = [cSession downloadTaskWithURL:[NSURL URLWithString:@""]];
    //[task resume];
    
    //block Session
    NSURLSession *dSession = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    NSURLSessionDataTask *blockTask = [dSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",data);
    }];
    [blockTask resume];
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
