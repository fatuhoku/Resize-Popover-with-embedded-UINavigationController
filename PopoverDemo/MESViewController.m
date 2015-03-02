//
//  MESViewController.m
//  PopoverDemo
//
//  Created by Hok Shun Poon on 06/03/2014.
//  Copyright (c) 2014 MakeEatSee. All rights reserved.
//

#import "MESViewController.h"

@interface MESViewController () <UINavigationControllerDelegate>
@property(nonatomic, strong) UIViewController *containerVC;
@end

@implementation MESViewController

// ******************************************************************************************
// Normally, setting preferredContentSize on a contained view controller is sufficient to
// trigger the popover's animated resize.
//
// When using a navigation controller however, this doesn't work.
//
// The trick is to make sure the navigation controller is treated as a child view controller;
// we then manipulate the preferredContentSize of is parentViewController. We do this every
// time the navigation controller is about to present a new view controller through its
// delegate.
//
// In this demo, we accomplish view controller containment by using 'RBStoryboardLink',
// but you can do child view controller containment manually if you like.
// ******************************************************************************************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"content"];
    navigationController.delegate = self;
    
    self.containerVC = [[UIViewController alloc] init];
    [self.containerVC addChildViewController:navigationController];
    [self.containerVC.view addSubview:navigationController.view];
    [navigationController didMoveToParentViewController:self.containerVC];
    
    navigationController.view.translatesAutoresizingMaskIntoConstraints = NO;

    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.containerVC];
}

#pragma mark - Actions

- (IBAction)didTouchUpInsideShowPopoverButton:(UIButton *)sender {
    UIButton *tappedButton = (UIButton *) sender;

    // Present the popover normally, as you would.
    [self.popover presentPopoverFromRect:tappedButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSAssert(self.containerVC, @"Storyboard link should be present.");

    CGSize size = viewController.preferredContentSize;

    // **********************************************************************
    // Here, we set the size, triggering the popover to animate its resizing.
    // **********************************************************************
    NSLog(@"Setting container view controller's preferred content size to %@", NSStringFromCGSize(size));
    
    self.containerVC.preferredContentSize = size;
}

@end