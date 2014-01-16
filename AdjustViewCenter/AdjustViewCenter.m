//
//  AdjustViewCenter.m
//  SignContract
//
//  Created by Zhang Cheng on 14-1-16.
//  Copyright (c) 2014年 Zhang Cheng. All rights reserved.
//

#import "AdjustViewCenter.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation AdjustViewCenter

+ (id)initWithTargetView:(UIView *)targetView andAdjustHeight:(CGFloat)height
{
    if (ScreenHeight == 480)
        return [[self alloc] initWithTargetView:targetView andAdjustHeight:height];
    return nil;
}

- (id)initWithTargetView:(UIView *)targetView andAdjustHeight:(CGFloat)height
{
    if (self = [super init])
    {
        _targetView = targetView;
        _adjustHeight = height;
        [self addNotification];
    }
    return self;
}

- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustLocationOfViewWhenKeyBoardAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustLocationOfViewWhenKeyBoardDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark UIKeyBoard notification
- (void)adjustLocationOfViewWhenKeyBoardAppear:(NSNotification *)notification
{
    NSTimeInterval timeInterval = [self theAnimationDuration:notification];
    [UIView animateWithDuration:timeInterval animations:^(void){
        self.targetView.center = CGPointMake(self.targetView.center.x, self.targetView.center.y - self.adjustHeight);
    }];
}

- (void)adjustLocationOfViewWhenKeyBoardDisappear:(NSNotification *)notification
{
    NSTimeInterval timeInterval = [self theAnimationDuration:notification];
    [UIView animateWithDuration:timeInterval animations:^(void){
        self.targetView.center = CGPointMake(self.targetView.center.x, self.targetView.center.y + self.adjustHeight);
    }];
}

- (NSTimeInterval)theAnimationDuration:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    return [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
