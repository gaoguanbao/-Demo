//
//  PopTransition.m
//  NavigationTransitionAnimationDemo
//
//  Created by 杨晴贺 on 29/10/2016.
//  Copyright © 2016 silence. All rights reserved.
//

#import "PopTransition.h"

@implementation PopTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.8f ;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] ;
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] ;
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc] ;
    CGRect bounds = [UIScreen mainScreen].bounds ;
    
    toVc.view.frame = CGRectOffset(finalFrameForVc, 0, -bounds.size.height) ;
    
    [[transitionContext containerView]addSubview:toVc.view] ;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVc.view.alpha = 0.8;
                         toVc.view.frame = finalFrameForVc;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         fromVc.view.alpha = 1.0;
                     }];
}

@end
