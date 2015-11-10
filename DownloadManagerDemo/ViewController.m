//
//  ViewController.m
//  DownloadManagerDemo
//
//  Created by 刘超 on 15/7/9.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LCDownloadManager.h"

#define VIDEO_URL @"http://mw5.dwstatic.com/1/3/1528/133489-99-1436409822.mp4"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) AFHTTPRequestOperation *operation1;

@property (nonatomic, assign, getter=isNowDownload) BOOL nowDownload;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.progressView.progress = 0;
}

- (IBAction)downloadBtnClicked {
    
    // 禁止重复下载
    if (self.isNowDownload) return;
    
    self.nowDownload = YES;
    
    // 任务1
    self.operation1 = [LCDownloadManager downloadFileWithURLString:VIDEO_URL cachePath:@"demo1.mp4" progress:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
        
        NSLog(@"Task1 -> progress: %.2f -> download: %fMB -> all: %fMB", progress, totalMBRead, totalMBExpectedToRead);
        self.progressView.progress = progress;
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Task1 -> Download finish");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error.code == -999) NSLog(@"Task1 -> Maybe you pause download.");
        
        NSLog(@"Task1 -> %@", error);
    }];
    
//    // 任务2
//    [LCDownloadManager downloadFileWithURLString:@"http://mw2.dwstatic.com/2/8/1528/133366-99-1436362095.mp4" cachePath:@"demo2.mp4" progressBlock:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
//        
//        NSLog(@"Task2 -> progress: %.2f -> download: %fMB -> all: %fMB", progress, totalMBRead, totalMBExpectedToRead);
//        
//    } successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"Task2 -> Download finish");
//        
//    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        if (error.code == -999) NSLog(@"Task2 -> Maybe you pause download.");
//        
//        NSLog(@"Task2 -> %@", error);
//    }];
}

- (IBAction)pauseBtnClicked {
    
    self.nowDownload = NO;
    
    // 暂停任务1
    [LCDownloadManager pauseWithOperation:self.operation1];
}

@end
