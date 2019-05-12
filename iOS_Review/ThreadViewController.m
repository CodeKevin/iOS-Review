//
//  ThreadViewController.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "ThreadViewController.h"
#import "UIFactory.h"
@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIFactory createWithFrame:CGRectMake(20, 100, 100, 50) title:@"NSOperation" backgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIFactory createWithFrame:CGRectMake(220, 100, 100, 50) title:@"GCD_barrier" backgroundColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(barrierClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIFactory createWithFrame:CGRectMake(20, 200, 100, 50) title:@"GCD_group" backgroundColor:[UIColor yellowColor]];
    [btn2 addTarget:self action:@selector(groupClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    // Do any additional setup after loading the view.
}

- (void)click {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;//串行
    __block int n = 0, x = 0, y = 0, z = 0;
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"0 %@",[NSThread currentThread]);
        x = 1;
    }];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1 %@",[NSThread currentThread]);
        y = 2;
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2 %@",[NSThread currentThread]);
        z = 3;
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3 %@",[NSThread currentThread]);
    }];
    [op3 addDependency:op1];
    [queue addOperation:op];
    [queue addOperation:op1];
    [queue addOperation:op3];
    [queue addOperation:op2];
    [queue waitUntilAllOperationsAreFinished];
    NSLog(@"Finish");
    n = x + y + z;
    NSLog(@"%d",n);
}
- (void)barrierClick {
    dispatch_queue_t sQueue = dispatch_queue_create("kv_squeue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(sQueue, ^{
        NSLog(@"s1-%@",[NSThread currentThread]);
    });
    dispatch_async(sQueue, ^{
        NSLog(@"s2-%@",[NSThread currentThread]);
    });
    dispatch_async(sQueue, ^{
        NSLog(@"s3-%@",[NSThread currentThread]);
    });
    dispatch_barrier_async(sQueue, ^{
        NSLog(@"sQueue Finish!");
    });
    
    
    
    
    dispatch_queue_t queue = dispatch_queue_create("kv_queue", DISPATCH_QUEUE_CONCURRENT);
    
    //获取主队列
    //dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        NSLog(@"async0 %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"async1 %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"async2 %@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier");
    });
    dispatch_async(queue, ^{
        NSLog(@"async3 %@",[NSThread currentThread]);
    });
}
- (void)groupClick {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"0");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"1");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2");
    });
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"finish");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"3");
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"4");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"5");
        dispatch_group_leave(group);
    });
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
