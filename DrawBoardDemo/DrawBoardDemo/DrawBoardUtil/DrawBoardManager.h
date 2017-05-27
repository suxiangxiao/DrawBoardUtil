//
//  DrawBoardManager.h
//  DrawBoardDemo
//
//  Created by suxx on 17/5/27.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawBoardUtil.h"

@interface DrawBoardManager :UIView

- (instancetype)initWithBackgroundImage:(UIImage *)bgImage;

@property (nonatomic, strong)DrawBoardUtil *drawBoardUtil;

@end
