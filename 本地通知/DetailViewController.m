
//
//  DetailViewController.m
//  本地通知
//
//  Created by 韩俊强 on 16/2/28.
//  Copyright © 2016年 韩俊强. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userInfoContent;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     self.userInfoContent.text = self.userInfo[@"body"];
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
    _userInfo = userInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
