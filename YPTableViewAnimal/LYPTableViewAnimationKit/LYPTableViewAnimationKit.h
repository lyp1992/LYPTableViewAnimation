//
//  LYPTableViewAnimationKit.h
//  YPTableViewAnimal
//
//  Created by laiyp on 2018/9/27.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LYPTableViewAnimationKitConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYPTableViewAnimationKit : NSObject

+(void)LYP_showAnimationType:(LYPTableViewAnimationType)animationType tableView:(UITableView*)tableView;

+(void)LYP_moveAnimationTableView:(UITableView *)tableView;
+(void)LYP_moveSpringAnimationTableView:(UITableView *)tableView;
+(void)LYP_alphaAnimationTableView:(UITableView *)tableView;
+(void)LYP_fallAnimationTableView:(UITableView *)tableView;
+(void)LYP_shakeAnimationTableView:(UITableView *)tableView;
+(void)LYP_overTurnAnimationTableView:(UITableView *)tableView;
+(void)LYP_toTopAnimationTableView:(UITableView *)tableView;
+(void)LYP_springListAnimationTableView:(UITableView *)tableView;
+(void)LYP_shrinkToTopAnimationTableView:(UITableView *)tableView;
+(void)LYP_layDownAnimationTableView:(UITableView *)tableView;
+(void)LYP_roteAnimationTableView:(UITableView *)tableView;


@end

NS_ASSUME_NONNULL_END
