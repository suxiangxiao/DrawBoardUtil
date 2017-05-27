//
//  DrawBoardUtil.h
//  DrawBoardDemo
//
//  Created by suxx on 17/5/27.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawBoardUtil :UIView

- (instancetype)initWithBackgroundImage:(UIImage *)bgImage;

//线条颜色
@property (nonatomic, strong)UIColor *lineColor;
//线条宽度
@property (nonatomic, assign)uint lineWidth;

/**
 撤销
 */
-(void)undo;
/**
 清屏
 */
-(void)clear;
/**
 保存
 */
-(void)save;
/**
 橡皮檫功能
 */
-(void)eraser;
/**
 画图
 */
-(void)draw;

@end
