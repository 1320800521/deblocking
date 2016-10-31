//
//  HTouchID.m
//  deblocking
//
//  Created by 🐷 on 16/10/26.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "HTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation HTouchID
static HTouchID *touchID;
+ (instancetype)initHTouchID {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        touchID = [[self alloc]init];
    });
    return touchID;
}

- (void)verifyTouchid{
    
    
    NSError *error = nil;
    LAContext *context = [[LAContext alloc]init];
    context.localizedFallbackTitle =@"换一个方式验证";
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"已有有指纹" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    if (self.verifysuccess) {
                        self.verifysuccess();
                    }
                }];
                
            } else if (error) {
                
                if (self.verifyFaild) {
                    self.verifyFaild(error);
                }
            }
        }];
        
    } else {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (self.notSupport) {
                    self.notSupport();
                }
            }];
    }
}


@end
