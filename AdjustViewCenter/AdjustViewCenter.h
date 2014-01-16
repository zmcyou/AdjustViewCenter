//
//  AdjustViewCenter.h
//  SignContract
//
//  Created by Zhang Cheng on 14-1-16.
//  Copyright (c) 2014年 Zhang Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjustViewCenter : NSObject

@property (strong, nonatomic) UIView *targetView;
@property (assign, nonatomic) CGFloat adjustHeight;

+ (id)initWithTargetView:(UIView *)targetView andAdjustHeight:(CGFloat)height;

- (id)initWithTargetView:(UIView *)targetView andAdjustHeight:(CGFloat)height;

- (void)removeNotification;
- (void)addNotification;

@end
