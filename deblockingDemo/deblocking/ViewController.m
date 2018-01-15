//
//  ViewController.m
//  deblocking
//
//  Created by yupeng on 16/10/26.
//  Copyright © 2016年 yupeng. All rights reserved.
//

#import "ViewController.h"
#import "HTouchID.h"
#import "HGestureView.h"
#import "HGestureModel.h"
#import "GestureViewController.h"
#import "FaceId.h"

@interface ViewController ()

@property (nonatomic,strong) UIAlertController *alter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configer];
   
}

- (void)configer{
    
    UIButton *touchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    touchBtn.frame = CGRectMake(10, 100, 100, 50);
    [touchBtn setTitle:@"指纹解锁" forState:UIControlStateNormal];
//    touchBtn.backgroundColor = [UIColor redColor];
    [touchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [touchBtn addTarget:self action:@selector(verifyTouchid:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchBtn];
    
    UIButton *gesturesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gesturesBtn.frame = CGRectMake(10, 160, 100, 50);
    [gesturesBtn setTitle:@"手势解锁" forState:UIControlStateNormal];
    //    touchBtn.backgroundColor = [UIColor redColor];
    [gesturesBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [gesturesBtn addTarget:self action:@selector(verifyGesture:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gesturesBtn];
    
    UIButton *faceidBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    faceidBtn.frame = CGRectMake(10, 160, 100, 50);
    [faceidBtn setTitle:@"面部识别" forState:UIControlStateNormal];
    //    touchBtn.backgroundColor = [UIColor redColor];
    [faceidBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [faceidBtn addTarget:self action:@selector(verifyFaceid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:faceidBtn];
 
}


- (void)verifyTouchid:(UIButton *)btn{
    HTouchID *touchid = [HTouchID initHTouchID];
    [touchid verifyTouchid];
    
    
    
    touchid.verifysuccess = ^{
        
        NSLog(@"成功");
        
    };
    
    touchid.verifyFaild = ^(NSError *error){
        NSLog(@"error is %@",error);

    };
}

- (void)verifyGesture:(UIButton *)btn{
    
    GestureViewController *gestureVC = [[GestureViewController alloc]init];
    
    [self presentViewController:gestureVC animated:YES completion:^{
        
    }];
    
}

- (void)verifyFaceid {
    
    [FaceId authFaceIDWithTips:@"面部识别" result:^(BOOL result, LAError error, NSString *errorDes) {
        if (result) {
            NSLog(@"识别成功");
        } else {
            NSLog(@"识别失败");
        }
    }];
    
}

- (void)verifypin:(UIButton *)btn{

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
