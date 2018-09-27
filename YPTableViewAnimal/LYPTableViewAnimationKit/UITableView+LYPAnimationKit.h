//
//  UITableView+LYPAnimationKit.h
//  YPTableViewAnimal
//
//  Created by laiyp on 2018/9/27.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYPTableViewAnimationKitConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LYPAnimationKit)

+(void)LYP_showAnimationType:(LYPTableViewAnimationType)animationType tableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
