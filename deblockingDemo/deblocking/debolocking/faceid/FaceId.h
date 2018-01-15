//
//  FaceId.h
//  deblocking
//  Created by yupeng on 2018/1/11.
//  Copyright © 2018年 yupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

typedef void(^FaceidAutnResult)(BOOL result,LAError error,NSString *errorDes);
@interface FaceId : NSObject

/**
 初始化但李磊
 */
+ (instancetype)initHTouchID ;

/**
 验证faceid
 
 @param tipString 提示信息
 @param result 验证结果
 */
+ (void)authFaceIDWithTips:(NSString *)tipString result:(FaceidAutnResult)result ;

/**
 是否支持生物学识别（TouchID FaceID）
 
 @return 是否支持生物识别
 */
+ (BOOL)isSupportBiometrics ;

@end
