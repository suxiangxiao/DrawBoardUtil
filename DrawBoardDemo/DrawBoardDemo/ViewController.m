//
//  ViewController.m
//  DrawBoardDemo
//
//  Created by suxx on 17/5/27.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoardUtil.h"
#import <Masonry.h>
#import "DrawBoardManager.h"

@interface ViewController ()

@property (nonatomic, strong)DrawBoardManager *DBManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.DBManager = [[DrawBoardManager alloc] initWithBackgroundImage:[UIImage imageNamed:@"test"]];
    [self.view addSubview:self.DBManager];
    [self.DBManager mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
