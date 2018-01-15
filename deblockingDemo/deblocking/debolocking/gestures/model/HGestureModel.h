//
//  HGestureModel.h
//  deblocking
//
//  Created by yupeng on 16/10/26.
//  Copyright © 2016年 yupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGestureModel : NSObject

/*
    密码
 */
@property (nonatomic,strong) NSString *pwdString;

/* 
    设置密码
 */
- (void)setPWD:(NSString *)pwdString;

/*
    清楚密码
 */
- (void)clearPWD;

- (id)init;

@end
