//
//  BlockCaptureController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/25.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "BlockCaptureController.h"

@interface BlockCaptureController ()
@property(nonatomic,assign) NSInteger value;
@end
static NSString *name = @"Nick";
@implementation BlockCaptureController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSInteger index = 20;
    self.value = 18;
    __block NSString *tip = @"hello";
    void(^myBlock)() = ^() {
        NSLog(@"%lu",index);
        NSLog(@"%lu",self.value);
        tip = @"hi";
        name = @"Nike";
        NSLog(@"%@",tip);
        [array addObject:@"1"];
    };
    index = 21;
    self.value = 19;
    NSLog(@"array count: %lu",array.count);
    myBlock();
    
    NSLog(@"array count: %lu --- name = %@",array.count,name);
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
