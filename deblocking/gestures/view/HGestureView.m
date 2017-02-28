
//
//  HGestureView.m
//  deblocking
//
//  Created by 🐷 on 16/10/27.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "HGestureView.h"
#import "HGestureModel.h"

@interface HGestureView ()

/**
    选中按钮
 */
@property (nonatomic,strong) NSMutableArray *selectedBtnArray;

/**
    当前触控点
 */
@property (nonatomic,assign) CGPoint currPoint;

/**
    是否完成连接
 */
@property (nonatomic,assign) BOOL isFinshed;
@end

@implementation HGestureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame bgViewImage:(NSString *)imageName{
    self = [super initWithFrame:frame];
    
    self.selectedBtnArray = [NSMutableArray array];
    
    self.backgroundColor = [UIColor clearColor];
    
    [self configer];
    
    return self;
}


- (void)configer{
    // 给当前自己添加一个拖动的手势
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    
    [self addGestureRecognizer:panGes];
    
    // 列数
    NSInteger row = 3;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = 74;
    CGFloat hight = 74;
    CGFloat space = (self.frame.size.width - 3 * width)/(4);
    
    NSInteger row1 = 0;
    NSInteger section = 0;
    CGRect frame;
    
    // 添加手势按钮控件
    for (int i = 0; i < 9; i++) {
        
        row1 = i % row;
        section = i / row;
        
        x = space + row1 *(space + width);
        y = space + section * (space + width);
        
        frame = CGRectMake(x, y, width, hight);
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = frame;

        btn.tag = (i+1);    // 设置tag用户检查手势解锁
        
        btn.userInteractionEnabled = NO;    // 不让用户点击, 防止点击显示高亮状态
        
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        [self addSubview:btn];
    }
}


/**
 *	@brief	手势监听事件
 *
 *	@param 	ges 	手势
 */
- (void)panGes:(UIGestureRecognizer *)ges {
    
    // 获取当前触摸点
    self.currPoint = [ges locationInView:self];
    
    // 判断当前触摸点是否在按钮上
    for (UIButton *btn in self.subviews) {
        
        // 判断触摸点是否在矩形区域
        if(CGRectContainsPoint(btn.frame, self.currPoint)) {
            
            //并且当前按钮没有被选中
            if(btn.selected == NO) {
                
                // 点在按钮上
                btn.selected = YES; // 设置为选中
                
                [self.selectedBtnArray addObject:btn];  // 添加到选中按钮数组中
                
            }else { // 如果是被选中
                // 并且是倒数第二个选中的, 那么将可以回退
                if(self.selectedBtnArray.count > 1 && btn == self.selectedBtnArray[self.selectedBtnArray.count-2]) {
                    
                    // 取消选中最有一个选中的按钮
                    UIButton *btn = [self.selectedBtnArray lastObject];
                    
                    btn.selected = NO;
                    
                    // 从选中数组中移除
                    [self.selectedBtnArray removeLastObject];
                }
            }
            
        }
    }
    
    // 重绘
    [self setNeedsDisplay];
    
    // 监听手指松开触摸
    if(ges.state == UIGestureRecognizerStateEnded) {
        
        self.isFinshed = YES;
        
    }
}


/**
 验证手势密码是否正确

 @return 验证结果
 */
- (BOOL)checkGesture{
    
    NSMutableString *selectStr = [NSMutableString string];
    
    for (UIButton *btn in self.selectedBtnArray) {
        
        [selectStr appendFormat:@"%ld",(long)btn.tag];
    }
    
    NSString *pwdStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"pwd"];
    
    return [selectStr isEqualToString:pwdStr];
}




/**
 重绘界面

 @param rect 绘制区域
 */
- (void)drawRect:(CGRect)rect {
    
    UIImage *bgImage = [UIImage imageNamed:@"Home_refresh_bg"];
    
    [bgImage drawInRect:rect];
    
    // 如果没有按钮被选中，返回
    if ([self.selectedBtnArray count] == 0) {
        return;
    }
    // 连接选中的点
    UIBezierPath *path = [UIBezierPath bezierPath];

    for (NSInteger i = 0; i < [self.selectedBtnArray count]; i ++) {
        
        UIButton *btn = self.selectedBtnArray[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
            [path addLineToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    
    // 是否松开手指
    if (self.isFinshed) {
        if ([self checkGesture]) {
            // 密码正确，解锁成功
            [[UIColor blueColor] setStroke];
            
            if (self.verifyGestureSuccess) {
                self.verifyGestureSuccess();
            }
        }else{
            // 密码不对，解锁失败
            [[UIColor redColor]set];
            
            if (self.verifyGestureFaild) {
                self.verifyGestureFaild();
            }
        }
    }else{
        // 连接当前选中按钮
        [path addLineToPoint:self.currPoint];
        
        [[UIColor redColor]setStroke];
    }
    
    path.lineWidth = 10;                    // 设置线宽
    path.lineCapStyle = kCGLineCapRound;   // 线头设置为圆角
    path.lineJoinStyle = kCGLineJoinRound;  // 设置线拐弯圆角
    // 绘制线条
    [path stroke];
//    [path fill];
    
//     UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100 , 100)];
//    [path addLineToPoint:CGPointMake(200, 100)];
//    [path stroke];
}


///**
// *	@brief	重绘方法, 每次调用都会重新刷新页面, 覆盖之前的页面重新绘制
// *
// *	@param 	rect 	区域
// */
//- (void)drawRect:(CGRect)rect {
//    
//    // 如果没有被选中的按钮, 则不用重新绘制
//    if(self.selectedBtnArray.count == 0) return;
//    
//    // 把所有选中按钮的中心点连线
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    NSInteger count = self.selectedBtnArray.count;
//    
//    for (int i = 0; i < count; i++) {
//        
//        UIButton *btn = self.selectedBtnArray[i];
//        
//        // 如果是起点
//        if(i == 0) {
//            
//            [path moveToPoint:btn.center];
//            
//        }else {
//            
//            [path addLineToPoint:btn.center];
//            
//        }
//    }
//    
//    // 判断是否松开手指
//    if(self.isFinshed) {
//        
//        
//        
//        if([self checkGesture]) { // 解锁成功
//            
//            [[UIColor blueColor] set];
//            
//            // 如果实现了解锁成功的代理方法
////            if([self.delegate respondsToSelector:@selector(gestureViewUnlockSuccess:)]) {
////                
////                [self.delegate gestureViewUnlockSuccess:self];
//                NSLog(@"成功");
////            }
//            
//        }else { // 解锁失败
//            
//            [[UIColor redColor] set];
//        }
//        
//    }else {
//        
//        // 将路径描绘到当前的触摸点
//        [path addLineToPoint:self.currPoint];
//        
//        // 设置绘制颜色
//        [[UIColor greenColor] set];
//    }
//    
//    // 线宽
//    [path setLineWidth:10];
//    // 线端圆角
//    [path setLineCapStyle:kCGLineCapRound];
//    // 线转角圆角
//    [path setLineJoinStyle:kCGLineJoinRound];
//    
//    // 根据路径渲染
//    [path stroke];
//}


// 点击屏幕时，重绘界面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.isFinshed = NO;
    
    for (UIButton *btn in self.selectedBtnArray) {
        btn.selected = NO;
    }
    
    [self.selectedBtnArray removeAllObjects];
    
    // 重新绘制按钮
    [self setNeedsDisplay];
}

@end
