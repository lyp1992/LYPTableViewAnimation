//
//  UITableView+LYPAnimationKit.m
//  YPTableViewAnimal
//
//  Created by laiyp on 2018/9/27.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import "UITableView+LYPAnimationKit.h"
#import "LYPTableViewAnimationKit.h"
@implementation UITableView (LYPAnimationKit)
+(void)LYP_showAnimationType:(LYPTableViewAnimationType)animationType tableView:(UITableView *)tableView{
    [LYPTableViewAnimationKit LYP_showAnimationType:animationType tableView:tableView];
}
@end
