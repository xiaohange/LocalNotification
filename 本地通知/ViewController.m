//
//  ViewController.m
//  本地通知
//
//  Created by 韩俊强 on 16/2/28.
//  Copyright © 2016年 韩俊强. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *schedule;
@property (weak, nonatomic) IBOutlet UIButton *unSchedule;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 调度通知
- (IBAction)schedule:(UIButton *)sender {
   
    // 1.创建通知
    UILocalNotification *ln = [[UILocalNotification alloc]init];
    
    if (ln) {
        // 设置时区
        ln.timeZone = [NSTimeZone defaultTimeZone];
        // 通知第一次发出的时间
        ln.fireDate = [[NSDate date]dateByAddingTimeInterval:5];
        
        // 2.设置通知属性
        ln.soundName = @"click.wav"; // 音效文件名
        // 通知的具体内容
        ln.alertBody = @"重大新闻：小韩哥的博客又更新了，赶快进来看看吧！....";
        
        // 锁屏界面显示的小标题，完整标题：（“滑动来”＋小标题）
        ln.alertAction = @"查看新闻吧";
        
        // 设置app图标数字
        ln.applicationIconBadgeNumber = 10;
        
        // 设置app的额外信息
        ln.userInfo = @{
                        @"icon":@"text.png",
                        @"title":@"重大新闻",
                        @"time":@"2016-02-28",
                        @"body":@"重大新闻：小韩哥的博客又更新了，赶快进来看看吧！"
                        };
        // 设置重启图片
        ln.alertLaunchImage = @"101339g76j7j9t2zgzdvkj.jpg";
       
        // 设置重复发出通知的时间间隔
//        ln.repeatInterval = NSCalendarUnitMinute;
        
        // 3.调度通知（启动任务，在规定的时间发出通知）
        [[UIApplication sharedApplication]scheduleLocalNotification:ln];
        // 直接发出通知没意义
//        [[UIApplication sharedApplication]presentLocalNotificationNow:ln];
    }
    
}
- (IBAction)noSchedule:(UIButton *)sender
{
//    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    // 已经发出且过期的通知会从数组里自动移除
    NSArray *notes = [UIApplication sharedApplication].scheduledLocalNotifications;
    NSLog(@"%@",notes);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UILocalNotification *)note
{
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.userInfo = note.userInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
