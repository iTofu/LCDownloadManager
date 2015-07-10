## LCDownloadManager
一个简单易用的的下载助手。依赖于AFN，实现断点续传，采取Block方式回调下载进度、文件大小、下载是否完成等。


### 前言 Foreword
一个用来处理下载的库，基于AFN，实现了好几个东西，时间有限暂不一一说明，具体看代码。


### 代码 Code
* 把LCDownloadManager文件夹(在Demo中)拖到你的项目中。
* 在相应位置导入头文件: `#import "LCDownloadManager.h"`和`#import "AFNetworking.h"`。
* 调用下面的方法即可:
    ```objc
    // 当前下载任务
    AFHTTPRequestOperation *operation = nil;
    
    // 下载(提供了类方法和实例方法，根据使用习惯调用)
    operation = [LCDownloadManager downloadFileWithURLString:@"http://mw2.dwstatic.com/2/8/1528/133366-99-1436362095.mp4" cachePath:@"demo2.mp4" progressBlock:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
        
        // totalMBRead 和 totalMBExpectedToRead 单位是MB
        NSLog(@"%f %f %f", progress, totalBytesRead, totalBytesExpectedToRead);
        
    } successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Download finish");
        
    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error.code == -999) NSLog(@"Maybe you pause download.");
        
        NSLog(@"%@", error);
    }];
    
    // 暂停(提供了类方法和实例方法，根据使用习惯调用)
    [[LCDownloadManager pauseWithOperation:operation];];
    ```


### 更新日志 2015.07.10 Update Logs
* *修复一个重要BUG。这个BUG导致多任务下载时，不能正常暂停对应任务。
* 提供类方法和实例方法，根据使用习惯调用。


### 联系 Support
* 发现问题请lssues我，谢谢:)
* Email:leoios@sina.com
* Blog: http://www.leodong.com/


### 授权 License
本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
