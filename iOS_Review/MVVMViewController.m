//
//  MVVMViewController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/12.
//  Copyright © 2019年 王文凯. All rights reserved.
//

#import "MVVMViewController.h"
#import "MusicCell.h"
#import "HttpManager.h"
static NSString *identify = @"musicCellID";
@interface MVVMViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //[self.tableView registerClass:[MusicCell class] forCellReuseIdentifier:identify];
    [self.view addSubview:self.tableView];
    [self loadData];
    // Do any additional setup after loading the view.
}
- (void)loadData {
    [[HttpManager shared] GET:@"http://wawa.fm:9090/wawa/api.php/document/getDocumentByCategory" success:^(id response) {
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:[Model paresRespondsData:response]];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40 + 10 + (Screen_W - 30)*3/4.f + 10 + 40 + 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MusicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    Model *model = self.dataSource[indexPath.row];
    [cell updataWithModel:model];
    return cell;
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
