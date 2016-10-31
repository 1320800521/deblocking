//
//  HTouchID.h
//  deblocking
//
//  Created by 🐷 on 16/10/26.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTouchID : NSObject

/*
 验证指纹，解锁成功
 */
@property (nonatomic,assign) void(^verifysuccess)(void);
/*
    验证失败
 */
@property (nonatomic,assign) void (^verifyFaild)(NSError *error);
/*
    设备不支持
 */
@property (nonatomic,assign) void (^notSupport)(void);

// 初始化
+ (instancetype)initHTouchID;


- (void)verifyTouchid;

@end




