//
//  ViewController.m
//  basePrject
//
//  Created by 二哈 on 17/4/27.
//  Copyright © 2017年 二哈. All rights reserved.
//

#import "ViewController.h"
#import "mainViewController.h"
#import "webViewTabBarController.h"
#import "SVProgressHUD.h"
#import "Masonry.h"
#import <AFNetworking/AFNetworking.h>
#define COMPANYURL @"http://169.56.130.9:88/index/index"
#define COMPANYPARA @{@"app_id":@"0"}
@interface mainViewController ()

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgview"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.right.mas_equalTo(0);
    }];
    [SVProgressHUD showWithStatus:@"等待加载"];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    [manager POST:COMPANYURL parameters:COMPANYPARA progress:^(NSProgress * _Nonnull uploadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        NSLog(@"%@",responseObject);
        if (responseObject == NULL) {
            
            [[UIApplication sharedApplication].delegate window].rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"firstVC"];
        } else {
            NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
            [de setObject:responseObject[@"data"] forKey:@"responseObject"];
            [de synchronize];
            webViewTabBarController *web=[[webViewTabBarController alloc] init];
            [[UIApplication sharedApplication].delegate window].rootViewController = web;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            [SVProgressHUD dismiss];
            [[UIApplication sharedApplication].delegate window].rootViewController = [[mainViewController alloc] init];
    }];

}


@end
