//
//  SecondViewController.m
//  iOSRotation
//
//  Created by DP on 2017/3/22.
//  Copyright © 2017年 DP. All rights reserved.
//

#import "SecondViewController.h"
#import "LandscapeViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIButton *presentLandscapeVCButton;
@property (nonatomic, strong) UIButton *pushLandscapeVCButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.presentLandscapeVCButton.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 99, CGRectGetMidY(self.view.frame), 88, 44);
    self.pushLandscapeVCButton.frame = CGRectMake(CGRectGetMidX(self.view.frame) + 11, CGRectGetMidY(self.view.frame), 88, 44);
    
    [self.view addSubview:self.presentLandscapeVCButton];
    [self.view addSubview:self.pushLandscapeVCButton];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)presentLandscapeVC:(UIButton *)button
{
    LandscapeViewController *landscapeVC = [LandscapeViewController new];
    [self.navigationController presentViewController:landscapeVC animated:YES completion:nil];

}

- (void)pushLandscapeVC:(UIButton *)button
{
    [self.navigationController pushViewController:[LandscapeViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (UIButton *)pushLandscapeVCButton
{
    if (!_pushLandscapeVCButton) {
        _pushLandscapeVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushLandscapeVCButton setTitle:@"push" forState:UIControlStateNormal];
        [_pushLandscapeVCButton setBackgroundColor:[UIColor redColor]];
        [_pushLandscapeVCButton addTarget:self action:@selector(pushLandscapeVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushLandscapeVCButton;
}

- (UIButton *)presentLandscapeVCButton
{
    if (!_presentLandscapeVCButton) {
        _presentLandscapeVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_presentLandscapeVCButton setTitle:@"present" forState:UIControlStateNormal];
        [_presentLandscapeVCButton setBackgroundColor:[UIColor redColor]];
        [_presentLandscapeVCButton addTarget:self action:@selector(presentLandscapeVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentLandscapeVCButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
