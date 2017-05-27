//
//  DrawBoardManager.m
//  DrawBoardDemo
//
//  Created by suxx on 17/5/27.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "DrawBoardManager.h"
#import <Masonry.h>

@implementation DrawBoardManager

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithBackgroundImage:(UIImage *)bgImage
{
    self = [super init];
    if (self) {
        [self prepareForSubViewWithBackgroundImage:bgImage];
    }
    return self;
}

#pragma mark - Delegate

#pragma mark - Event Handle

#pragma mark - Private Method
-(void)prepareForSubViewWithBackgroundImage:(UIImage *)bgImage{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = bgImage;
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    
    __weak typeof(self) weakSelft = self;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(weakSelft);
    }];
    
    self.drawBoardUtil = [[DrawBoardUtil alloc] initWithBackgroundImage:bgImage];
    self.drawBoardUtil.lineColor = [UIColor whiteColor];
    self.drawBoardUtil.lineWidth = 5;
    [self addSubview:self.drawBoardUtil];
    
    [self.drawBoardUtil mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(weakSelft);
    }];
    
    NSArray *titles = @[@"画图", @"撤销", @"重画" , @"橡皮檫", @"保存"];
    float y = 300;
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(30, y, 80, 30);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        y += 50;
    }
    
}

-(void)buttonAction:(UIButton *)btn{
    NSUInteger tag = btn.tag - 100;
    if (tag == 0) {
        [self.drawBoardUtil draw];
    }else if(tag == 1){
        [self.drawBoardUtil undo];
    }else if(tag == 2){
        [self.drawBoardUtil clear];
    }else if(tag == 3){
        [self.drawBoardUtil eraser];
    }else if(tag == 4){
        [self.drawBoardUtil save];
    }
}

#pragma mark - Public Method

#pragma mark - Getter 和 Setter

@end
