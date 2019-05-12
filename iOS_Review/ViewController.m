//
//  ViewController.m
//  iOS_Review
//
//  Created by 王文凯 on 2019/4/2.
//  Copyright © 2019年 王文凯. All rights reserved.
//
#import "ViewController.h"
#import "Son.h"
#import "A.h"
#import "Manager.h"

#import "CollectionCell.h"
#import "Define.h"


#import "SecondController.h"
#import "RViewController.h"
#import "ThreadViewController.h"
#import "JSViewController.h"
#import "AnimationViewController.h"
#import "KVCKVOViewController.h"
#import "NetViewController.h"
#import "RunloopViewController.h"
#import "BlockCaptureController.h"
#import "MVVMViewController.h"
@interface ViewController ()<ADelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,copy)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)initData {
    self.data = [NSMutableArray arrayWithObjects:@"self/super",@"delegate",@"delegate",@"block/copy",@"push/pop",@"mutableArray copy",@"runtime",@"Thread",@"JS",@"Animation",@"KVO/KVC",@"Net",@"runloop",@"block捕获",@"MVVM",nil];
}

#pragma mark ---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCellID" forIndexPath:indexPath];
    cell.backgroundColor = RandColor;
    cell.title.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((Screen_W-2)/3.0, (Screen_W-2)/3.0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1.f;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.item) {
        case 0: {
            //assign & [super class] [self class]
            Son *son = [[Son alloc] init];
            son.index = 10;
            break;
        }
        case 1: {
            //weak & delegate
            A *a = [[A alloc] init];
            a.delegate = self;
            [a say];
            break;
        }
        case 2: {
            //weak & delegate
            A *a = [[A alloc] init];
            a.delegate = self;
            [a say];
            break;
        }
        case 3: {
            //copy & block
            [Manager share].block = ^(NSString *data) {
                NSLog(@"%@",data);
            };
            [[Manager share] done];
            
            
            break;
        }
        case 4: {
            //copy & stack push pop
            SecondController *second = [[SecondController alloc] init];
            [self.navigationController pushViewController:second animated:YES];
            break;
        }
        case 5: {
            //copy
            NSString *word = @"hello";
            NSLog(@"%p",word);
            word = @"ni hao";
            NSLog(@"%p",word);
            NSMutableString *wordx = [NSMutableString stringWithString:@"hello"];
            NSLog(@"%p",wordx);
            word = wordx;
            NSLog(@"%p",word);
            //
            NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"1",@"2", nil];
            self.array = arr;
            [self.array removeAllObjects];
            break;
        }
        case 6: {
            RViewController *rvc = [[RViewController alloc] init];
            [self.navigationController pushViewController:rvc animated:YES];
            break;
        }
        case 7: {
            ThreadViewController *rvc = [[ThreadViewController alloc] init];
            [self.navigationController pushViewController:rvc animated:YES];
            break;
        }
        case 8: {
            JSViewController *js = [[JSViewController alloc] init];
            [self.navigationController pushViewController:js animated:YES];
            break;
        }
        case 9: {
            AnimationViewController *animation = [[AnimationViewController alloc] init];
            [self.navigationController pushViewController:animation animated:YES];
            break;
        }
        case 10: {
            [self push:NSStringFromClass([KVCKVOViewController class]) nav:self.navigationController];
            break;
        }
        case 11: {
            [self push:NSStringFromClass([NetViewController class]) nav:self.navigationController];
            break;
        }
        case 12: {
            [self push:NSStringFromClass([RunloopViewController class]) nav:self.navigationController];
            break;
        }
        case 13: {
            [self push:NSStringFromClass([BlockCaptureController class]) nav:self.navigationController];
            break;
        }
        case 14: {
            [self push:NSStringFromClass([MVVMViewController class]) nav:self.navigationController];
            break;
        }
        default:
            break;
    }
    
}
- (void)push:(NSString*)vcName nav:(UINavigationController*)nav{
    Class c = NSClassFromString(vcName);
    BaseViewController *vc = (BaseViewController*)[[c alloc] init];
    [nav pushViewController:vc animated:YES];
}
- (void)say:(NSString *)word {
    NSLog(@"%@",word);
}
@end
