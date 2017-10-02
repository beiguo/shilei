//
//  MessagesViewController.m
//  dickyMessage
//
//  Created by Dick on 2017/9/12.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "MessagesViewController.h"
#import "DViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DViewController *vc = [DViewController new];
    vc.mvc = self;
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
    [self.view.topAnchor constraintEqualToAnchor:vc.view.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:vc.view.bottomAnchor].active = YES;
    [self.view.leftAnchor constraintEqualToAnchor:vc.view.leftAnchor].active = YES;
    [self.view.rightAnchor constraintEqualToAnchor:vc.view.rightAnchor].active = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Conversation Handling

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the inactive to active state.
    // This will happen when the extension is about to present UI.
    
    // Use this method to configure the extension and restore previously stored state.
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the active to inactive state.
    // This will happen when the user dissmises the extension, changes to a different
    // conversation or quits Messages.
    
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough state information to restore your extension to its current state
    // in case it is terminated later.
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when a message arrives that was generated by another instance of this
    // extension on a remote device.
    
    // Use this method to trigger UI updates in response to the message.
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user taps the send button.
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user deletes the message without sending it.
    
    // Use this to clean up state related to the deleted message.
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called before the extension transitions to a new presentation style.
    
    // Use this method to prepare for the change in presentation style.
    for (UIViewController *child in self.childViewControllers) {
        [child willMoveToParentViewController:nil];
        [child.view removeFromSuperview];
        [child removeFromParentViewController];
    }
    
    DViewController *vc = [DViewController new];
    if (presentationStyle == MSMessagesAppPresentationStyleCompact) {
        vc.isExpand = NO;
    }else {
        vc.isExpand = YES;
    }
    
    vc.mvc = self;
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
    [self.view.topAnchor constraintEqualToAnchor:vc.view.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:vc.view.bottomAnchor].active = YES;
    [self.view.leftAnchor constraintEqualToAnchor:vc.view.leftAnchor].active = YES;
    [self.view.rightAnchor constraintEqualToAnchor:vc.view.rightAnchor].active = YES;
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called after the extension transitions to a new presentation style.
    
    // Use this method to finalize any behaviors associated with the change in presentation style.
}

@end