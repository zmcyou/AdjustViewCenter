//
//  AVViewController.m
//  AdjustViewCenter
//
//  Created by Zhang Cheng on 14-1-16.
//  Copyright (c) 2014年 Zhang Cheng. All rights reserved.
//

#import "AVViewController.h"

//引用头文件
#import "AdjustViewCenter.h"

@interface AVViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) AdjustViewCenter *adjustView;//声明调整对象

@end

@implementation AVViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    把将要调整的view及调整数值传入，该类会自动判断是否需要alloc
    self.adjustView = [AdjustViewCenter initWithTargetView:self.view andAdjustHeight:80];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self viewWillDisappear:animated];
//    不论是否存在，置空
    self.adjustView = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
