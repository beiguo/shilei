//
//  GameWebView.m
//  h5game
//
//  Created by shilei on 2017/9/19.
//  Copyright © 2017年 shilei. All rights reserved.
//

#import "GameWebView.h"
#import <WebKit/WebKit.h>

@interface GameWebView () <WKUIDelegate,WKNavigationDelegate>
@property(nonatomic, strong)WKWebView* webView;
@end

@implementation GameWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
}

-(void)createWebView{
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    NSString* path = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    
    NSURLRequest* request = [[NSURLRequest alloc]initWithURL:[NSURL fileURLWithPath:path]];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.webView loadRequest:request];
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
