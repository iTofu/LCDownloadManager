## LCDownloadManager
一个简单易用的的下载助手。依赖于AFN，实现断点续传，采取Block方式回调下载进度、文件大小、下载是否完成等。

    ```
    致谢 [AFNetworking](https://github.com/AFNetworking/AFNetworking)！
    基于 [AFNetworking](https://github.com/AFNetworking/AFNetworking) 2.0
    ```


### 前言 Foreword
一个用来处理下载的库，基于AFN，实现了好几个东西，时间有限暂不一一说明，具体看代码。


### 代码 Code
* 
  - 方法一：[CocoaPods](https://cocoapods.org/) 导入：`pod 'LCDownloadManager'`
  - 方法二：把 LCDownloadManager 文件夹 (在 Demo 中) 拖到你的项目中。
* 在相应位置导入头文件: `#import "LCDownloadManager.h"`和`#import "AFNetworking.h"`。
* 调用下面的方法即可:
    ```objc
    // 当前下载任务
    AFHTTPRequestOperation *operation1 = nil;
    
    // 下载(提供了类方法和实例方法，根据使用习惯调用)
    operation1 = [LCDownloadManager downloadFileWithURLString:@"http://mw2.dwstatic.com/2/8/1528/133366-99-1436362095.mp4" cachePath:@"demo2.mp4" progress:^(CGFloat progress, CGFloat totalMBRead, CGFloat totalMBExpectedToRead) {
        
        // totalMBRead 和 totalMBExpectedToRead 单位是MB
        NSLog(@"Task1 -> progress: %.2f -> download: %fMB -> all: %fMB", progress, totalMBRead, totalMBExpectedToRead);
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Task1 -> Download finish");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error.code == -999) NSLog(@"Task1 -> Maybe you pause download.");
        
        NSLog(@"Task1 -> %@", error);
    }];
    
    // 暂停(提供了类方法和实例方法，根据使用习惯调用)
    [[LCDownloadManager pauseWithOperation:operation1];];
    ```


### 更新日志 2015.11.10 Update Logs (Tag: 1.0.1)
* 添加对 [CocoaPods](https://cocoapods.org/) 的支持：`pod 'LCDownloadManager'`
* Demo 中添加演示如何防止用户重复点击下载，后续抽时间在库中实现。


### 更新日志 2015.07.10 Update Logs (Tag: 1.0.0)
* 修复一个重要BUG。这个BUG导致多任务下载时，不能正常暂停对应任务。
* 提供类方法和实例方法，根据使用习惯调用。


### 联系 Support
* 发现问题请Issues我，谢谢:)
* Email:leoios@sina.com
* Blog: http://www.leodong.com/


### 授权 License
本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
