# deblocking
2 lines of code to integrate fingerprint unlock password to unlock and gestures, safe and reliable



/Users/xiaozhu/Desktop/pod 开源/deblocking/效果图.gif


// 指纹解锁 验证
- (void)verifyTouchid:(UIButton *)btn{
HTouchID *touchid = [HTouchID initHTouchID];
[touchid verifyTouchid];



touchid.verifysuccess = ^{

NSLog(@"成功");

指纹验证成功，在这里进行自己的操作回调

};

touchid.verifyFaild = ^(NSError *error){
NSLog(@"error is %@",error);
指纹验证失败，在这里进行自己的操作回调
};
}



// 手势锁验证
HGestureModel *model = [[HGestureModel alloc]init];

[model setPWD:@"123654"];

HGestureView *gestureView = [[HGestureView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) bgViewImage:@""];
[self.view addSubview:gestureView];

gestureView.verifyGestureSuccess = ^{
NSLog(@"验证成功");
验证成功，在这里进行自己的操作回调
}];

[self dismissViewControllerAnimated:YES completion:^{

}];
};

gestureView.verifyGestureFaild = ^{
NSLog(@"验证失败");
验证失败，在这里进行自己的操作回调

};
}
