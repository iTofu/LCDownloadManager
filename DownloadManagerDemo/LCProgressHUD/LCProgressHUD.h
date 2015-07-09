//
//  Created by 刘超 on 15/4/14.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email : leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发Email, 或在该项目的GitHub主页lssues我, 谢谢:)
//
//  活动指示器

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, LCProgressHUDStatus) {
    
    /** 成功 */
    LCProgressHUDStatusSuccess,
    
    /** 失败 */
    LCProgressHUDStatusError,
    
    /** 信息 */
    LCProgressHUDStatusInfo,
    
    /** 加载中 */
    LCProgressHUDStatusWaitting
};

@interface LCProgressHUD : MBProgressHUD

/** 返回一个HUD的单例 */
+ (instancetype)sharedHUD;

/** 在window上添加一个HUD */
+ (void)showStatus:(LCProgressHUDStatus)status text:(NSString *)text;



#pragma mark - 建议使用的方法

/** 在window上添加一个只显示文字的HUD */
+ (void)showText:(NSString *)text;
/** 在window上添加一个提示`信息`的HUD */
+ (void)showInfoText:(NSString *)text;
/** 在window上添加一个提示`失败`的HUD */
+ (void)showFailureText:(NSString *)text;
/** 在window上添加一个提示`成功`的HUD */
+ (void)showSuccessText:(NSString *)text;
/** 在window上添加一个提示`加载中`的HUD, 需要手动关闭 */
+ (void)showLoadingText:(NSString *)text;

/** 手动隐藏HUD */
+ (void)hide;

@end
