//
//  ViewController.m
//  DownloadManagerDemo
//
//  Created by 刘超 on 15/7/9.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LCDownloadManager.h"
#import "AFNetworking.h"

#define VIDEO_URL @"http://mw5.dwstatic.com/1/3/1528/133489-99-1436409822.mp4"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong) AFHTTPRequestOperation *operation;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.progressView.progress = 0;
}

- (IBAction)downloadBtnClicked {
    
    self.operation = [LCDownloadManager downloadFileWithURLString:VIDEO_URL cachePath:@"demo1.mp4" progressBlock:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
        
        NSLog(@"1--%f %f %f", progress, totalMBRead, totalMBExpectedToRead);
        self.progressView.progress = progress;
        
    } successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"1--Download finish");
        
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error.code == -999) NSLog(@"1--Maybe you pause download.");
        
        NSLog(@"1--%@", error);
    }];
    
//    [LCDownloadManager downloadFileWithURLString:@"http://mw2.dwstatic.com/2/8/1528/133366-99-1436362095.mp4" cachePath:@"demo2.mp4" progressBlock:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
//        
//        NSLog(@"2--%f %f %f", progress, totalMBRead, totalMBExpectedToRead);
//        
//    } successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"2--Download finish");
//        
//    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        if (error.code == -999) NSLog(@"1--Maybe you pause download. %@", error);
//        
//        NSLog(@"2--%@", error);
//    }];
}

- (IBAction)pauseBtnClicked {
    
    [LCDownloadManager pauseWithOperation:self.operation];
}

@end
