//
//  ViewController.m
//  h5game
//
//  Created by shilei on 2017/9/19.
//  Copyright © 2017年 shilei. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>


@interface ViewController ()

@property(nonatomic, strong)WKWebView* webV;
@property(nonatomic, strong)UIButton* inBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createWebView];
    [self createInBtn];
}


-(void)createWebView{
    self.webV = [[WKWebView alloc]initWithFrame:self.view.frame];
    NSString* path = [[NSBundle mainBundle]pathForResource:@"inApp" ofType:@"html"];
    [self.webV loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:path]]];
    [self.view addSubview:self.webV];
}

-(void)createInBtn{
    self.inBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.inBtn.frame = CGRectMake((self.webV.bounds.size.width*0.4)/2, self.view.bounds.size.height-150, self.view.bounds.size.width*0.6, 50);
    self.inBtn.layer.borderWidth = 2;
    self.inBtn.layer.cornerRadius = 25;
    self.inBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.inBtn setTitle:@"Enter" forState:UIControlStateNormal];
    [self.inBtn addTarget:self action: @selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    self.inBtn.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.inBtn];
}

-(void)goNext{
    [self performSegueWithIdentifier:@"goNext" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goNext:(id)sender {
    
    [self performSegueWithIdentifier:@"goNext" sender:nil];
}

@end
