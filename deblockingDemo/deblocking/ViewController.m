//
//  ViewController.m
//  deblocking
//
//  Created by 🐷 on 16/10/26.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "ViewController.h"
#import "HTouchID.h"
#import "HGestureView.h"
#import "HGestureModel.h"

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
    
    UIButton *pinSBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pinSBtn.frame = CGRectMake(10, 220, 100, 50);
    [pinSBtn setTitle:@"pin密码解锁" forState:UIControlStateNormal];
    //    touchBtn.backgroundColor = [UIColor redColor];
    [pinSBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [pinSBtn addTarget:self action:@selector(verifypin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pinSBtn];
    
    self.alter = [UIAlertController alertControllerWithTitle:@"😄" message:@"提示" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [self.alter addAction:okAction];
}

- (void)verifyTouchid:(UIButton *)btn{
    HTouchID *touchid = [HTouchID initHTouchID];
    [touchid verifyTouchid];
    
    
    
    touchid.verifysuccess = ^{
        
        NSLog(@"成功");
        
//        [self presentViewController:self.alter animated:YES completion:^{}];
    };
    
    touchid.verifyFaild = ^(NSError *error){
        NSLog(@"error is %@",error);
//        self.alter.message = @"验证失败";
//        [self presentViewController:self.alter animated:YES completion:^{}];
    };
}

- (void)verifyGesture:(UIButton *)btn{

    
    HGestureModel *model = [[HGestureModel alloc]init];
    
    [model setPWD:@"123654"];
    
    HGestureView *gestureView = [[HGestureView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) bgViewImage:@""];
    [self.view addSubview:gestureView];
    
    gestureView.verifyGestureSuccess = ^{
        NSLog(@"验证成功");
    };
    
    gestureView.verifyGestureFaild = ^{
        NSLog(@"验证失败");
    };
    
}

- (void)verifypin:(UIButton *)btn{

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
