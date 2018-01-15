//
//  GestureViewController.m
//  deblocking
//
//  Created by yupeng on 2017/3/20.
//  Copyright © 2017年 yupeng. All rights reserved.
//

#import "GestureViewController.h"
#import "HGestureView.h"
#import "HGestureModel.h"

@interface GestureViewController ()

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HGestureModel *model = [[HGestureModel alloc]init];
    
    [model setPWD:@"123654"];
    
    HGestureView *gestureView = [[HGestureView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) bgViewImage:@""];
    [self.view addSubview:gestureView];
    
    gestureView.verifyGestureSuccess = ^{
        NSLog(@"验证成功");
        
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"手势验证成功" message:@"提示" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"手势验证成功" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alter addAction:okAction];
        
        
        [self presentViewController:alter animated:YES completion:^{
            
        }];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    
    gestureView.verifyGestureFaild = ^{
        NSLog(@"验证失败");
        
        
       UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"手势验证失败" message:@"提示" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"手势验证失败" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alter addAction:okAction];
        
        
        [self presentViewController:alter animated:YES completion:^{
            
        }];
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
