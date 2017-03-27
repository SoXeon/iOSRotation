//
//  LandscapeViewController.m
//  iOSRotation
//
//  Created by DP on 2017/3/23.
//  Copyright © 2017年 DP. All rights reserved.
//

#import "LandscapeViewController.h"
#import "PortraitViewController.h"
#import "NavViewController.h"

@interface LandscapeViewController ()

@property (nonatomic, strong) UIButton *closeLandscapeViewButton;

@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation LandscapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.closeLandscapeViewButton.frame = CGRectMake(0, 60, 88, 44);
    [self.view addSubview:self.closeLandscapeViewButton];
    
    self.pushButton.frame = CGRectMake(0, 120, 88, 44);
    [self.view addSubview:self.pushButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];

}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];

    NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];

}

- (void)closeLandscapeView:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pushVC:(UIButton *)button
{
    PortraitViewController *vc = [PortraitViewController new];
    vc.view.backgroundColor = [UIColor yellowColor];
    if (self.navigationController) {
        //横屏push横屏
        // LandscapeViewController *newLandscapeVC = [LandscapeViewController new];
        // [self.navigationController pushViewController:newLandscapeVC animated:YES];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        LandscapeViewController *newLandscapeVC = [LandscapeViewController new];
        newLandscapeVC.view.backgroundColor = [UIColor greenColor];
        NavViewController * navVC = [[NavViewController alloc] initWithRootViewController:newLandscapeVC];
        [self presentViewController:navVC animated:YES completion:nil];
    }
    
}

- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton setTitle:@"push" forState:UIControlStateNormal];
        [_pushButton setBackgroundColor:[UIColor redColor]];
        [_pushButton addTarget:self action:@selector(pushVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (UIButton *)closeLandscapeViewButton
{
    if (!_closeLandscapeViewButton) {
        _closeLandscapeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeLandscapeViewButton setTitle:@"dismiss" forState:UIControlStateNormal];
        [_closeLandscapeViewButton setBackgroundColor:[UIColor redColor]];
        [_closeLandscapeViewButton addTarget:self action:@selector(closeLandscapeView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeLandscapeViewButton;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (BOOL)shouldAutorotate
{
    return YES;
}


@end
