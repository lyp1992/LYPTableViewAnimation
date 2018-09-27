//
//  LYPBaseTableViewController.m
//  YPTableViewAnimal
//
//  Created by laiyp on 2018/9/27.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import "LYPBaseTableViewController.h"
#import "LYPTableViewAnimaltionHeader.h"
@interface LYPBaseTableViewController ()
@property (nonatomic, assign) int cellNumber;
@end

@implementation LYPBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0.5];
    
    UIButton *showAgainBtn = [[UIButton alloc]init];
    [showAgainBtn setTitle:@"showAgain" forState:UIControlStateNormal];
    showAgainBtn.frame = CGRectMake(0, 0, 64, 44);
    [showAgainBtn addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:showAgainBtn];
    
}
-(void)loadData{
    self.cellNumber = 15;
    [self.tableView reloadData];
    //显示动画
    [LYPTableViewAnimationKit LYP_showAnimationType:self.indexPath.row tableView:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellidentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(10, 5,width, 35);
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 5;
        view.backgroundColor = [UIColor orangeColor];
        UILabel *label = [[UILabel alloc]init];
        label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        label.backgroundColor = [UIColor clearColor];
        label.frame = CGRectMake(0, 0, width, 35);
        [view addSubview:label];
        [cell.contentView addSubview:view];
    }
    return cell;
}

@end
