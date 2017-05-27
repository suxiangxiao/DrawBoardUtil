//
//  DrawBoardUtil.m
//  DrawBoardDemo
//
//  Created by suxx on 17/5/27.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "DrawBoardUtil.h"
#import <Masonry.h>

@interface DrawBoardUtil(){
    UIImage *bgImage;//背景图片
}

@property (nonatomic, strong)UIBezierPath *path;
@property (nonatomic, strong)NSMutableArray *paths;
@property (nonatomic, strong)NSMutableArray *colors;
@property (nonatomic, strong)UIColor *pathColor;
@property (nonatomic, assign)uint pathWidth;

@end

@implementation DrawBoardUtil

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithBackgroundImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.lineColor = [UIColor whiteColor];
        self.lineWidth = 2.0f;
        bgImage = image;
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
        [self addGestureRecognizer:panGesture];
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    [self.paths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = self.colors[idx];
        [color set];
        [obj stroke];
    }];
}

#pragma mark - Delegate

#pragma mark - Event Handle
#pragma mark - Private Method
-(void)panGestureAction:(UIPanGestureRecognizer *)pan{
    CGPoint curPoint = [pan locationInView:pan.view];
    if (pan.state == UIGestureRecognizerStateBegan) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:curPoint];
        path.lineWidth = self.pathWidth;
        self.path = path;
        [self.paths addObject:path];
        [self.colors addObject:self.pathColor];
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:curPoint];
        
        //重新绘制页面
        [self setNeedsDisplay];
    }
    NSLog(@"currentPoint:%f", curPoint.x);
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Public Method
-(void)undo{
    if (self.paths.count) {
        [self.paths removeLastObject];
        [self.colors removeLastObject];
        [self setNeedsDisplay];
    }
}
-(void)clear{
    [self.paths removeAllObjects];
    [self.colors removeAllObjects];
    [self setNeedsDisplay];
    [self draw];
}
-(void)save{

}
-(void)eraser{
    self.pathColor = [UIColor colorWithPatternImage:[self imageResize:bgImage andResizeTo:self.bounds.size]];
    self.pathWidth = 15;
}
-(void)draw{
    self.pathColor = self.lineColor;
    self.pathWidth = self.lineWidth;
}

#pragma mark - Getter 和 Setter
-(NSMutableArray *)paths{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    
    return _paths;
}

-(NSMutableArray *)colors{
    if (_colors == nil) {
        _colors = [NSMutableArray array];
    }
    
    return _colors;
}

-(void)setLineColor:(UIColor *)lineColor{
    self.pathColor = lineColor;
    _lineColor = lineColor;
}
-(void)setLineWidth:(uint)lineWidth{
    self.pathWidth = lineWidth;
    _lineWidth = lineWidth;
}


@end
