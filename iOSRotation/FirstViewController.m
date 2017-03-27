//
//  FirstViewController.m
//  iOSRotation
//
//  Created by DP on 2017/3/22.
//  Copyright © 2017年 DP. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@property (nonatomic, strong) UIButton *showLandscapeViewButton;
@property (nonatomic, strong) UIView *videoView;
@property (nonatomic, strong) UIButton *closeLandscapeViewButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.showLandscapeViewButton.frame = CGRectMake(CGRectGetMinX(self.view.frame) + 44, CGRectGetMidY(self.view.frame), 88, 44);
    [self.view addSubview:self.showLandscapeViewButton];
    
    self.videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame) * (9.0/16.0))];
    self.videoView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.videoView];
    
    self.closeLandscapeViewButton.frame = CGRectMake(CGRectGetMaxX(self.videoView.frame) - 88, CGRectGetMinY(self.videoView.frame), 88, 44);
    
    [self.videoView addSubview:self.closeLandscapeViewButton];
    self.closeLandscapeViewButton.hidden = YES;
    
}

- (void)rotationView:(UIButton *)button
{
    //旋转前
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI_2);
    CGFloat scale = 0.5;
    transform = CGAffineTransformScale(transform, scale, scale);
    self.videoView.transform = transform;
    
    [UIView animateWithDuration:[[UIApplication sharedApplication] statusBarOrientationAnimationDuration] animations:^{
        self.videoView.transform = CGAffineTransformIdentity;
        self.videoView.frame = self.view.bounds;
        self.videoView.backgroundColor = [UIColor greenColor];
    } completion:^(BOOL finished) {
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
        self.closeLandscapeViewButton.hidden = NO;
    }];

}

- (void)closeLandscapeView:(UIButton *)button
{
    CGFloat scale = 0.5;
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    self.videoView.transform = transform;
    self.videoView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame) * (9.0/16.0));
    self.videoView.transform = CGAffineTransformRotate(transform, M_PI_2);
    self.closeLandscapeViewButton.hidden = YES;

    
    [UIView animateWithDuration:[[UIApplication sharedApplication] statusBarOrientationAnimationDuration]
                     animations:^{
                         self.videoView.transform = CGAffineTransformMakeScale(scale, scale);
                         self.videoView.backgroundColor = [UIColor blueColor];
                     }
                     completion:^(BOOL finished) {
                         self.tabBarController.tabBar.hidden = NO;
                         self.navigationController.navigationBar.hidden = NO;
                     }];
    

}

- (UIButton *)closeLandscapeViewButton
{
    if (!_closeLandscapeViewButton) {
        _closeLandscapeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeLandscapeViewButton setTitle:@"关闭view" forState:UIControlStateNormal];
        [_closeLandscapeViewButton setBackgroundColor:[UIColor redColor]];
        [_closeLandscapeViewButton addTarget:self action:@selector(closeLandscapeView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeLandscapeViewButton;
}

- (UIButton *)showLandscapeViewButton
{
    if (!_showLandscapeViewButton) {
        _showLandscapeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showLandscapeViewButton setTitle:@"旋转view" forState:UIControlStateNormal];
        [_showLandscapeViewButton setBackgroundColor:[UIColor redColor]];
        [_showLandscapeViewButton addTarget:self action:@selector(rotationView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showLandscapeViewButton;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
