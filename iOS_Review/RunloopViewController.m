//
//  RunloopViewController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/23.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)timerAction {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    });
}
- (void)viewDidDisappear:(BOOL)animated {
    [_timer invalidate];
    _timer = nil;
    
}
- (void)dealloc {
    NSLog(@"%s-%@",__func__,NSStringFromClass([self class]));
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
