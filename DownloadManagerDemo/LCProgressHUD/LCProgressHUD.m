//
//  Created by 刘超 on 15/4/14.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email : leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发Email, 或在该项目的GitHub主页lssues我, 谢谢:)
//
//  活动指示器

#import "LCProgressHUD.h"

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE 16.0f

@implementation LCProgressHUD

+ (instancetype)sharedHUD {
    
    static LCProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[LCProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showStatus:(LCProgressHUDStatus)status text:(NSString *)text {
    
    LCProgressHUD *hud = [LCProgressHUD sharedHUD];
    [hud show:YES];
    [hud setLabelText:text];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    switch (status) {
            
        case LCProgressHUDStatusSuccess: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_success"]];
            hud.customView = sucView;
            [hud hide:YES afterDelay:1.6f];
            hud.userInteractionEnabled = YES;
        }
            break;
            
        case LCProgressHUDStatusError: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_error"]];
            hud.customView = errView;
            [hud hide:YES afterDelay:1.6f];
            hud.userInteractionEnabled = YES;
        }
            break;
            
        case LCProgressHUDStatusWaitting: {
            
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.userInteractionEnabled = NO;
        }
            break;
            
        case LCProgressHUDStatusInfo: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_info"]];
            hud.customView = errView;
            [hud hide:YES afterDelay:1.6f];
            hud.userInteractionEnabled = YES;
        }
            break;
            
        default:
            break;
    }
}

+ (void)showText:(NSString *)text {
    
    LCProgressHUD *hud = [LCProgressHUD sharedHUD];
    [hud show:YES];
    [hud setLabelText:text];
    [hud setMinSize:CGSizeZero];
    [hud setMode:MBProgressHUDModeText];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont boldSystemFontOfSize:TEXT_SIZE]];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
}

+ (void)showInfoText:(NSString *)text {
    
    [self showStatus:LCProgressHUDStatusInfo text:text];
}

+ (void)showFailureText:(NSString *)text {
    
    [self showStatus:LCProgressHUDStatusError text:text];
}

+ (void)showSuccessText:(NSString *)text {
    
    [self showStatus:LCProgressHUDStatusSuccess text:text];
}

+ (void)showLoadingText:(NSString *)text {
    
    [self showStatus:LCProgressHUDStatusWaitting text:text];
}

+ (void)hide {
    
    [[LCProgressHUD sharedHUD] hide:YES];
}

@end
