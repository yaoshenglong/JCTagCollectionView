//
//  ViewController.m
//  JCTagCollectionView
//
//  Created by Jam on 16/4/20.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "ViewController.h"
#import "JCTagCollectionView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JCTagCollectionView *tagCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tagCollectionView.tags = @[@"标签1", @"标签2", @"苏州", @"乌鲁木齐市", @"美国加利福利亚州", @"UITableViewController", @"UIStepper", @"UISegmentedControl", @"UICollectionViewController", @"UISearchBar", @"UIToolbar", @"UIPageControl", @"UIActionSheet"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
