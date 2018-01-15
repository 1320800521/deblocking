//
//  FaceId.m
//  deblocking
//
//  Created by yupeng on 2018/1/11.
//  Copyright © 2018年 🐷. All rights reserved.
//

#import "FaceId.h"
#import <LocalAuthentication/LocalAuthentication.h>


static FaceId *FaceID;

LAContext *context;

@implementation FaceId


/**
 初始化但李磊
 */
+ (instancetype)initHTouchID {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FaceID = [[self alloc]init];
        context = [[LAContext alloc]init];
    });
    return FaceID;
}

/**
 验证faceid

 @param tipString 提示信息
 @param result 验证结果
 */
+ (void)authFaceIDWithTips:(NSString *)tipString result:(FaceidAutnResult)result {
    
    if (![self isSupportBiometrics]) {
        result(NO,-1000,@"不支持生物识别");
    }
    
    if (tipString == nil) {
        if ([self isSupportBiometrics]) {
            if (@available(iOS 11.0,*)) {
                if (context.biometryType == LABiometryTypeFaceID) {
                    tipString = @"验证 Face ID";
                }
                
                if (context.biometryType == LABiometryTypeTouchID) {
                    tipString  = @"验证 touch id";
                }
            }else {
                 tipString  = @"验证 touch id";
            }
        }else {
            
            tipString = @"验证设备密码";
        }
    }
    
    // iOS 8 到 iOS 11使用指纹识别
    LAPolicy policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    if (@available(iOS 9.0, *)) {
        policy  = LAPolicyDeviceOwnerAuthentication;
    }
    
    [context evaluatePolicy:policy localizedReason:tipString reply:^(BOOL success, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                result (YES,error.code,error.localizedDescription);
            }else {
                result(NO,error.code,error.localizedDescription);
            }
        });
    }];
    
}


/**
 是否支持生物学识别（TouchID FaceID）

 @return 是否支持生物识别
 */
+ (BOOL)isSupportBiometrics{

    if (@available(iOS 9.0,*)) {
        return  [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:NULL];
    }
    
    return NO;
}

@end
