//
//  AppDelegate.m
//  本地通知
//
//  Created by 韩俊强 on 16/2/28.
//  Copyright © 2016年 韩俊强. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //注册本地通知
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }

//    NSLog(@"-----didFinishLaunchingWithOptions---");
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 64, 320, 100);
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:11];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.text = [launchOptions description];
    [[[self.window.rootViewController.childViewControllers firstObject] view]addSubview:label];
    
    UILocalNotification *note = launchOptions[UIApplicationLaunchOptionsURLKey];
    if (note) {
        label.text = @"点击本地通知启动的程序";
    }else{
        label.text = @"直接点击app图标启动的程序";
    }
    self.label = label;
    return YES;
}
/**
 * 当用户点击本地通知进入app的时候调用（app当时并没有被关闭）
 * 若app已关闭不会被调用此方法
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    self.label.text = @"点击通知再次回到前台";
    ViewController *homeVC = [self.window.rootViewController.childViewControllers firstObject];
//    [homeVC performSegueWithIdentifier:@"toHome" sender:notification];
    [homeVC performSegueWithIdentifier:@"toHome" sender:notification];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
