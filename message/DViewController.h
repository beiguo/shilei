//
//  DViewController.h
//  TourismMacao
//
//  Created by Dick on 2017/8/28.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagesViewController.h"

@interface DViewController : UIViewController

@property (nonatomic, weak) MessagesViewController *mvc;

@property (nonatomic, assign) BOOL isExpand;

@end
