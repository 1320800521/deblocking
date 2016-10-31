//
//  HGestureModel.m
//  deblocking
//
//  Created by 🐷 on 16/10/26.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "HGestureModel.h"

#define KDEFAULTS [NSUserDefaults standardUserDefaults]

@implementation HGestureModel

- (id)init{
    self = [super init];
    if (self) {
        self.pwdString = [NSString string];
        self.pwdString = [KDEFAULTS objectForKey:@"pwd"];
    }
    return self;
}

- (void)setPWD:(NSString *)pwdString{
    
    [KDEFAULTS setObject:pwdString forKey:@"pwd"];
    
    [KDEFAULTS synchronize];
}

- (void)clearPWD{
    
//    KDEFAULTS
    [KDEFAULTS setObject:@"" forKey:@"pwd"];
    
}

@end
