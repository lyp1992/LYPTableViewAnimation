//
//  LYPTableViewAnimationKit.m
//  YPTableViewAnimal
//
//  Created by laiyp on 2018/9/27.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import "LYPTableViewAnimationKit.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define LYP_screenWidth [UIScreen mainScreen].bounds.size.width
#define LYP_screebHeight [UIScreen mainScreen].bounds.size.height

@implementation LYPTableViewAnimationKit

+(void)LYP_showAnimationType:(LYPTableViewAnimationType)animationType tableView:(UITableView *)tableView{
    

    unsigned int count = 0;
    Method *methodList = class_copyMethodList(object_getClass([self class]), &count);
    int tag = 0;
    for (int i = 0; i<count; i++) {
        Method method = methodList[i];
        SEL selector = method_getName(method);
        NSString *methodName = NSStringFromSelector(selector);
        if ([methodName rangeOfString:@"AnimationTableView"].location != NSNotFound) {
            if (tag == animationType) {
                ((void (*)(id,SEL,UITableView*))objc_msgSend)(self,selector,tableView);
            }
            tag ++;
        }
    }
    free(methodList);
}

+(void)LYP_moveAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.3;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-LYP_screenWidth, 0);
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
+(void)LYP_moveSpringAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-LYP_screenWidth, 0);
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
+(void)LYP_alphaAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
}
//落体
+(void)LYP_fallAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, -LYP_screebHeight);
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
//从左右两边进来
+(void)LYP_shakeAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        if (i%2 == 0) {
            cell.transform = CGAffineTransformMakeTranslation(-LYP_screenWidth, 0);
        }else{
            cell.transform =CGAffineTransformMakeTranslation(LYP_screenWidth, 0);
        }
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
//翻牌
+(void)LYP_overTurnAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.layer.opacity = 0.0;
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        NSTimeInterval totatime = 0.7;
        [UIView animateWithDuration:totatime delay:i*(totatime/cells.count) options:0 animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
//从底部
+(void)LYP_toTopAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i<cells.count; i++) {
        NSTimeInterval totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, LYP_screebHeight);
        [UIView animateWithDuration:totalTime delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
+(void)LYP_springListAnimationTableView:(UITableView *)tableView{
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.layer.opacity = 0.7;
        cell.layer.transform = CATransform3DMakeTranslation(0, -LYP_screebHeight, 20);
        NSTimeInterval totalTime = 1.0;
        
        [UIView animateWithDuration:0.4 delay:i*(totalTime/cells.count) usingSpringWithDamping:0.65 initialSpringVelocity:1/0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
        } completion:^(BOOL finished) {
            
        }];
    }
}
+(void)LYP_shrinkToTopAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
        cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}
//类似平铺
+(void)LYP_layDownAnimationTableView:(UITableView *)tableView{
    NSArray *cells = tableView.visibleCells;
    NSMutableArray *rectArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y = i * 10;
        cell.frame = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i*5);
    }
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
        [UIView animateWithDuration:(totalTime/cells.count) * i animations:^{
            cell.frame = rect;
        } completion:^(BOOL finished) {
            cell.layer.transform = CATransform3DIdentity;
        }];
    }
}
//原地旋转
+(void)LYP_roteAnimationTableView:(UITableView *)tableView{
    
    NSArray *cells = tableView.visibleCells;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue = @(-M_PI);
    animation.toValue = 0;
    animation.duration = 0.2;
    animation.removedOnCompletion = NO;
    animation.repeatCount = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    for (int i = 0; i<cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.1 delay:i*0.25 options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) {
            [cell.layer addAnimation:animation forKey:@"rotationYkey"];
        }];
    }
}


@end
