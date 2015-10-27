//
//  UIView+RGSize.h
//  RGFadeView
//
//  Created by Arvin on 15/10/27.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RGSize)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

- (void)topAdd:(CGFloat)add;
- (void)leftAdd:(CGFloat)add;
- (void)widthAdd:(CGFloat)add;
- (void)heightAdd:(CGFloat)add;

@end
