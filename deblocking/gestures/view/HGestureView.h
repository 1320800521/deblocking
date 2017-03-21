//
//  HGestureView.h
//  deblocking
//
//  Created by 🐷 on 16/10/27.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HGestureModel;

@interface HGestureView : UIView

/*
 手势密码
 */
@property (nonatomic,strong) HGestureModel *gsetureModel;
/*
    验证成功
 */
@property (nonatomic,copy) void (^verifyGestureSuccess)(void);
/*
    验证手势密码失败
 */
@property (nonatomic,copy) void (^verifyGestureFaild)(void);

/**
 <#Description#>

 @param frame     背景frame
 @param imageName 背景的图片名字

 @return 手势解锁view
 */
- (id)initWithFrame:(CGRect)frame bgViewImage:(NSString *)imageName;

@end
