//
//  PortraitViewController.m
//  iOSRotation
//
//  Created by DP on 2017/3/23.
//  Copyright © 2017年 DP. All rights reserved.
//

#import "PortraitViewController.h"

@interface PortraitViewController ()

@property (nonatomic, strong) UIButton *landscapeViewButton;

@end

@implementation PortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad current self.view. x: %f, y: %f, width: %f, height: %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![self.view.subviews containsObject:self.landscapeViewButton]) {
        self.landscapeViewButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 44, CGRectGetMidY(self.view.bounds), 88, 44);
        [self.view addSubview:self.landscapeViewButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)landscapeAction:(UIButton *)button
{
    if (self.supportedInterfaceOrientations == UIInterfaceOrientationMaskPortrait) {
        [self blackMagicChangeOrientation:UIInterfaceOrientationLandscapeRight];
    } else {
        [self blackMagicChangeOrientation:UIInterfaceOrientationPortrait];
    }
}

- (void)blackMagicChangeOrientation:(UIInterfaceOrientation)orientation
{
    UIViewController *viewController = [[UIViewController alloc] init];
    [viewController setModalPresentationStyle:UIModalPresentationCurrentContext];
    viewController.view.frame = CGRectZero;
    [self.navigationController pushViewController:viewController animated:NO];
    
    NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:orientation];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
    [self.navigationController popViewControllerAnimated:NO];
    
    NSLog(@"current self.view. x: %f, y: %f, width: %f, height: %f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
}



- (UIButton *)landscapeViewButton
{
    if (!_landscapeViewButton) {
        _landscapeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_landscapeViewButton setTitle:@"Rotation" forState:UIControlStateNormal];
        [_landscapeViewButton setBackgroundColor:[UIColor redColor]];
        [_landscapeViewButton addTarget:self action:@selector(landscapeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _landscapeViewButton;
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
